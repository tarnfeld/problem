//
//  PBOverlayViewController.m
//  Problem
//
//  Created by Tom Arnfeld on 23/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PBOverlayViewController.h"

@interface PBOverlayViewController ()

@end

@implementation PBOverlayViewController

- (id)init
{
    self = [super initWithNibName:@"PBOverlayViewController" bundle:nil];
    if (self) {
        
    }
    
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self setLayoutOrientation:self.parentPicker.orientation];
}

- (void) setLayoutOrientation:(UIImageOrientation) newOrientation
{
	CGRect 				activeRegionRect;
	CGAffineTransform 	transform;		
	CGMutablePathRef 	path = CGPathCreateMutable();
    
	if (newOrientation == UIImageOrientationUp)
	{
		activeRegionRect = CGRectMake(0, 100, 320, 250);
		transform = CGAffineTransformMakeRotation(0);	
		CGPathAddRect(path, NULL, activeRegionRect);
	} else if (newOrientation == UIImageOrientationRight)
	{
		activeRegionRect = CGRectMake(100, 0, 120, 436);
		transform = CGAffineTransformMakeRotation(M_PI_2); // 90 degree rotation
		
		// This makes a rectangular path that starts in the upper right instead of
		// upper left. This makes the animation 'rotate' the rect.
		CGPathMoveToPoint(path, nil, CGRectGetMaxX(activeRegionRect), CGRectGetMinY(activeRegionRect));
		CGPathAddLineToPoint(path, nil, CGRectGetMaxX(activeRegionRect), CGRectGetMaxY(activeRegionRect));
		CGPathAddLineToPoint(path, nil, CGRectGetMinX(activeRegionRect), CGRectGetMaxY(activeRegionRect));
		CGPathAddLineToPoint(path, nil, CGRectGetMinX(activeRegionRect), CGRectGetMinY(activeRegionRect));
		CGPathCloseSubpath (path);
		
		// If you use this path instead, the rect will resize when animated.
		//	CGPathAddRect(path, NULL, activeRegionRect);
        
	}
	// Note: Could handle other UIImageOrientations here as well, but the 'rotate' button
	// is just a toggle.
	
	// Rotate the red rectangle to the new layout position
	CABasicAnimation *targetRectReshaper = [CABasicAnimation animationWithKeyPath:@"path"];
	targetRectReshaper.duration = 0.5;
	targetRectReshaper.fillMode = kCAFillModeForwards;
	[targetRectReshaper setRemovedOnCompletion:NO];
	[targetRectReshaper setDelegate:self];
	targetRectReshaper.toValue = (__bridge id) path;
	[rectLayer addAnimation:targetRectReshaper forKey:@"animatePath"];
	CGPathRelease(path);
    
	// Set the SDK's active region and orientation to match our new target rectangle.
	[self.parentPicker setActiveRegion:activeRegionRect];
	self.parentPicker.orientation = newOrientation;
}

@end
