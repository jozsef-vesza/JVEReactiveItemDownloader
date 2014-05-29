//
//  JVRCollectionViewDataSource.m
//  JVEReactiveItemDownloader
//
//  Created by Jozsef Vesza on 27/05/14.
//
//

#import "JVRCollectionViewDataSource.h"
#import "JVRCellConfiguratorDelegate.h"

@interface JVRCollectionViewDataSource ()

@property (nonatomic, copy) NSArray *items;
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, strong) id <JVRCellConfiguratorDelegate> cellConfigurator;

@end

@implementation JVRCollectionViewDataSource

+ (instancetype)dataSourceForCollectionView:(UICollectionView *)collectionView withItems:(NSArray *)items usingCellConfigurator:(id <JVRCellConfiguratorDelegate>)cellConfigurator {
    return [[self alloc] initWithCollectionView:collectionView withItems:items usingCellConfigurator:cellConfigurator];
}

- (instancetype)initWithCollectionView:(UICollectionView *)collectionview withItems:(NSArray *)items usingCellConfigurator:(id <JVRCellConfiguratorDelegate>)cellconfigurator {
    self = [super init];
    if (self) {
        _collectionView = collectionview;
        _collectionView.dataSource = self;
        _items = items;
        _cellConfigurator = cellconfigurator;
    }
    
    return self;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (![self.items count]) {
        NSLog(@"collectionView:numberOfItemsInSection: could not be determined, self.items is nil or empty.");
        return 0;
    }
    
    return [self.items count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    id itemAtIndex = self.items[indexPath.row];
    UICollectionViewCell *cellAtIndex = [self.collectionView dequeueReusableCellWithReuseIdentifier:[self.cellConfigurator fetchReuseIdentifierforObject:itemAtIndex] forIndexPath:indexPath];
    
    if (itemAtIndex) {
        cellAtIndex = [self.cellConfigurator configureCell:cellAtIndex usingObject:itemAtIndex];
    }
    
    return cellAtIndex;
}

@end
