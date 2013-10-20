//
//  Armor.h
//  Pirate Adventure Game
//
//  Created by Alex Paul on 10/17/13.
//  Copyright (c) 2013 Alex Paul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Armor : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic) int damage;
@property (nonatomic) int healthBonus;

@end
