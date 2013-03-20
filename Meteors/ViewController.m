//
//  ViewController.m
//  Meteors
//
//  Created by Renata Rodrigues on 2/18/13.
//  Copyright (c) 2013 renata. All rights reserved.
//

#import "ViewController.h"
#import "Meteors.h"
#import "ShootingView.h"
#import "BoomView.h"
#import <QuartzCore/QuartzCore.h>
#import "GameOverViewController.h"

@interface ViewController () {
    NSTimer * myTimer;
    NSTimer * checkCollisionTimer;
    NSTimer* gameTimer;
    NSMutableArray * meteorsArray;
    NSMutableArray * shootsArray;
}

@end

@implementation ViewController

-(NSArray *)highScoreArray{
    
    if (_highScoreArray == nil) {
        // 4 places + last score
        _highScoreArray = [[NSArray alloc] initWithObjects:@"0",@"0",@"0",@"0",@"0",nil];
    }
    return _highScoreArray;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch * touch = [touches anyObject];
    
    CGPoint endPnt = [touch locationInView:self.view];
 
    ShootingView *shootingView = [ShootingView movingBlock:endPnt];
    
    [shootsArray addObject:shootingView];
    
    [self.view addSubview:shootingView];
    
}

-(void)stepMeteors{
    
    Meteors* meteorView = [Meteors makeMeteors];
    
    [self.view addSubview:meteorView];
    
    [meteorsArray addObject:meteorView];
        
}

-(void)checkCollisions{
    
    NSMutableArray *meteorsToRemove = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray *shootsToRemove = [NSMutableArray arrayWithCapacity:0];
    
    for(Meteors *meteor in meteorsArray) {
        
        CGRect mFrame = ((Meteors *)[meteor.layer presentationLayer]).frame;
        if (meteor.animationDone) {
            [meteorsToRemove addObject:meteor];
        }
        
        for(ShootingView* rocket in shootsArray) {

            CGRect rFrame = ((ShootingView *)[rocket.layer presentationLayer]).frame;

            if(CGRectIntersectsRect(mFrame, rFrame)) {
                
                rocket.exploded = YES;
                
                BoomView *view = [BoomView explodeAt:CGPointMake(rFrame.origin.x, rFrame.origin.y)];
                [self.view addSubview:view];
                
                NSLog(@"***********************************");
                [meteorsToRemove addObject:meteor];
                [shootsToRemove addObject:rocket];
                // score
                self.playerScore+=10;
                self.scoreLabel.text = [NSString stringWithFormat:@"%d",self.playerScore];
                break;
            }
            
            if (rocket.animationDone && !rocket.exploded) {
                BoomView *view = [BoomView missAt:CGPointMake(rFrame.origin.x, rFrame.origin.y)];
                [self.view addSubview:view];
                [shootsToRemove addObject:rocket];
            }
            
        }
        
    }
    
    for(Meteors *meteor in meteorsToRemove) {
        [meteorsArray removeObject:meteor];
        [meteor removeFromSuperview];
    }
    
    for(ShootingView* rocket in shootsToRemove) {
        

        [shootsArray removeObject:rocket];
        [rocket removeFromSuperview];
    }

}

-(void)fallingMeteors{
    
    // Start the timer
    myTimer = [NSTimer scheduledTimerWithTimeInterval:0.6
                                               target:self
                                             selector:@selector(stepMeteors)
                                             userInfo:nil
                                              repeats:YES];
    
    checkCollisionTimer = [NSTimer scheduledTimerWithTimeInterval:0.05
                                               target:self
                                             selector:@selector(checkCollisions)
                                             userInfo:nil
                                              repeats:YES];
    
    gameTimer = [NSTimer scheduledTimerWithTimeInterval:15.0
                                                 target:self
                                               selector:@selector(gameOver)
                                               userInfo:nil
                                                repeats:NO];
    
}

-(void)gameOver{
    
    NSLog(@"Time's up!");
    
    [self performSegueWithIdentifier:@"segueToGameOver" sender:self];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([[segue identifier] isEqualToString:@"segueToGameOver"]) {
        GameOverViewController *gameOverControler = segue.destinationViewController;
        gameOverControler.finalScore = self.playerScore;
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    meteorsArray = [[NSMutableArray alloc] init];
    shootsArray = [[NSMutableArray alloc] init];

    [self fallingMeteors];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
