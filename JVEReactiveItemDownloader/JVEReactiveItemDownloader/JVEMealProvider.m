//
//  JVEMealProvider.m
//  JVEReactiveItemDownloader
//
//  Created by Jozsef Vesza on 25/05/14.
//
//

#import "JVEMealProvider.h"
#import "JVEMeal.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@implementation JVEMealProvider

static NSString *MealURL = @"http://verdant-upgrade-554.appspot.com/soservices/mealmanager";
static NSString *MealImageURL = @"http://verdant-upgrade-554.appspot.com/soservices/mealimageservice?";


+ (RACSignal *)presentMeals {
    NSURLRequest *request = [self mealRequest];
    return [[[[[[NSURLConnection rac_sendAsynchronousRequest:request] reduceEach:^id(NSURLResponse *response, NSData *data) {
        return data;
    }] deliverOn:[RACScheduler mainThreadScheduler]] map:^id(NSData *data) {
        id results = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        return [[[results rac_sequence] map:^id(NSDictionary *mealDictionary) {
            if (mealDictionary[@"image"]) {
                JVEMeal *meal = [JVEMeal new];
                [self configureMeal:meal withDictionary:mealDictionary];
                
                return meal;
            }
            return nil;
        }] array];
    }] publish] autoconnect];
}

+ (NSURLRequest *)mealRequest {
    return [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:MealURL]];
}

+ (void)configureMeal:(JVEMeal *)meal withDictionary:(NSDictionary *)dictionary {
    meal.name = dictionary[@"name"];
    meal.identifier = dictionary[@"identifier"];
    RAC(meal, imageData) = [self downloadImageForMeal:meal];
}

+ (RACSignal *)downloadImageForMeal:(JVEMeal *)meal {
    NSURL *imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@identifier=%@",MealImageURL,meal.identifier]];
    NSURLRequest *request = [NSURLRequest requestWithURL:imageURL];
    
    return [[[NSURLConnection rac_sendAsynchronousRequest:request] reduceEach:^id(NSURLResponse *response, NSData *data) {
        return data;
    }] deliverOn:[RACScheduler mainThreadScheduler]];
}

@end
