//
//  PBResultsViewController.h
//  Problem
//
//  Created by Tom Arnfeld on 23/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PBBarcodeView.h"

@interface PBResultsViewController : UIViewController <UITextFieldDelegate> {
    
    NSString *_barcode;
    
    IBOutlet UILabel *_barcodeLabel;
    IBOutlet PBBarcodeView *_barcodeView;
    IBOutlet UITextField *_priceField;
}

@property (nonatomic, retain) NSString *barcode;

- (id)initWithBarcode:(NSString *)barcode;

@end