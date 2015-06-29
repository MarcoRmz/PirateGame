//
//  ViewController.m
//  PirateGame
//
//  Created by Marco Ramirez on 6/25/15.
//  Copyright (c) 2015 Marco Ramirez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self startGame];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionButton:(UIButton *)sender {
}

- (IBAction)upButton:(UIButton *)sender {
    [self updateXCordinate:0 andYCordinate:1];
}

- (IBAction)rightButton:(UIButton *)sender {
    [self updateXCordinate:1 andYCordinate:0];
}

- (IBAction)leftButton:(UIButton *)sender {
    [self updateXCordinate:-1 andYCordinate:0];
}

- (IBAction)downButton:(UIButton *)sender {
    [self updateXCordinate:0 andYCordinate:-1];
}

- (IBAction)resetButton:(UIButton *)sender {
    //launch alert to confirm reset
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert!" message:@"You triggered the alert" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
    [alertView show];
    //if confirm
    [self startGame];
}

-(void)updateXCordinate:(int)x andYCordinate:(int)y {
    self.currentLocation = CGPointMake(self.currentLocation.x + x, self.currentLocation.y + y);

    self.backgroundImage.image = [[self.map objectAtIndex:self.currentLocation.x] backgroundImage];
    self.storyLabel.text = [[self.map objectAtIndex:self.currentLocation.x] story];
    //Check if action has been done
    [self actionButton].title = [[self.map objectAtIndex:self.currentLocation.x] action];
}

-(void)startGame {
    self.map = [self.gameFactory tiles];
    self.armorLabel.text = [self.player.playerArmor name];
    self.weaponLabel.text = [self.player.playerWeapon name];
    self.healthLabel.text = [NSString stringWithFormat:@"%i", [self.player health]];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", [self.player damage]];
    self.backgroundImage.image = [self.map.firstObject backgroundImage];
    self.storyLabel.text = [self.map.firstObject story];
    self.currentLocation = CGPointMake(0, 0);
    //Missing correct action button title
    //[[sender.actionButton] hidden];
    
    /*
    [UIView transitionWithView:self.view duration:0.5 options:UIViewAnimationOptionTransitionFade animations:^{
        self.backgroundImage.image = [self.map.firstObject backgroundImage];
        self.storyLabel.text = [self.map.firstObject story];
    } completion:^(BOOL finished) {
        
    }]; */
}
@end
