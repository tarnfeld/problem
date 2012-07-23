//
//  PBRootViewController.m
//  Problem
//
//  Created by Tom Arnfeld on 23/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PBRootViewController.h"
#import "PBOverlayViewController.h"

@interface PBRootViewController ()
@end

@implementation PBRootViewController

@synthesize scanButton=_scanButton;

- (id)init
{
    self = [super initWithNibName:@"PBRootViewController" bundle:nil];
    if (self) {
        
        pickerController = [[BarcodePickerController alloc] init];
		[pickerController setDelegate:self];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [pickerController prepareToScan];
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
    [pickerController setOverlay:overlayController];
    
    [self presentModalViewController:pickerController animated:YES];
}

#pragma mark - BarcodePickerControllerDelegate

- (void) barcodePickerController:(BarcodePickerController*)picker 
                   returnResults:(NSSet *)results
{
    
    NSLog(@"%@", results);
}

@end
