//
//  JVEDetailViewController.m
//  JVEReactiveItemDownloader
//
//  Created by Jozsef Vesza on 26/05/14.
//
//

#import "JVEDetailViewController.h"
#import "JVEDetailViewModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface JVEDetailViewController ()

@property (nonatomic, strong) JVEDetailViewModel *viewModel;
@property (nonatomic, weak) UIImageView *imageView;

@end

@implementation JVEDetailViewController

- (instancetype)initWithViewModel:(JVEDetailViewModel *)viewModel {
    self = [super init];
    if (self) {
        _viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [self.viewModel mealName];
    self.view.backgroundColor = [UIColor blackColor];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    RAC(imageView, image) = [RACObserve(self.viewModel, imageData) map:^id(NSData *data) {
        return [UIImage imageWithData:data];
    }];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:imageView];
    self.imageView = imageView;
}

@end
