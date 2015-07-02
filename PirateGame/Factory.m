//
//  Factory.m
//  PirateGame
//
//  Created by Marco Ramirez on 6/25/15.
//  Copyright (c) 2015 Marco Ramirez. All rights reserved.
//

#import "Factory.h"

@implementation Factory

-(NSArray *) tiles {
    //Initialize Tiles
    Tile *firstTile = [[Tile alloc] init];
    Tile *secondTile = [[Tile alloc] init];
    Tile *thirdTile = [[Tile alloc] init];
    Tile *fourthTile = [[Tile alloc] init];
    Tile *fifthTile = [[Tile alloc] init];
    Tile *sixthTile = [[Tile alloc] init];
    Tile *seventhTile = [[Tile alloc] init];
    Tile *eightTile = [[Tile alloc] init];
    Tile *ninthTile = [[Tile alloc] init];
    Tile *tenthTile = [[Tile alloc] init];
    Tile *eleventhTile = [[Tile alloc] init];
    Tile *twelveTile = [[Tile alloc] init];
    
    //Tiles' Stories
    firstTile.story = @"story1";
    secondTile.story = @"story2";
    thirdTile.story = @"story3";
    fourthTile.story = @"story4";
    fifthTile.story = @"story5";
    sixthTile.story = @"story6";
    seventhTile.story = @"story7";
    eightTile.story = @"story8";
    ninthTile.story = @"story9";
    tenthTile.story = @"story10";
    eleventhTile.story = @"story11";
    twelveTile.story = @"story12";
    
    //Tiles' Actions
    firstTile.action = @"Chug Ron";
    secondTile.action = @"Convince Crew";
    thirdTile.action = @"Get Sword";
    fourthTile.action = @"Get Soup";
    fifthTile.action = @"Defend Ship";
    sixthTile.action = @"Show Courage";
    seventhTile.action = @"Retrieve Treasure";
    eightTile.action = @"Get Gun";
    ninthTile.action = @"Put Armor On";
    tenthTile.action = @"Change to Silk";
    eleventhTile.action = @"Catch Shark";
    twelveTile.action = @"Fight";
    
    //Tiles' Action BOOL
    firstTile.actionDone = NO;
    secondTile.actionDone = NO;
    thirdTile.actionDone = NO;
    fourthTile.actionDone = NO;
    fifthTile.actionDone = NO;
    sixthTile.actionDone = NO;
    seventhTile.actionDone = NO;
    eightTile.actionDone = NO;
    ninthTile.actionDone = NO;
    tenthTile.actionDone = NO;
    eleventhTile.actionDone = NO;
    twelveTile.actionDone = NO;
    
    //Tiles' Armor
    Armor *armor = [[Armor alloc] init];
    armor.name = @"Cloth";
    armor.healthBonus = 5;
    firstTile.armor = armor;
    
    armor.name = @"Knight Armor";
    armor.healthBonus = 20;
    ninthTile.armor = armor;
    
    armor.name = @"Piercing Silk";
    armor.healthBonus = 10;
    tenthTile.armor = armor;
    
    armor.name = @"Shark Skin";
    armor.healthBonus = 15;
    eleventhTile.armor = armor;
    
    //Tiles' Weapon
    Weapon *weapon = [[Weapon alloc] init];
    weapon.name = @"Fists";
    weapon.damage = 5;
    firstTile.weapon = weapon;
    
    weapon.name = @"Knife";
    weapon.damage = 10;
    secondTile.weapon = weapon;
    
    weapon.name = @"Sword";
    weapon.damage = 15;
    thirdTile.weapon = weapon;
    
    weapon.name = @"Gun";
    weapon.damage = 20;
    eightTile.weapon = weapon;
    
    //Tiles' Health effect
    firstTile.healthEffect = -5;
    fourthTile.healthEffect = 10;
    fifthTile.healthEffect = -20;
    sixthTile.healthEffect = -5;
    seventhTile.healthEffect = 20;
    twelveTile.healthEffect = -15;
    
    //Tiles' BKG Image
    firstTile.background = [UIImage imageNamed:@"PirateStart.jpg"];
    secondTile.background = [UIImage imageNamed:@"PirateParrot.jpg"];
    thirdTile.background = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    fourthTile.background = [UIImage imageNamed:@"PirateAttack.jpg"];
    fifthTile.background = [UIImage imageNamed:@"PirateShipBattle.jpg"];
    sixthTile.background = [UIImage imageNamed:@"PiratePlank.jpg"];
    seventhTile.background = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    eightTile.background = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    ninthTile.background = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    tenthTile.background = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    eleventhTile.background = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    twelveTile.background = [UIImage imageNamed:@"PirateBoss.jpeg"];
    
    //Initialize Array of tiles
    NSMutableArray *randTiles = [[NSMutableArray alloc] initWithObjects: firstTile, secondTile, thirdTile, fourthTile, fifthTile, sixthTile, seventhTile, eightTile, ninthTile, tenthTile, eleventhTile, twelveTile, nil];
    
    NSMutableArray *firstCol = [[NSMutableArray alloc] initWithObjects:firstTile, secondTile, thirdTile, nil];
    NSMutableArray *secondCol = [[NSMutableArray alloc] initWithObjects:fourthTile, fifthTile, sixthTile, nil];
    NSMutableArray *thirdCol = [[NSMutableArray alloc] initWithObjects:seventhTile, eightTile, ninthTile, nil];
    NSMutableArray *fourthCol = [[NSMutableArray alloc] initWithObjects:tenthTile, eleventhTile, twelveTile, nil];
    
    NSMutableArray *tiles = [[NSMutableArray alloc] initWithObjects:firstCol, secondCol, thirdCol, fourthCol, nil];
    
    int randomNumber;
    for (int col = 0; col < 4; col++) {
        for (int row = 0; row < 3; row++) {
            if (col == 0 && row == 0) {
                [[tiles objectAtIndex:col] replaceObjectAtIndex:row withObject:firstTile];
            } else {
                randomNumber = arc4random() % [randTiles count];
                //[[[tiles objectAtIndex:col] objectAtIndex:row] copy:tempTile];
                [[tiles objectAtIndex:col] replaceObjectAtIndex:row withObject:[randTiles objectAtIndex:randomNumber]];
                [randTiles removeObjectAtIndex:randomNumber];
            }
        }
    }
    
    return tiles;
}

@end
