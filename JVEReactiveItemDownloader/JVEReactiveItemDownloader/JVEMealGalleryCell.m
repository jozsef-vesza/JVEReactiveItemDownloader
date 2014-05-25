//
//  JVEMealGalleryCell.m
//  JVEReactiveItemDownloader
//
//  Created by Jozsef Vesza on 26/05/14.
//
//

#import "JVEMealGalleryCell.h"
#import "JVEMeal.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface JVEMealGalleryCell ()

@property (nonatomic, weak) UIImageView *imageView;

@end

@implementation JVEMealGalleryCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor darkGrayColor];
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:self.bounds];
        imageview.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        [self.contentView addSubview:imageview];
        self.imageView = imageview;
        
        RAC(self.imageView, image) = [[RACObserve(self, meal.imageData) ignore:nil] map:^id(NSData *data) {
            return [UIImage imageWithData:data];
        }];
    }
    
    return self;
}

@end
