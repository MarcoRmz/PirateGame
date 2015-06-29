//
//  Tile.h
//  PirateGame
//
//  Created by Marco Ramirez on 6/25/15.
//  Copyright (c) 2015 Marco Ramirez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tile : NSObject

@property (nonatomic, strong) NSString *story;
@property (nonatomic, strong) NSString *background;
@property (nonatomic, strong) NSString *action;
@property BOOL actionDone;

@end
