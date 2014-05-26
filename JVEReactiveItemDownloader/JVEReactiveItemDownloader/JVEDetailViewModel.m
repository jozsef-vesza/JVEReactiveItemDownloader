//
//  JVEDetailViewModel.m
//  JVEReactiveItemDownloader
//
//  Created by Jozsef Vesza on 26/05/14.
//
//

#import "JVEDetailViewModel.h"
#import "JVEMeal.h"

@implementation JVEDetailViewModel

- (instancetype)initWithModel:(JVEMeal *)meal {
    self = [super init];
    if (self) {
        _model = meal;
    }
    return self;
}

- (NSString *)mealName {
    return self.model.name;
}

- (NSData *)imageData {
    return self.model.imageData;
}

@end
