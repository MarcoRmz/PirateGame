//
//  ViewController.h
//  PirateGame
//
//  Created by Marco Ramirez on 6/25/15.
//  Copyright (c) 2015 Marco Ramirez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Character.h"
#import "Factory.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (strong, nonatomic) IBOutlet UILabel *armorLabel;
@property (strong, nonatomic) IBOutlet UILabel *weaponLabel;
@property (strong, nonatomic) IBOutlet UILabel *healthLabel;
@property (strong, nonatomic) IBOutlet UILabel *damageLabel;
@property (strong, nonatomic) IBOutlet UILabel *storyLabel;
@property (strong, nonatomic) Factory *gameFactory;
@property (strong, nonatomic) Character *player;
@property (strong, nonatomic) Character *boss;
@property (strong, nonatomic) NSArray *map;
@property (nonatomic) CGPoint currentLocation;

- (IBAction)actionButton:(UIButton *)sender;
- (IBAction)upButton:(UIButton *)sender;
- (IBAction)rightButton:(UIButton *)sender;
- (IBAction)leftButton:(UIButton *)sender;
- (IBAction)downButton:(UIButton *)sender;
- (IBAction)resetButton:(UIButton *)sender;
-(void)startGame;
-(void)updateXCordinate:(int)x andYCordinate:(int)y;

@end
