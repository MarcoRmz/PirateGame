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
    
    if ([tileModel.story containsString:@"Captain Black Beard"]) {
        Character *bossCreation = [[Character alloc] init];
        bossCreation.health = self.boss.health - self.player.playerWeapon.damage;
        NSLog(@"Self Boss health: %i, Player weapon %i, Boss Health: %i", self.boss.health, self.player.playerWeapon.damage, bossCreation.health);
        self.boss = bossCreation;
        
        Character *playerCreation = [[Character alloc] init];
        playerCreation.health = self.player.health + tileModel.healthEffect;
        playerCreation.damage = self.player.damage;
        //Damage??
        //playerCreation.damage = self.player.damage + tileModel.damage;
        playerCreation.playerArmor = self.player.playerArmor;
        playerCreation.playerWeapon = self.player.playerWeapon;
        self.player = playerCreation;
        self.healthLabel.text = [NSString stringWithFormat:@"%i", self.player.health];
        self.damageLabel.text = [NSString stringWithFormat:@"%i", self.player.damage];
        
        tileModel.actionDone = YES;
        [[self.map objectAtIndex:self.currentLocation.x] replaceObjectAtIndex:self.currentLocation.y withObject:tileModel];
    } else if (!tileModel.actionDone) {
        Character *playerCreation = [[Character alloc] init];
        playerCreation.health = self.player.health + tileModel.healthEffect;
        playerCreation.damage = self.player.damage;
        //Damage??
        //playerCreation.damage = self.player.damage + tileModel.damage;
        
        if (tileModel.armor != nil) {
            Armor *playerArmor = [[Armor alloc] init];
            playerArmor = tileModel.armor;
            playerCreation.playerArmor = playerArmor;
            playerCreation.health = playerCreation.health - self.player.playerArmor.healthBonus;
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
        [[self.map objectAtIndex:self.currentLocation.x] replaceObjectAtIndex:self.currentLocation.y withObject:tileModel];
    }
    [self updateView];
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
    
    if (self.player.health > 0 && self.boss.health <= 0) {
        UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"Congratulations!" message:@"You won! Play Again?" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            //Cancel
        }];
        UIAlertAction *resetAction = [UIAlertAction actionWithTitle:@"Restart" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self startGame];
        }];
        
        [alertView addAction:cancelAction];
        [alertView addAction:resetAction];
        [self presentViewController:alertView animated:YES completion:nil];
    } else if (self.player.health <= 0) {
        UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"Game Over" message:@"You died, restart the game?" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            //Cancel
        }];
        UIAlertAction *resetAction = [UIAlertAction actionWithTitle:@"Restart" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self startGame];
        }];
        
        [alertView addAction:cancelAction];
        [alertView addAction:resetAction];
        [self presentViewController:alertView animated:YES completion:nil];
    }
    
    if ([tileModel.story containsString:@"Captain Black Beard"]) {
        self.actionButton.backgroundColor = [UIColor blueColor];
        if (!tileModel.actionDone) {
            self.leftButton.hidden = YES;
            self.upButton.hidden = YES;
            self.rightButton.hidden = YES;
            self.downButton.hidden = YES;
        }
    } else if (!tileModel.actionDone) {
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
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"Reset" message:@"Are you sure you want to start again?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        //Cancel
    }];
    UIAlertAction *resetAction = [UIAlertAction actionWithTitle:@"Reset" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self startGame];
    }];
    
    [alertView addAction:cancelAction];
    [alertView addAction:resetAction];
    [self presentViewController:alertView animated:YES completion:nil];
}

-(void)startGame {
    Factory *gameFactory = [[Factory alloc] init];
    self.map = [gameFactory tiles];
    self.player = [gameFactory player];
    self.boss = [gameFactory boss];
    
    Tile *tileModel = [[Tile alloc] init];
    tileModel = [[self.map objectAtIndex:0] objectAtIndex:0];
    
    self.armorLabel.text = self.player.playerArmor.name;
    self.weaponLabel.text = self.player.playerWeapon.name;
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.player.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.player.damage];
    self.backgroundImage.image = tileModel.background;
    self.storyLabel.text = tileModel.story;
    self.currentLocation = CGPointMake(0, 0);
    self.leftButton.hidden = YES;
    self.downButton.hidden = YES;
    self.upButton.hidden = NO;
    self.rightButton.hidden = NO;
    [self.actionButton setTitle:tileModel.action forState:UIControlStateNormal];
}
@end
