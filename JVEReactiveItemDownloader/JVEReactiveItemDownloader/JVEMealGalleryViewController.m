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
#import "JVEDetailViewController.h"
#import "JVEDetailViewModel.h"
#import "JVEMealListFlowLayout.h"
#import "JVRCollectionViewDataSource.h"
#import "JVECellConfigurator.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface JVEMealGalleryViewController ()

@property (nonatomic, strong) JVEMealGalleryViewModel *viewModel;
@property (nonatomic, strong) NSIndexPath *selectedIndexPath;
@property (nonatomic, assign) BOOL viewMode;
@property (nonatomic, strong) JVRCollectionViewDataSource *dataSource;

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
    
    @weakify(self);
    [RACObserve(self.viewModel, model) subscribeNext:^(id x) {
        @strongify(self);
        if (!self.dataSource.items) {
            self.dataSource = [JVRCollectionViewDataSource dataSourceForCollectionView:self.collectionView withItems:self.viewModel.model usingCellConfigurator:[[JVECellConfigurator alloc] init]];
        }
        
        [self.collectionView reloadData];
    }];
    
    [[self rac_signalForSelector:@selector(collectionView:didSelectItemAtIndexPath:) fromProtocol:@protocol(UICollectionViewDelegate)] subscribeNext:^(RACTuple *arguments) {
        @strongify(self);
        NSIndexPath *indexPath = arguments.second;
        JVEDetailViewModel *viewModel = [[JVEDetailViewModel alloc] initWithModel:self.viewModel.model[indexPath.item]];
        JVEDetailViewController *viewController = [[JVEDetailViewController alloc] initWithViewModel:viewModel];
        [self.navigationController pushViewController:viewController animated:YES];
    }];
    
    self.collectionView.delegate = self;
    
    
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] init];
    rightBarButton.title = @"Switch";
    rightBarButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        self.viewMode = !self.viewMode;
        return [RACSignal empty];
    }];
    
    self.navigationItem.rightBarButtonItem = rightBarButton;
    
    [RACObserve(self, viewMode) subscribeNext:^(id x) {
        @strongify(self);
        UICollectionViewLayout *layout;
        if ([x boolValue]) {
            layout = [[JVEMealListFlowLayout alloc] init];
        } else {
            layout = [[JVEMealGalleryFlowLayout alloc] init];
        }
        [self.collectionView setCollectionViewLayout:layout animated:YES];
    }];
}

@end
