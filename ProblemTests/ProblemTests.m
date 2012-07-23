//
//  ProblemTests.m
//  ProblemTests
//
//  Created by Tom Arnfeld on 23/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProblemTests.h"
#import "PBTescoBarcodeTroller.h"

@implementation ProblemTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testTroller
{
    NSArray *barcodes = [NSArray arrayWithObjects:@"5000221503354", @"0000010097403", nil];
    NSArray *trolled = [NSArray arrayWithObjects:@"971500022150335460001008", @"971000001009740370010102", nil];
    
    NSDictionary *barcodeTests = [[NSDictionary alloc] initWithObjects:barcodes forKeys:trolled];
    
    [barcodeTests enumerateKeysAndObjectsUsingBlock:^(NSString *barcode, NSString *expectedTroll, BOOL *stop) {
        
        STAssertTrue([PBTescoBarcodeTroller trollReadyBarcode:barcode], @"Test if barcode is troll ready");
        
        PBTescoBarcodeTroller *troller = [[PBTescoBarcodeTroller alloc] initWithBarcode:barcode];
        [troller setPrice:[NSNumber numberWithInt:10]]; // 10p
        
        NSString *trolled = [troller trollAway];
        
        // Would like to use STAssertEquals but no ideawtf
        STAssertEquals(expectedTroll, trolled, @"Test if trolled barcode is correct");
    }];
}

@end
