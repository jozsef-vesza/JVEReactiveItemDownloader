##JVRCellConfiguratorDelegate
A protocol for classes responsible for the creation and configuration of `UICollectionViewCell` or `UITableViewCell` objects. This class is a meant to be used with my [JVRCollectionViewDataSource](https://github.com/jozsef-vesza/JVRCollectionViewDataSource) and [JVRBaseTableViewDataSource](https://github.com/jozsef-vesza/JVRBaseTableViewDataSource) projects
### Configuring Cells
Cell configurator classes aim to encapsulate the logic that previously belonged in the `tableView:cellForRowAtIndexPath:`/`collectionView:cellForItemAtIndexPath:` method found in the `UITableViewDataSource`/`UICollectionViewDataSource` protocol. They can be used to return the reuse identifier for a cell according to the object it is supposed to show, and to customize its appearance or behavior. The example below shows a possible implementation for table view cells, but the same process can also be used for collection view.
```objc
// MyCellConfigurator.h
#import "JVRCellConfiguratorDelegate.h"

@interface MyCellConfigurator : NSObject<JVRCellConfiguratorDelegate>
@end

// MyCellConfigurator.m
@implementation MyCellConfigurator

- (NSString *)fetchCellIdentifierForObject:(id)anObject
{
    if ([anObject isKindOfClass:[MyClass class]])
    {
        return @"myCell";
    }

    return @"regularCell";
}

- (UITableViewCell *)configureCell:(MyCell *)cell usingObject:(MyClass *)object
{
    cell.titleLabel.text = object.stringProperty;
    return cell;
}

@end
```
###Installation
If you are using `JVRCollectionViewDataSource` or `JVRBaseTableViewDataSource` with [CocoaPods](http://cocoapods.org/), `JVRCellConfiguratorDelegate` is also downloaded as a dependency. You can include it separately by adding the source files to your project or adding the project to your Podfile:
```Ruby
pod 'JVRCellConfiguratorDelegate'
```
