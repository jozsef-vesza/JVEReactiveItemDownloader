//
//  JVEDetailViewModel.h
//  JVEReactiveItemDownloader
//
//  Created by Jozsef Vesza on 26/05/14.
//
//

#import "RVMViewModel.h"
@class JVEMeal;

@interface JVEDetailViewModel : RVMViewModel

@property (nonatomic, strong, readonly) JVEMeal *model;

- (instancetype)initWithModel:(id)model;
- (NSString *)mealName;
- (NSData *)imageData;

@end
