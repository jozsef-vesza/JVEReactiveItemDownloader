//
//  JVEMealProvider.h
//  JVEReactiveItemDownloader
//
//  Created by Jozsef Vesza on 25/05/14.
//
//

#import <Foundation/Foundation.h>
@class RACSignal;

@interface JVEMealProvider : NSObject

+ (RACSignal *)presentMeals;

@end
