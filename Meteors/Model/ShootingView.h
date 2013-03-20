//
//  ShootingView.h
//  Meteors
//
//  Created by Renata Rodrigues on 2/20/13.
//  Copyright (c) 2013 renata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShootingView : UIView

@property(nonatomic) BOOL animationDone;
@property(nonatomic) BOOL exploded;

+(ShootingView *)movingBlock:(CGPoint)endPoint;

@end
