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
    
    NSArray *firstRow = [[NSArray alloc] initWithObjects:firstTile, secondTile, thirdTile, nil];
    NSArray *secondRow = [[NSArray alloc] initWithObjects:fourthTile, fifthTile, sixthTile, nil];
    NSArray *thirdRow = [[NSArray alloc] initWithObjects:seventhTile, eightTile, ninthTile, nil];
    NSArray *fourthRow = [[NSArray alloc] initWithObjects:tenthTile, eleventhTile, twelveTile, nil];
    
    NSArray *tiles = [[NSArray alloc] initWithObjects:firstRow, secondRow, thirdRow, fourthRow, nil];
    
    return [self randomTiles:tiles];
}

-(NSArray *) randomTiles:(NSArray *)tiles {
    NSArray *newTiles = tiles;
    
    for (int col = 0; col < 4; col++) {
        for (int row = 0; col < 5; row++) {
            
        }
    }
    
    return newTiles;
}

@end
