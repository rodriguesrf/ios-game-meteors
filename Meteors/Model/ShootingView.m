//
//  ShootingView.m
//  Meteors
//
//  Created by Renata Rodrigues on 2/20/13.
//  Copyright (c) 2013 renata. All rights reserved.
//

#import "ShootingView.h"

#define RADIUS 13

@implementation ShootingView

+(CGRect)makeRect
{
    return CGRectMake(320.0/2, 460.0-3*RADIUS, 2*RADIUS, 2*RADIUS);
}

+(ShootingView *)movingBlock:(CGPoint)endPoint
{
    
    ShootingView* blockFired = [[ShootingView alloc] initWithFrame:[ShootingView makeRect]];
    blockFired.backgroundColor = [UIColor clearColor];
    blockFired.userInteractionEnabled = NO;
    blockFired.animationDone = NO;
    
    UIImageView* rocketImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rocket"]];
    [blockFired addSubview:rocketImage];
    
    float x = fabs(320.0/2 - endPoint.x);
    float y = fabs(480.0 - endPoint.y);
    
    float angle = atanf(y/x);
    
    if(endPoint.x < 160) {
        angle = -M_PI/2+angle;
    } else {
        angle = M_PI/2-angle;
    }
    
    CGAffineTransform transform = CGAffineTransformMakeRotation(angle);
    blockFired.transform = transform;

    [UIView animateWithDuration: 0.6
                          delay: 0.0
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{

                         [blockFired setCenter:endPoint];
                         
                     }
                     completion:^(BOOL finished){
                         
                         if(finished) {
                             blockFired.animationDone = YES;
                         }
                         
                     }];
    
    return blockFired;
}

/*
- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctx, rect);
    CGContextSetFillColor(ctx, CGColorGetComponents([[UIColor brownColor] CGColor]));
    CGContextFillPath(ctx);
}
*/

@end
