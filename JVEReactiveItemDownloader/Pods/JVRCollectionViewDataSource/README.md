##JVRCollectionViewDataSource
A basic, reusable and expandable `UICollectionViewDataSource` class to take the clutter out of your `UICollectionView` classes. It depends on a cell configurator class that conforms to the `JVRCellConfiguratorDelegate` [protocol](https://github.com/jozsef-vesza/JVRCellConfiguratorDelegate). For cell configuration example, please see the `JVRCellConfiguratorDelegate` [GitHub page](https://github.com/jozsef-vesza/JVRCellConfiguratorDelegate).
###Example for usage in a Collection View Controller
```objc
#import "JVRCollectionViewDataSource.h"
#import "JVECellConfigurator.h"

@interface MyCollectionViewController ()

@property (nonatomic, strong) JVRCollectionViewDataSource *dataSource;

@end

@implementation MyCollectionViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.dataSource = [JVRCollectionViewDataSource 
    dataSourceForCollectionView:self.collectionView 
    withItems:self.viewModel.model 
    usingCellConfigurator:[[MyCellConfigurator alloc] init]];
}

@end
```
###Installation
Source files can be added manually, however the preferred way to add the class to your project is installation through [CocoaPods](http://cocoapods.org/), using the following Podfile
```ruby
pod 'JVRCollectionViewDataSource'
```
This will install `JVRCollectionViewDataSource` and `JVRCellConfiguratorDelegate` as an additional dependency.
