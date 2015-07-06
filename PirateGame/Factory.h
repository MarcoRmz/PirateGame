//
//  Factory.h
//  PirateGame
//
//  Created by Marco Ramirez on 6/25/15.
//  Copyright (c) 2015 Marco Ramirez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tile.h"
#import "Character.h"

@interface Factory : NSObject

-(NSMutableArray *) tiles;
-(Character *) player;

@end
