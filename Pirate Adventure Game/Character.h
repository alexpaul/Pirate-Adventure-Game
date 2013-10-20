//
//  Character.h
//  Pirate Adventure Game
//
//  Created by Alex Paul on 10/17/13.
//  Copyright (c) 2013 Alex Paul. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Weapon;
@class Armor;

@interface Character : NSObject

@property (nonatomic) int health;
@property (nonatomic) int damage;
@property (nonatomic, strong) Weapon *weapon;
@property (nonatomic, strong) Armor *armor;

@end
