//
//  PBRootViewController.m
//  Problem
//
//  Created by Tom Arnfeld on 23/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PBRootViewController.h"
#import "PBOverlayViewController.h"
#import "PBResultsViewController.h"

#import "PBTescoBarcodeTroller.h"

@interface PBRootViewController ()
@end

@implementation PBRootViewController

@synthesize scanButton=_scanButton;

- (id)init
{
    self = [super initWithNibName:@"PBRootViewController" bundle:nil];
    if (self) {
        
        _pickerController = [[BarcodePickerController alloc] init];
		[_pickerController setDelegate:self];
        
        [_pickerController setTitle:@"Scan Barcode"];
        [[_pickerController navigationItem] setPrompt:@"Hold your device still over the barcode"];
        
        _navController = [[UINavigationController alloc] initWithRootViewController:_pickerController];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_pickerController prepareToScan];
}

- (void)viewDidUnload
{
    _scanButton = nil;
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - IBActions

- (IBAction)scanBarcode:(id)sender
{
    PBOverlayViewController *overlayController = [[PBOverlayViewController alloc] init];
    [_pickerController setOverlay:overlayController];
    
    [[_navController navigationBar] setTintColor:[UIColor colorWithRed:0.004 green:0.329 blue:0.624 alpha:1.000]];
    
    [self presentModalViewController:_navController animated:YES];
}

#pragma mark - BarcodePickerControllerDelegate

- (void) barcodePickerController:(BarcodePickerController*)picker returnResults:(NSSet *)results
{
    BarcodeResult *result = (BarcodeResult *) [results anyObject];
    NSString *barcodeString = [result barcodeString];
    
    if (result && [PBTescoBarcodeTroller trollReadyBarcode:barcodeString]) {
        
        PBTescoBarcodeTroller *tesco = [[PBTescoBarcodeTroller alloc] initWithBarcode:barcodeString];
        [tesco setPrice:[NSNumber numberWithInt:10]];
        
        NSString *barcode = [tesco trollAway];
        
        PBResultsViewController *resultsViewController = [[PBResultsViewController alloc] initWithBarcode:barcode];
        [_navController pushViewController:resultsViewController animated:YES];
    }
}

@end
