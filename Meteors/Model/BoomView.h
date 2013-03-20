//
//  BoomView.h
//  Meteors
//
//  Created by Renata Rodrigues on 2/23/13.
//  Copyright (c) 2013 renata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BoomView : UIView

+(BoomView *)missAt:(CGPoint)endPoint;
+(BoomView *)explodeAt:(CGPoint)endPoint;

@end
