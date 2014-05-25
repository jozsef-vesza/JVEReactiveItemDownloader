//
//  JVEMealGalleryViewModel.m
//  JVEReactiveItemDownloader
//
//  Created by Jozsef Vesza on 26/05/14.
//
//

#import "JVEMealGalleryViewModel.h"
#import "JVEMealProvider.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@implementation JVEMealGalleryViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        RAC(self, model) = [[[JVEMealProvider presentMeals] logError] catchTo:[RACSignal empty]];
    }
    return self;
}

@end
