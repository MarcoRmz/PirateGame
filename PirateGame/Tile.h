//
//  Tile.h
//  PirateGame
//
//  Created by Marco Ramirez on 6/25/15.
//  Copyright (c) 2015 Marco Ramirez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weapon.h"
#import "Armor.h"

@interface Tile : NSObject

@property (nonatomic, strong) NSString *story;
@property (nonatomic, strong) NSString *action;
@property (strong, nonatomic) UIImage *background;
@property (nonatomic) BOOL actionDone;
@property (strong, nonatomic) Armor *armor;
@property (strong, nonatomic) Weapon *weapon;
@property (nonatomic) int healthEffect;

@end
