//
//  JVRCellConfiguratorDelegate.h
//  JVEReactiveItemDownloader
//
//  Created by Jozsef Vesza on 27/05/14.
//
//

#import <Foundation/Foundation.h>

/**
 *  This protocol must be implemented by objects responsible for the creation and configuration of either UICollectionViewCell or UITableViewCell objects.
 */
@protocol JVRCellConfiguratorDelegate <NSObject>

/**
 *  Fetch the reuse identifier for a UITableViewCell or UICollectionViewCell with regards to the object it shows.
 *
 *  @param object The object shown in the cell
 *
 *  @return An NSString instance containing the identifier
 */
- (NSString *)fetchReuseIdentifierforObject:(id)object;

/**
 *  Customize a given UITableViewCell or UICollectionViewCell object using properties of an object.
 *
 *  @param cell   The cell to be configured
 *  @param object The object shown in the cell
 *
 *  @return The instance of the configured cell
 */
- (id)configureCell:(id)cell usingObject:(id)object;

@end
