//
//  PBTescoBarcodeTroller.h
//  Problem
//
//  Created by Tom Arnfeld on 23/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PBTescoBarcodeTroller : NSObject {
    
    NSString *_barcode;
    NSNumber *_price;
}

@property (nonatomic, retain) NSString *barcode;
@property (nonatomic, retain) NSNumber *price; // Price in pennies

+ (BOOL)trollReadyBarcode:(NSString *)barcode;
- (id)initWithBarcode:(NSString *)barcode;
- (NSString *)trollAway;

@end
