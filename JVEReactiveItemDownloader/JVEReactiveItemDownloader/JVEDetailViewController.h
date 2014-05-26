//
//  JVEDetailViewController.h
//  JVEReactiveItemDownloader
//
//  Created by Jozsef Vesza on 26/05/14.
//
//

#import <UIKit/UIKit.h>
@class JVEDetailViewModel;

@interface JVEDetailViewController : UIViewController

@property (nonatomic, strong, readonly) JVEDetailViewModel *viewModel;

- (instancetype)initWithViewModel:(JVEDetailViewModel *)viewModel;

@end
