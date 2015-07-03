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
    //Check if action has been done
    //[[sender.actionButton] hidden];
}

- (IBAction)upButtonPressed:(UIButton *)sender {
    self.currentLocation = CGPointMake(self.currentLocation.x, self.currentLocation.y + 1);
    [self updateView];
}

- (IBAction)rightButtonPressed:(UIButton *)sender {
    self.currentLocation = CGPointMake(self.currentLocation.x + 1, self.currentLocation.y);
    [self updateView];
}

- (IBAction)leftButtonPressed:(UIButton *)sender {
    self.currentLocation = CGPointMake(self.currentLocation.x - 1, self.currentLocation.y);
    [self updateView];
}

- (IBAction)downButtonPressed:(UIButton *)sender {
    self.currentLocation = CGPointMake(self.currentLocation.x, self.currentLocation.y - 1);
    [self updateView];
}

-(void)updateView {
    self.leftButton.hidden = [self disableMoveAtPoint:CGPointMake(self.currentLocation.x - 1, self.currentLocation.y)];
    
    self.upButton.hidden = [self disableMoveAtPoint:CGPointMake(self.currentLocation.x, self.currentLocation.y + 1)];
    
    self.rightButton.hidden = [self disableMoveAtPoint:CGPointMake(self.currentLocation.x + 1, self.currentLocation.y)];
    
    self.downButton.hidden = [self disableMoveAtPoint:CGPointMake(self.currentLocation.x, self.currentLocation.y - 1)];
    
    Tile *tileModel = [[Tile alloc] init];
    tileModel = [[self.map objectAtIndex:self.currentLocation.x] objectAtIndex:self.currentLocation.y];
    
    
    [UIView transitionWithView:self.view duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.backgroundImage.image = tileModel.background;
        self.storyLabel.text = tileModel.story;
        //self.actionButton.titleLabel = tileModel.action;
    } completion:^(BOOL finished) {
        
    }];
}

-(BOOL)disableMoveAtPoint:(CGPoint)point {
    if (point.y >= 0 && point.x >= 0 && point.x < [self.map count] && point.y < [[self.map objectAtIndex:point.x] count]) {
        return NO;
    } else {
        return YES;
    }
}

- (IBAction)resetButtonPressed:(UIButton *)sender {
    //launch alert to confirm reset
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert!" message:@"You triggered the alert" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
    [alertView show];
    //if confirm
    [self startGame];
}

-(void)startGame {
    Factory *gameFactory = [[Factory alloc] init];
    self.map = [gameFactory tiles];
    
    Tile *tileModel = [[Tile alloc] init];
    tileModel = [[self.map objectAtIndex:0] objectAtIndex:0];
    
    self.player.health = 100;
    self.player.damage = 0;
    self.player.playerArmor.name = tileModel.armor.name;
    self.player.playerArmor.healthBonus = tileModel.armor.healthBonus;
    NSLog(@"PLayer armor: %@, Player weapon: %@", self.player.playerArmor.name, self.player.playerWeapon.name);
    self.armorLabel.text = self.player.playerArmor.name;
    self.weaponLabel.text = self.player.playerWeapon.name;
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.player.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.player.damage];
    self.backgroundImage.image = tileModel.background;
    self.storyLabel.text = tileModel.story;
    self.currentLocation = CGPointMake(0, 0);
    self.leftButton.hidden = YES;
    self.downButton.hidden = YES;
    //self.actionButton.title = tileModel.action;
}
@end
