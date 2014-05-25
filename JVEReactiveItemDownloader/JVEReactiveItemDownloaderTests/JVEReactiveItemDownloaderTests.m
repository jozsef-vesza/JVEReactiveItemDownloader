//
//  JVEReactiveItemDownloaderTests.m
//  JVEReactiveItemDownloaderTests
//
//  Created by Jozsef Vesza on 25/05/14.
//
//

#import <XCTest/XCTest.h>
#import "JVEMealGalleryViewModel.h"

@interface JVEReactiveItemDownloaderTests : XCTestCase

@end

@implementation JVEReactiveItemDownloaderTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    JVEMealGalleryViewModel *model = [[JVEMealGalleryViewModel alloc] init];
    XCTAssertNotNil(model, @"View model alloc failed");
}

@end
