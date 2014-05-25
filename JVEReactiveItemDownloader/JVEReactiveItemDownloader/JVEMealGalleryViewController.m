//
//  JVEMealGalleryViewController.m
//  JVEReactiveItemDownloader
//
//  Created by Jozsef Vesza on 26/05/14.
//
//

#import "JVEMealGalleryViewController.h"
#import "JVEMealGalleryViewModel.h"
#import "JVEMealGalleryFlowLayout.h"
#import "JVEMealGalleryCell.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface JVEMealGalleryViewController ()

@property (nonatomic, strong) JVEMealGalleryViewModel *viewModel;

@end

@implementation JVEMealGalleryViewController

static NSString *CellIdentifier = @"Cell";

- (instancetype)init {
    JVEMealGalleryFlowLayout *flowLayout = [[JVEMealGalleryFlowLayout alloc] init];
    self = [super initWithCollectionViewLayout:flowLayout];
    if (self) {
        _viewModel = [[JVEMealGalleryViewModel alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Menu";
    [self.collectionView registerClass:[JVEMealGalleryCell class] forCellWithReuseIdentifier:CellIdentifier];
    
    __weak JVEMealGalleryViewController *weakSelf = self;
    [RACObserve(weakSelf.viewModel, model) subscribeNext:^(id x) {
        __strong JVEMealGalleryViewController *strongSelf = weakSelf;
        [strongSelf.collectionView reloadData];
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.viewModel.model count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JVEMealGalleryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell setMeal:self.viewModel.model[indexPath.row]];
    
    return cell;
}

@end
