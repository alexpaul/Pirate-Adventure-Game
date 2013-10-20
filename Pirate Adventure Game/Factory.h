//
//  Factory.h
//  Pirate Adventure Game
//
//  Created by Alex Paul on 10/17/13.
//  Copyright (c) 2013 Alex Paul. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Tile;
@class Weapon;
@class Armor;
@class Boss;
@class Character;

@interface Factory : NSObject

@property (nonatomic, strong) Tile *currentTile;

//  Tile Objects
- (NSArray *)tileObjects; // all 12 tiles
- (void)updateCurrentTileWithPoint:(CGPoint)point;
- (Tile *)currentTileInPlay;

//  Weapon
- (Weapon *)createAWeaponWithTheFollowingName:(NSString *)name damage:(int)damage healthBonus:(int)healthBonus;

//  Armor
- (Armor *)createAnArmorWithTheFollowingName:(NSString *)name damage:(int)damage healthBonus:(int)healthBonus;

//  Boss
- (Boss *)boss;

//  Character
- (Character *)character;

@end
