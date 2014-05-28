//
//  JVECellConfigurator.m
//  JVEReactiveItemDownloader
//
//  Created by Jozsef Vesza on 27/05/14.
//
//

#import "JVECellConfigurator.h"
#import "JVEMealGalleryCell.h"
#import "JVEMeal.h"

@implementation JVECellConfigurator

- (NSString *)fetchReuseIdentifierforObject:(id)object {
    return @"Cell";
}

- (JVEMealGalleryCell *)configureCell:(JVEMealGalleryCell *)cell usingObject:(JVEMeal *)object {
    [cell setMeal:object];
    return cell;
}

@end
