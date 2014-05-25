//
//  JVEAppDelegate.m
//  JVEReactiveItemDownloader
//
//  Created by Jozsef Vesza on 25/05/14.
//
//

#import "JVEAppDelegate.h"
#import "JVEMealGalleryViewController.h"

@implementation JVEAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[JVEMealGalleryViewController alloc] init]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
