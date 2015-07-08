//
//  Factory.m
//  PirateGame
//
//  Created by Marco Ramirez on 6/25/15.
//  Copyright (c) 2015 Marco Ramirez. All rights reserved.
//

#import "Factory.h"

@implementation Factory

-(NSMutableArray *) tiles {
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
    firstTile.story = @"Over drinks a crew mate tells you: 'Captain, we need a leader such as yourself to undertake a voyage and stop the evil Pirate Black Beard.'";
    secondTile.story = @"The crew starts to get scared and tired of the mission, convince them to continue the journey and get a powerful steel knife from them.";
    thirdTile.story = @"You have arrived to the armory would you like to updrade your weapon to a sword?";
    fourthTile.story = @"You have arrived to the ship's kitchen and you feel hungry, eat some soup?";
    fifthTile.story = @"Your shio has been boarded by enemy pirates defend your ship from capture.";
    sixthTile.story = @"Your crew has grown relentless and tired they have riotted and they want you to walk the plank.";
    seventhTile.story = @"Your ship has found treasure island rejoice with its treasures.";
    eightTile.story = @"Your ship has made port at a town you go to the shop for a gun, upgrade your weapon?";
    ninthTile.story = @"You have found a forger and after telling your story he offers you a Knight armor, upgrade armor?";
    tenthTile.story = @"You are at the Captain's Quarters and you find your piercing silk, would you like to put it on?";
    eleventhTile.story = @"You have sailed to skark infested waters you know that shark skin is very hard and can be helpful in battle, fight shark?";
    twelveTile.story = @"Finally, you have found Captain Black Beard, defeat him!";
    
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
    Armor *armor2 = [[Armor alloc] init];
    armor2.name = @"Knight Armor";
    armor2.healthBonus = 20;
    ninthTile.armor = armor2;
    
    Armor *armor3 = [[Armor alloc] init];
    armor3.name = @"Piercing Silk";
    armor3.healthBonus = 10;
    tenthTile.armor = armor3;
    
    Armor *armor4 = [[Armor alloc] init];
    armor4.name = @"Shark Skin";
    armor4.healthBonus = 15;
    eleventhTile.armor = armor4;
    
    //Tiles' Weapon
    Weapon *weapon2 = [[Weapon alloc] init];
    weapon2.name = @"Knife";
    weapon2.damage = 10;
    secondTile.weapon = weapon2;
    
    Weapon *weapon3 = [[Weapon alloc] init];
    weapon3.name = @"Sword";
    weapon3.damage = 15;
    thirdTile.weapon = weapon3;
    
    Weapon *weapon4 = [[Weapon alloc] init];
    weapon4.name = @"Gun";
    weapon4.damage = 20;
    eightTile.weapon = weapon4;
    
    //Tiles' Health effect
    firstTile.healthEffect = -5;
    secondTile.healthEffect = 0;
    thirdTile.healthEffect = 0;
    fourthTile.healthEffect = 10;
    fifthTile.healthEffect = -20;
    sixthTile.healthEffect = -5;
    seventhTile.healthEffect = 20;
    eightTile.healthEffect = 0;
    ninthTile.healthEffect = 0;
    tenthTile.healthEffect = 0;
    eleventhTile.healthEffect = 0;
    twelveTile.healthEffect = -15;
    
    //Tiles' BKG Image
    firstTile.background = [UIImage imageNamed:@"PirateStart.jpg"];
    secondTile.background = [UIImage imageNamed:@"PirateParrot.jpg"];
    thirdTile.background = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    fourthTile.background = [UIImage imageNamed:@"PirateAttack.jpg"];
    fifthTile.background = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    sixthTile.background = [UIImage imageNamed:@"PiratePlank.jpg"];
    seventhTile.background = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    eightTile.background = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    ninthTile.background = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    tenthTile.background = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    eleventhTile.background = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    twelveTile.background = [UIImage imageNamed:@"PirateBoss.jpeg"];
    
    //Initialize Array of tiles
    NSMutableArray *randTiles = [[NSMutableArray alloc] initWithObjects: secondTile, thirdTile, fourthTile, fifthTile, sixthTile, seventhTile, eightTile, ninthTile, tenthTile, eleventhTile, twelveTile, nil];
    
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
                [[tiles objectAtIndex:col] replaceObjectAtIndex:row withObject:[randTiles objectAtIndex:randomNumber]];
                [randTiles removeObjectAtIndex:randomNumber];
            }
        }
    }
    
    return tiles;
}

-(Character *) player {
    Armor *playerArmor = [[Armor alloc] init];
    playerArmor.name = @"Cloth";
    playerArmor.healthBonus = 5;
    
    Weapon *playerWeapon = [[Weapon alloc] init];
    playerWeapon.name = @"Fists";
    playerWeapon.damage = 5;
    
    Character *playerCreation = [[Character alloc] init];
    playerCreation.health = 100;
    playerCreation.damage = 5;
    playerCreation.playerArmor = playerArmor;
    playerCreation.playerWeapon = playerWeapon;
    
    return playerCreation;
}

-(Character *) boss {    
    Character *playerCreation = [[Character alloc] init];
    playerCreation.health = 100;
    
    return playerCreation;
}

@end
