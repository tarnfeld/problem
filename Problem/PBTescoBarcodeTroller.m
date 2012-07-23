//
//  PBTescoBarcodeTroller.m
//  Problem
//
//  Created by Tom Arnfeld on 23/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PBTescoBarcodeTroller.h"

@interface PBTescoBarcodeTroller ()

- (int)generateChecksum;

@end

@implementation PBTescoBarcodeTroller

@synthesize price=_price,
            barcode=_barcode;

#define kPBTescoBarcodeTrollerException @"kPBTescoBarcodeTrollerException"

+ (BOOL)trollReadyBarcode:(NSString *)barcode
{
    // Validate the length maybe?
    
    return YES;
}

- (id)initWithBarcode:(NSString *)barcode
{
    self = [super init];
    if (self) {
        
        if (![[self class] trollReadyBarcode:barcode]) {
            
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:barcode forKey:@"barcode"];
            @throw [NSException exceptionWithName:kPBTescoBarcodeTrollerException reason:@"Cannot instanciate barcode troller with invalid barcode" userInfo:userInfo];
        }
    }
    
    return self;
}

- (NSString *)trollAway
{
    if (![[self class] trollReadyBarcode:_barcode]) {
        
        @throw [NSException exceptionWithName:kPBTescoBarcodeTrollerException reason:@"Cannot troll a non existent barcode" userInfo:nil];
    }
    
    NSLog(@"%@", _barcode);
    NSMutableString *trolledBarcode = [[NSMutableString alloc] initWithString:_barcode];
    
    // Prepend the magic number
    [trolledBarcode insertString:@"971" atIndex:0];
    
    // Append the mystery number
    [trolledBarcode appendString:@"7"];
    
    // Padding
    [trolledBarcode appendString:@"0"];
    
    // Append the checksum
    [trolledBarcode appendString:[NSString stringWithFormat:@"%i", [self generateChecksum]]];
    
    return [NSString stringWithFormat:@"%@", trolledBarcode];
}

- (int)generateChecksum
{
    if (![[self class] trollReadyBarcode:_barcode]) {
        
        @throw [NSException exceptionWithName:kPBTescoBarcodeTrollerException reason:@"Cannot generate a checksum for invalid barcode" userInfo:nil];
    }
    
    int even;
    int odd;
    int checksum;
    
    for (int i = 0; i < [_barcode length]; i++) {
        if (i % 2) {
            even += [[_barcode substringWithRange:NSMakeRange(i, 1)] intValue];
        } else {
            odd += [[_barcode substringWithRange:NSMakeRange(i, 1)] intValue];
        }
    }
    
    odd *= 3;
    checksum = 10 - ((even + odd) % 10);
    
    return checksum;
}

@end
