//
//  Factory.m
//  Pirate Adventure Game
//
//  Created by Alex Paul on 10/17/13.
//  Copyright (c) 2013 Alex Paul. All rights reserved.
//
//  |Tile 3|Tile 6|Tile 9|Tile 12
//  -----------------------------
//  |Tile 2|Tile 5|Tile 8|Tile 11
//  -----------------------------
//  |Tile 1|Tile 4|Tile 7|Tile 10
//
//  // Column 1: 0,0, 0,1, 0,2, Column 2: 1,0, 1,1, 1,2 Column 3: 2,0, 2,1, 2,2 Column 4: 3,0, 3,1, 3,2


#import "Factory.h"
#import "Tile.h" // backgroundImage, story, point, actionButtonName, weapon, armor, healthEffect
#import "Armor.h" // name, damage, health bonus
#import "Weapon.h" // name, damage, health bonus
#import "Boss.h" // health, damage
#import "Character.h"


@implementation Factory

#pragma mark - Tile Objects
//  Create 12 Tile Objects
- (NSArray *)tileObjects
{
    // First Column of Tiles - Array 1
    Tile *tile1 = [[Tile alloc] init];
    tile1.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    tile1.story = @"Welcome to the Pirate Game Adventure";
    tile1.point = CGPointMake(0, 0);
    tile1.name = @"Tile 1";
    tile1.validMovements = @[@"North", @"East"];
    tile1.healthEffect = 100;
    tile1.actionButtonName = @"Take The Sword";
    
    Tile *tile2 = [[Tile alloc] init];
    tile2.backgroundImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    tile2.story = @"This is the blacksmith. What weapons would you like today?";
    tile2.point = CGPointMake(0, 1);
    tile2.name = @"Tile 2";
    tile2.validMovements = @[@"North", @"South", @"East"];
    tile2.healthEffect = 100;
    tile2.actionButtonName = @"Make some Pistols";
    
    Tile *tile3 = [[Tile alloc] init];
    tile3.backgroundImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    tile3.story = @"Grab those pistols for battle";
    tile3.point = CGPointMake(0, 2);
    tile3.name = @"Tile 3";
    tile3.validMovements = @[@"South", @"East"];
    tile3.healthEffect = 100;
    tile3.actionButtonName = @"Take Pistol";
    
    // Column 2 of Tiles - Array 2
    Tile *tile4 = [[Tile alloc] init];
    tile4.backgroundImage = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    tile4.story = @"Look it's treasure! Men anchor let's go for a dive";
    tile4.point = CGPointMake(1, 0);
    tile4.name = @"Tile 4";
    tile4.validMovements = @[@"North", @"East", @"West"];
    tile4.healthEffect = 100;
    tile4.actionButtonName = @"Take Tresure";

    Tile *tile5 = [[Tile alloc] init];
    tile5.backgroundImage = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    tile5.story = @"The most deadly creature of these seas. We have to fight together to battle this beast.";
    tile5.point = CGPointMake(1, 1);
    tile5.name = @"Tile 5";
    tile5.validMovements = @[@"North", @"South", @"East", @"West"];
    tile5.healthEffect = 100;
    tile5.actionButtonName = @"Attack";

    Tile *tile6 = [[Tile alloc] init];
    tile6.backgroundImage = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    tile6.story = @"Ahoy mates, grab your sacks and let's have a rest here before we sail again";
    tile6.point = CGPointMake(1, 2);
    tile6.name = @"Tile 6";
    tile6.validMovements = @[@"South", @"East", @"West"];
    tile6.healthEffect = 100;
    tile6.actionButtonName = @"Dock";

    // Column 3 of Tiles - Array 3
    Tile *tile7 = [[Tile alloc] init];
    tile7.backgroundImage = [UIImage imageNamed:@"PirateParrot.jpg"];
    tile7.story = @"Lets grab this Parrot for our journey, hopefully it brings us some luck";
    tile7.point = CGPointMake(2, 0);
    tile7.name = @"Tile 7";
    tile7.validMovements = @[@"North", @"East", @"West"];
    tile7.healthEffect = 100;
    tile7.actionButtonName = @"Take the Parrot";

    Tile *tile8 = [[Tile alloc] init];
    tile8.backgroundImage = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    tile8.story = @"We can call ourselves lucky, Men travel those waters and die never finding treasure";
    tile8.point = CGPointMake(2, 1);
    tile8.name = @"Tile 8";
    tile8.validMovements = @[@"North", @"South", @"East", @"West"];
    tile8.healthEffect = 100;
    tile8.actionButtonName = @"Take Tresure";

    Tile *tile9 = [[Tile alloc] init];
    tile9.backgroundImage = [UIImage imageNamed:@"PiratePlank.jpg"];
    tile9.story = @"Seems like you have no choice but to sacrifice one of your men, hahahhahaha";
    tile9.point = CGPointMake(2, 2);
    tile9.name = @"Tile 9";
    tile9.validMovements = @[@"South", @"East", @"West"];
    tile9.healthEffect = 100;
    tile9.actionButtonName = @"Walk The Plank";
    
    // Column 4 of Tiles - Array 4
    Tile *tile10 = [[Tile alloc] init];
    tile10.backgroundImage = [UIImage imageNamed:@"PirateAttack.jpg"];
    tile10.story = @"We're being attacked. Defend the ship with all your might";
    tile10.point = CGPointMake(3, 0);
    tile10.name = @"Tile 10";
    tile10.validMovements = @[@"North", @"West"];
    tile10.healthEffect = 100;
    tile10.actionButtonName = @"Defend the ship";

    Tile *tile11 = [[Tile alloc] init];
    tile11.backgroundImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    tile11.story = @"Seems that we are being attacked from all sides";
    tile11.point = CGPointMake(3, 1);
    tile11.name = @"Tile 11";
    tile11.validMovements = @[@"North", @"South", @"West"];
    tile11.healthEffect = 100;
    tile11.actionButtonName = @"Defend the ship";

    Tile *tile12 = [[Tile alloc] init];
    tile12.backgroundImage = [UIImage imageNamed:@"PirateBoss.jpeg"];
    tile12.story = @"There is no escaping me, prepare to die....brrrahhhahahah";
    tile12.point = CGPointMake(3, 2);
    tile12.name = @"Tile 12";
    tile12.validMovements = @[@"South", @"West"];
    tile12.healthEffect = 100;
    tile12.actionButtonName = @"Fight!";

    NSArray *array1 = [[NSArray alloc] initWithObjects:tile1, tile2, tile3, nil]; // Column 1
    NSArray *array2 = [[NSArray alloc] initWithObjects:tile4, tile5, tile6, nil]; // Column 2
    NSArray *array3 = [[NSArray alloc] initWithObjects:tile7, tile8, tile9, nil]; // Column 3
    NSArray *array4 = [[NSArray alloc] initWithObjects:tile10, tile11, tile12, nil]; // Column 4


    NSArray *allTilesArray = [[NSArray alloc] initWithObjects:array1, array2, array3, array4, nil]; // All Tiles in coordinate system
    
    return allTilesArray;
}

//  Update Tile Point Position in the 4 x 3 Coordinate System
- (void)updateCurrentTileWithPoint:(CGPoint)point // Column 1: 0,0, 0,1, 0,2, Column 2: 1,0, 1,1, 1,2 Column 3: 2,0, 2,1, 2,2 Column 4: 3,0, 3,1, 3,2
{
    Factory *factory = [[Factory alloc] init];
    NSArray *allTilesArray = [factory tileObjects];
    
    for (NSArray *array in allTilesArray) { // [allTilesArray[arrayOfTiles[tiles]]]
        for (Tile *tile in array) {
            if (CGPointEqualToPoint(point, tile.point)) {
                self.currentTile = tile;
                return;
            }
        }
    }
}

//  Returns the Current Tile in Play
- (Tile *)currentTileInPlay
{
    Tile *tile = [[Tile alloc] init];
    if (self.currentTile) {
        tile = self.currentTile;
    }else{
        Factory *factory = [[Factory alloc] init];
        tile = [[[factory tileObjects] objectAtIndex:0] objectAtIndex:0]; // Column 1, Tile 1 (Starts with Tile 1)

    }
    return tile;
}

#pragma mark - Weapon 
- (Weapon *)createAWeaponWithTheFollowingName:(NSString *)name damage:(int)damage healthBonus:(int)healthBonus
{
    Weapon *weapon = [[Weapon alloc] init];
    weapon.name = name;
    weapon.damage = damage;
    weapon.healthBonus = healthBonus;
    
    return weapon;
}

#pragma mark - Armor 
- (Armor *)createAnArmorWithTheFollowingName:(NSString *)name damage:(int)damage healthBonus:(int)healthBonus
{
    Armor *armor = [[Armor alloc] init];
    armor.name = name;
    armor.damage = damage;
    armor.healthBonus = healthBonus;
    
    return armor;
}

#pragma mark - Boss
- (Boss *)boss
{
    Boss *boss = [[Boss alloc] init];
    boss.health = 100;
    boss.damage = 10;
    
    return boss;
}

#pragma mark - Character
- (Character *)character
{
    Character *character = [[Character alloc] init];
    character.health = 100;
    character.damage = 0;
    character.weapon = [self createAWeaponWithTheFollowingName:@"" damage:0 healthBonus:0];
    character.armor = [self createAnArmorWithTheFollowingName:@"Shield" damage:0 healthBonus:10];
    
    return character;
}

@end
