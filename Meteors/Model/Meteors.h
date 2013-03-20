//
//  Meteors.h
//  Meteors
//
//  Created by Renata Rodrigues on 2/18/13.
//  Copyright (c) 2013 renata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Meteors : UIView

@property(nonatomic) BOOL animationDone;
@property(nonatomic, strong) NSTimer *animationTimer;

+(Meteors* )makeMeteors;
//- (void)startTimer;

@end
