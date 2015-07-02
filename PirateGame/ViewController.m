//
//  ViewController.m
//  PirateGame
//
//  Created by Marco Ramirez on 6/25/15.
//  Copyright (c) 2015 Marco Ramirez. All rights reserved.
//

#import "ViewController.h"
#import "Factory.h"
#import "Tile.h"

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

- (IBAction)actionButtonPressed:(UIButton *)sender {
}

- (IBAction)upButtonPressed:(UIButton *)sender {
    [self updateXCordinate:0 andYCordinate:1];
}

- (IBAction)rightButtonPressed:(UIButton *)sender {
    [self updateXCordinate:1 andYCordinate:0];
}

- (IBAction)leftButtonPressed:(UIButton *)sender {
    [self updateXCordinate:-1 andYCordinate:0];
}

- (IBAction)downButtonPressed:(UIButton *)sender {
    [self updateXCordinate:0 andYCordinate:-1];
}

- (IBAction)resetButtonPressed:(UIButton *)sender {
    //launch alert to confirm reset
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert!" message:@"You triggered the alert" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
    [alertView show];
    //if confirm
    [self startGame];
}

-(void)updateXCordinate:(int)x andYCordinate:(int)y {
    self.currentLocation = CGPointMake(self.currentLocation.x + x, self.currentLocation.y + y);
    Tile *tileModel = [[Tile alloc] init];
    tileModel = [[self.map objectAtIndex:self.currentLocation.x] objectAtIndex:self.currentLocation.y];

    self.backgroundImage.image = tileModel.background;
    self.storyLabel.text = tileModel.story;
    
    //Check if action has been done
    //self.actionButton.titleLabel = [[self.map objectAtIndex:self.currentLocation.x] objectAtIndex:self.currentLocation.y];
}

-(void)startGame {
    Factory *gameFactory = [[Factory alloc] init];
    self.map = [gameFactory tiles];
    
    Tile *tileModel = [[Tile alloc] init];
    tileModel = [[self.map objectAtIndex:0] objectAtIndex:0];
    
    self.player.health = 100;
    self.player.damage = 0;
    self.player.playerArmor = tileModel.armor;
    self.player.playerWeapon = tileModel.weapon;
    self.armorLabel.text = [self.player.playerArmor name];
    self.weaponLabel.text = [self.player.playerWeapon name];
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.player.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.player.damage];
    self.backgroundImage.image = tileModel.background;
    self.storyLabel.text = tileModel.story;
    self.currentLocation = CGPointMake(0, 0);
    //self.actionButton.title = tileModel.action;

    //[[sender.actionButton] hidden];
    
    /*
    [UIView transitionWithView:self.view duration:0.5 options:UIViewAnimationOptionTransitionFade animations:^{
        self.backgroundImage.image = [self.map.firstObject backgroundImage];
        self.storyLabel.text = [self.map.firstObject story];
    } completion:^(BOOL finished) {
        
    }]; */
}
@end
