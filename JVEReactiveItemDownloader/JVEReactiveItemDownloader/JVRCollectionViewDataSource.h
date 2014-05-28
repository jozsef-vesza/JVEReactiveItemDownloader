//
//  JVRCollectionViewDataSource.h
//  JVEReactiveItemDownloader
//
//  Created by Jozsef Vesza on 27/05/14.
//
//

#import <Foundation/Foundation.h>
@protocol JVRCellConfiguratorDelegate;

@interface JVRCollectionViewDataSource : NSObject <UICollectionViewDataSource>

/**
 *  The items shown in the collection view
 */
@property (nonatomic, copy, readonly) NSArray *items;

/**
 *  The collection view that will use this instance as data source
 */
@property (nonatomic, weak, readonly) UICollectionView *collectionView;

/**
 *  The class responsible for customizing the cells
 */
@property (nonatomic, strong, readonly) id <JVRCellConfiguratorDelegate> cellConfigurator;

/**
 *  Convenience initializer method
 *
 *  @param collectionView   The collection view which will use this instance as data source
 *  @param items            The items shown in the collection view
 *  @param cellConfigurator The class responsible for customizing the cells
 *
 *  @return An initialized instance of this class
 */
+ (instancetype)dataSourceForCollectionView:(UICollectionView *)collectionView withItems:(NSArray *)items usingCellConfigurator:(id<JVRCellConfiguratorDelegate>)cellConfigurator;

@end
