//
//  PBBarcodeView.h
//  Problem
//
//  Created by Tom Arnfeld on 23/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PBBarcodeView : UIView {
    
    NSString *_barcode;
}

@property (nonatomic, retain) NSString *barcode;

@end
