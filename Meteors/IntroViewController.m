//
//  IntroViewController.m
//  Meteors
//
//  Created by Renata Rodrigues on 2/23/13.
//  Copyright (c) 2013 renata. All rights reserved.
//

#import "IntroViewController.h"

@interface IntroViewController ()

@end

@implementation IntroViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    int score = [[NSUserDefaults standardUserDefaults] integerForKey:@"highScore"];
    self.highScoreLabel.text = [NSString stringWithFormat:@"high score: %i", score];
    
     [UIView animateWithDuration:0.5
                          delay:0.0
                         options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self.titleLabel setCenter:CGPointMake(0, 0)];
                         [self.titleLabel setAlpha:0.0f];
                        }
                     completion:^(BOOL finished){
                         
                     }
     ];
     
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self performSegueWithIdentifier:@"segueToGame" sender:self];

}


@end
