//
//  Meteors.m
//  Meteors
//
//  Created by Renata Rodrigues on 2/18/13.
//  Copyright (c) 2013 renata. All rights reserved.
//

#import "Meteors.h"
#import "UIView+i7Rotate360.h"

#define METEOR_DELTAY 480
#define METEOR_SIZE 40

@interface Meteors(){
    BOOL flame;
}

@end

@implementation Meteors

+(Meteors*)makeMeteors
{
    
    double xr = arc4random() % 320-1-METEOR_SIZE ;

    CGRect rect = CGRectMake( xr, 0.0, METEOR_SIZE, METEOR_SIZE);
    Meteors * meteorView = [[Meteors alloc]initWithFrame:rect];
    meteorView.backgroundColor = [UIColor clearColor];
    meteorView.userInteractionEnabled = NO;
    meteorView.animationDone = NO;

    //[meteorView startTimer];
    
    UIImageView* meteorImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"meteor"]];
    [meteorView addSubview:meteorImage];
    [meteorImage rotate360WithDuration:1.0 repeatCount:100 timingMode:i7Rotate360TimingModeLinear];
    
    [UIView animateWithDuration: 3.0
                          delay: 0.0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                         CGRect newrect = CGRectMake(meteorView.frame.origin.x, METEOR_DELTAY, METEOR_SIZE, METEOR_SIZE);
                         meteorView.frame = newrect;
                         
                     }
                     completion:^(BOOL finished){
                         
                         if(finished) {
                             meteorView.animationDone = YES;
                             [meteorView.animationTimer invalidate];
                         }
                         
                     }];
    
    return meteorView;

}

/*

- (void)startTimer
{
    self.animationTimer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(drawTimer) userInfo:nil repeats:YES];
}

- (void)drawTimer
{
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    if(flame) {
        
        CGContextAddEllipseInRect(ctx, rect);
        CGContextSetFillColor(ctx, CGColorGetComponents([[UIColor yellowColor] CGColor]));
        CGContextFillPath(ctx);
        
        CGContextAddEllipseInRect(ctx, CGRectInset(rect, -3, -3));
        CGContextSetFillColor(ctx, CGColorGetComponents([[UIColor redColor] CGColor]));
        CGContextFillPath(ctx);
        
        flame = NO;
        
    } else {
        
        CGContextAddEllipseInRect(ctx, rect);
        CGContextSetFillColor(ctx, CGColorGetComponents([[UIColor yellowColor] CGColor]));
        CGContextFillPath(ctx);
        
        CGContextAddEllipseInRect(ctx, CGRectInset(rect, -2, -2));
        CGContextSetFillColor(ctx, CGColorGetComponents([[UIColor redColor] CGColor]));
        CGContextFillPath(ctx);
        
        flame = YES;
    }
        
}
*/
 
@end
