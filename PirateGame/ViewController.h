//
//  ViewController.h
//  PirateGame
//
//  Created by Marco Ramirez on 6/25/15.
//  Copyright (c) 2015 Marco Ramirez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Character.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (strong, nonatomic) IBOutlet UILabel *armorLabel;
@property (strong, nonatomic) IBOutlet UILabel *weaponLabel;
@property (strong, nonatomic) IBOutlet UILabel *healthLabel;
@property (strong, nonatomic) IBOutlet UILabel *damageLabel;
@property (strong, nonatomic) IBOutlet UILabel *storyLabel;
@property (strong, nonatomic) Character *player;
@property (strong, nonatomic) Character *boss;
@property (strong, nonatomic) NSArray *map;
@property (nonatomic) CGPoint currentLocation;
@property (strong, nonatomic) IBOutlet UIButton *actionButton;
@property (strong, nonatomic) IBOutlet UIButton *upButton;
@property (strong, nonatomic) IBOutlet UIButton *leftButton;
@property (strong, nonatomic) IBOutlet UIButton *rightButton;
@property (strong, nonatomic) IBOutlet UIButton *downButton;


- (IBAction)actionButtonPressed:(UIButton *)sender;
- (IBAction)upButtonPressed:(UIButton *)sender;
- (IBAction)rightButtonPressed:(UIButton *)sender;
- (IBAction)leftButtonPressed:(UIButton *)sender;
- (IBAction)downButtonPressed:(UIButton *)sender;
- (IBAction)resetButtonPressed:(UIButton *)sender;

@end
