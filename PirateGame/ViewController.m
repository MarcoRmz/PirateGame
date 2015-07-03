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
    Tile *tileModel = [[Tile alloc] init];
    tileModel = [[self.map objectAtIndex:self.currentLocation.x] objectAtIndex:self.currentLocation.y];
    
    if (!tileModel.actionDone) {
        Character *playerCreation = [[Character alloc] init];
        playerCreation.health = self.player.health + tileModel.healthEffect;
        playerCreation.damage = self.player.damage;
        //Damage??
        //playerCreation.damage = self.player.damage + tileModel.damage;
        
        if (tileModel.armor != nil) {
            Armor *playerArmor = [[Armor alloc] init];
            playerArmor = tileModel.armor;
            playerCreation.playerArmor = playerArmor;
        } else {
            playerCreation.playerArmor = self.player.playerArmor;
        }
        
        if (tileModel.weapon != nil) {
            Weapon *playerWeapon = [[Weapon alloc] init];
            playerWeapon = tileModel.weapon;
            playerCreation.playerWeapon = playerWeapon;
        } else {
            playerCreation.playerWeapon = self.player.playerWeapon;
        }
        
        self.player = playerCreation;
        self.armorLabel.text = self.player.playerArmor.name;
        self.weaponLabel.text = self.player.playerWeapon.name;
        self.healthLabel.text = [NSString stringWithFormat:@"%i", self.player.health];
        self.damageLabel.text = [NSString stringWithFormat:@"%i", self.player.damage];
        
        tileModel.actionDone = YES;
        self.actionButton.backgroundColor = [UIColor redColor];
        [[self.map objectAtIndex:self.currentLocation.x] replaceObjectAtIndex:self.currentLocation.y withObject:tileModel];
    }
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
    
    if (!tileModel.actionDone) {
        self.actionButton.backgroundColor = [UIColor blueColor];
    } else {
        self.actionButton.backgroundColor = [UIColor redColor];
    }
    
    [UIView transitionWithView:self.view duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.backgroundImage.image = tileModel.background;
        self.storyLabel.text = tileModel.story;
        [self.actionButton setTitle:tileModel.action forState:UIControlStateNormal];
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
    
    Armor *playerArmor = [[Armor alloc] init];
    playerArmor.name = tileModel.armor.name;
    playerArmor.healthBonus = tileModel.armor.healthBonus;
    
    Weapon *playerWeapon = [[Weapon alloc] init];
    playerWeapon.name = tileModel.weapon.name;
    playerWeapon.damage = tileModel.weapon.damage;
    
    Character *playerCreation = [[Character alloc] init];
    playerCreation.health = 100;
    playerCreation.damage = 0;
    playerCreation.playerArmor = playerArmor;
    playerCreation.playerWeapon = playerWeapon;
    
    self.player = playerCreation;
    self.armorLabel.text = self.player.playerArmor.name;
    self.weaponLabel.text = self.player.playerWeapon.name;
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.player.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.player.damage];
    self.backgroundImage.image = tileModel.background;
    self.storyLabel.text = tileModel.story;
    self.currentLocation = CGPointMake(0, 0);
    self.leftButton.hidden = YES;
    self.downButton.hidden = YES;
    [self.actionButton setTitle:tileModel.action forState:UIControlStateNormal];
}
@end
