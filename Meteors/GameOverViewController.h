//
//  GameOverViewController.h
//  Meteors
//
//  Created by Renata Rodrigues on 2/23/13.
//  Copyright (c) 2013 renata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameOverViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *timesupLable;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic) int finalScore;
- (IBAction)okButton:(UIButton *)sender;
@end
