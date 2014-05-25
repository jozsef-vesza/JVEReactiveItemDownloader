//
//  JVEMealGalleryCell.h
//  JVEReactiveItemDownloader
//
//  Created by Jozsef Vesza on 26/05/14.
//
//

#import <UIKit/UIKit.h>
@class JVEMeal;

@interface JVEMealGalleryCell : UICollectionViewCell

@property (nonatomic, strong) JVEMeal *meal;

- (void)setMeal:(JVEMeal *)meal;

@end
