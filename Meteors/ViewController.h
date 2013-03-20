//
//  ViewController.h
//  Meteors
//
//  Created by Renata Rodrigues on 2/18/13.
//  Copyright (c) 2013 renata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic) int playerScore;
@property (nonatomic, strong) NSArray* highScoreArray;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

-(void)stepMeteors;

@end
