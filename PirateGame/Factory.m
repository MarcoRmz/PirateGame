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
    
    //Tiles' Action BOOL
    
    //Tiles' Armor
    
    //Tiles' Weapon
    
    //Tiles' Health effect
    
    //Tiles' BKG Image
    
    //Initialize Array of tiles
    NSMutableArray *randTiles = [[NSMutableArray alloc] initWithObjects: firstTile, secondTile, thirdTile, fourthTile, fifthTile, sixthTile, seventhTile, eightTile, ninthTile, tenthTile, eleventhTile, twelveTile, nil];
    
    //littlePuppy.image = [UIImage imageNamed:@"Street.jpg"];
    
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
