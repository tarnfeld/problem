//
//  PBRootViewController.h
//  Problem
//
//  Created by Tom Arnfeld on 23/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RedLaserSDK.h"

@interface PBRootViewController : UIViewController <BarcodePickerControllerDelegate> {
    
    __weak IBOutlet UIButton *_scanButton;
    
    BarcodePickerController *pickerController;
}

@property (weak, nonatomic) IBOutlet UIButton *scanButton;

- (IBAction)scanBarcode:(id)sender;

@end
