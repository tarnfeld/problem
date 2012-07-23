//
//  PBBarcodeView.m
//  Problem
//
//  Created by Tom Arnfeld on 23/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PBBarcodeView.h"
#import "OBLinear.h"

@implementation PBBarcodeView

@synthesize barcode=_barcode;

- (void)drawRect:(CGRect)rect {

    OBLinear *linear = [OBLinear new];
    [linear setNBarcodeType: OB_CODE128A];
    [linear setPDataMsg: [[NSString alloc] initWithString:_barcode]];

    [linear setNRotate:OB_Rotate0];
    
    [linear setFBarcodeWidth:self.frame.size.width];
    [linear setFBarcodeHeight:self.frame.size.height];
    
    [linear setPTextFont:[UIFont systemFontOfSize:12]];
    [linear setBShowText:NO];
    
    [linear drawWithView:self];
}

@end
