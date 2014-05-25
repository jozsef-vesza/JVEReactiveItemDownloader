//
//  JVEMeal.h
//  JVEReactiveItemDownloader
//
//  Created by Jozsef Vesza on 25/05/14.
//
//

#import <Foundation/Foundation.h>

@interface JVEMeal : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSNumber *identifier;
@property (nonatomic, strong) NSData *imageData;

@end
