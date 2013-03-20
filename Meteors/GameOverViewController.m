//
//  GameOverViewController.m
//  Meteors
//
//  Created by Renata Rodrigues on 2/23/13.
//  Copyright (c) 2013 renata. All rights reserved.
//

#import "GameOverViewController.h"
#import "IntroViewController.h"

@interface GameOverViewController ()

@end

@implementation GameOverViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.scoreLabel.text = [NSString stringWithFormat:@"score: %i",self.finalScore];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    int previousScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"highScore"];
    
    if ( previousScore > 0 ){
        NSLog(@"previousScore: %i",previousScore);
        NSLog(@"self.finalScore : %i",self.finalScore);
        if (self.finalScore > previousScore) {
            [[NSUserDefaults standardUserDefaults] setInteger:self.finalScore forKey:@"highScore"];
        }
    }
    
}


- (IBAction)okButton:(UIButton *)sender {
    [self performSegueWithIdentifier:@"segueToIntro" sender:sender];

}
@end
