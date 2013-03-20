//
//  BoomView.m
//  Meteors
//
//  Created by Renata Rodrigues on 2/23/13.
//  Copyright (c) 2013 renata. All rights reserved.
//

#import "BoomView.h"

@implementation BoomView

+(BoomView *)missAt:(CGPoint)endPoint
{
    
    UIImageView* boomImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"puff"]];
    
    BoomView* boom = [[BoomView alloc] initWithFrame:boomImage.frame];
    boom.backgroundColor = [UIColor clearColor];
    [boom setCenter:endPoint];
    [boom addSubview:boomImage];
    
    boomImage.alpha = 0;
    
    [UIView animateWithDuration: 0.2
                          delay: 0.0
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         
                         boomImage.alpha = 1;
                         
                     }
                     completion:^(BOOL finished){
                         
                         if(finished) {
                             [boom removeFromSuperview];
                         }
                         
                     }];
    
    return boom;
}

+(BoomView *)explodeAt:(CGPoint)endPoint
{

    UIImageView* boomImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"boom"]];

    BoomView* boom = [[BoomView alloc] initWithFrame:boomImage.frame];
    boom.backgroundColor = [UIColor clearColor];
    [boom setCenter:endPoint];
    [boom addSubview:boomImage];
    
    boomImage.alpha = 0;

    [UIView animateWithDuration: 0.2
                          delay: 0.0
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         
                         boomImage.alpha = 1;
                         
                     }
                     completion:^(BOOL finished){
                         
                         if(finished) {
                             [boom removeFromSuperview];
                         }
                         
                     }];
    
    return boom;
}

@end
