//
//  PBResultsViewController.m
//  Problem
//
//  Created by Tom Arnfeld on 23/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PBResultsViewController.h"
#import "PBTescoBarcodeTroller.h"
#import "OBLinear.h"

@interface PBResultsViewController ()

@end

@implementation PBResultsViewController

#define USER_DEF_LEFT_MARGIN	0.0f
#define USER_DEF_RIGHT_MARGIN	0.0f
#define USER_DEF_TOP_MARGIN		0.0f
#define USER_DEF_BOTTOM_MARGIN	0.0f

#define USER_DEF_BAR_WIDTH			2.0f
#define USER_DEF_BAR_HEIGHT			90.0f
#define USER_DEF_BARCODE_WIDTH		0.0f
#define USER_DEF_BARCODE_HEIGHT		0.0f


@synthesize barcode=_barcode;

- (id)initWithBarcode:(NSString *)barcode
{
    self = [super initWithNibName:@"PBResultsViewController" bundle:nil];
    if (self) {
        
        [[self navigationItem] setTitle:@"Results"];
        [[self navigationItem] setPrompt:@"Five finger dicount"];
        
        [self setBarcode:barcode];
    }
    
    return self;
}

- (void)setBarcode:(NSString *)barcode
{
    _barcode = barcode;
    
    [self updateView];
}

- (void)updateView
{
    [_barcodeLabel setText:_barcode];
    [_barcodeView setBarcode:_barcode];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self updateView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

# pragma mark - UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField
{
//    [self updateBarcode];
    [self updateView];
}

@end
