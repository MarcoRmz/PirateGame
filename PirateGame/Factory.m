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
    
    NSString *story1 = @"story1";
    NSString *story2 = @"story2";
    NSString *story3 = @"story3";
    NSString *story4 = @"story4";
    NSString *story5 = @"story5";
    NSString *story6 = @"story6";
    NSString *story7 = @"story7";
    NSString *story8 = @"story8";
    NSString *story9 = @"story9";
    NSString *story10 = @"story10";
    NSString *story11 = @"story11";
    NSString *story12 = @"story12";
    NSMutableArray *stories = [[NSMutableArray alloc] initWithObjects: story2, story3, story4, story5, story6, story7, story8, story9, story10, story11, story12, nil];
    
    firstTile.story = story1;
    secondTile.story = story2;
    thirdTile.story = story3;
    fourthTile.story = story4;
    fifthTile.story = story5;
    sixthTile.story = story6;
    seventhTile.story = story7;
    eightTile.story = story8;
    ninthTile.story = story9;
    tenthTile.story = story10;
    eleventhTile.story = story11;
    twelveTile.story = story12;
    /*int randomNumber;
    for (int col = 1; col < 3; col++) {
        for (int row = 0; col < 4; row++) {
            randomNumber = arc4random() % [stories count];
            
        }
    } */
    
    NSArray *firstCol = [[NSArray alloc] initWithObjects:firstTile, secondTile, thirdTile, nil];
    NSArray *secondCol = [[NSArray alloc] initWithObjects:fourthTile, fifthTile, sixthTile, nil];
    NSArray *thirdCol = [[NSArray alloc] initWithObjects:seventhTile, eightTile, ninthTile, nil];
    NSArray *fourthCol = [[NSArray alloc] initWithObjects:tenthTile, eleventhTile, twelveTile, nil];
    
    NSArray *tiles = [[NSArray alloc] initWithObjects:firstCol, secondCol, thirdCol, fourthCol, nil];
    
    return tiles;
}

@end
