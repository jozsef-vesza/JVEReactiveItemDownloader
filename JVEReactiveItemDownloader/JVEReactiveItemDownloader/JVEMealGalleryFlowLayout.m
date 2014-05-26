//
//  JVEMealGalleryFlowLayout.m
//  JVEReactiveItemDownloader
//
//  Created by Jozsef Vesza on 26/05/14.
//
//

#import "JVEMealGalleryFlowLayout.h"

@implementation JVEMealGalleryFlowLayout

- (instancetype)init {
    self = [super init];
    if (self) {
        double width = [[UIScreen mainScreen] bounds].size.width - 20;
        double height = width * 3.0 / 4.0;
        self.itemSize = CGSizeMake(width, height);
        self.minimumInteritemSpacing = 10000.0f;
        self.minimumLineSpacing = 10;
        self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    }
    return self;
}
@end
