//
//  Tile.h
//  Pirate Adventure Game
//
//  Created by Alex Paul on 10/17/13.
//  Copyright (c) 2013 Alex Paul. All rights reserved.
//
//  Tiles are objects which will package the information required to update our view.
//  When a valid movement is not possible the buttons should be inactive or hidden.

#import <Foundation/Foundation.h>

@class Weapon;
@class Armor;

@interface Tile : NSObject

@property (nonatomic, strong) UIImage *backgroundImage;
@property (nonatomic, strong) NSString *story;
@property (nonatomic) CGPoint point; // in the 4 x 3 coordinate system
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *actionButtonName;
@property (nonatomic, strong) NSArray *validMovements; // North, South, East, West
@property (nonatomic, strong) Weapon *weapon;
@property (nonatomic, strong) Armor *armor;
@property (nonatomic) int healthEffect;

@end
