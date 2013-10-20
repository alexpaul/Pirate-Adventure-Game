//
//  PAGViewController.m
//  Pirate Adventure Game
//
//  Created by Alex Paul on 10/17/13.
//  Copyright (c) 2013 Alex Paul. All rights reserved.
//
//
//  This is a coordinate system game. Users are able to navigate to different "Tiles"
//  by pressing one of 4 directional arrows.

#import "PAGViewController.h"
#import "Factory.h" // + (NSArray *)tileObjects (Array to Tile Objects)
#import "Tile.h" // background, story, point
#import "Character.h" // health, damage, weapon, armorStat
#import "Weapon.h"
#import "Armor.h"
#import "Boss.h"

@interface PAGViewController ()

//  Direction Buttons
@property (weak, nonatomic) IBOutlet UIButton *northButton;
@property (weak, nonatomic) IBOutlet UIButton *southButton;
@property (weak, nonatomic) IBOutlet UIButton *eastButton;
@property (weak, nonatomic) IBOutlet UIButton *westButton;

//  Character Stats View
@property (weak, nonatomic) IBOutlet UILabel *healthLabel;
@property (weak, nonatomic) IBOutlet UILabel *damageLabel;
@property (weak, nonatomic) IBOutlet UILabel *weaponLabel;
@property (weak, nonatomic) IBOutlet UILabel *armorLabel;

//  Actions View
@property (weak, nonatomic) IBOutlet UIButton *actionsButton;

//  Story View
@property (weak, nonatomic) IBOutlet UILabel *storyLabel;

//  Image View
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

//  Boss
@property (nonatomic, strong) Boss *boss;
@property (weak, nonatomic) IBOutlet UILabel *bossTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bossHealthLabel;

@property (nonatomic) CGPoint point;
@property (nonatomic, retain) Character *character;
@property (nonatomic, strong) Tile *tile;


@property (nonatomic) BOOL octopusWasDefeated;
@property (nonatomic) BOOL walkThePlank;
@property (nonatomic) BOOL bossDidAttack;

@end

@implementation PAGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.octopusWasDefeated = NO;
    self.walkThePlank = NO;
    self.bossDidAttack = NO;
    
    Factory *factory = [[Factory alloc] init]; // Creates 12 Tiles
    
    self.tile = [factory currentTileInPlay]; // Returns Tile 1
    
    CGPoint point = self.tile.point; // 0,0
    self.point = point;
    
    // Hides or Makes visible the direction arrows based on valid moves
    [self validDirections:point];
    
    //  Create a Character for the Game
    self.character = [factory character];
    
    //  Create a Boss for the Game
    self.boss = [factory boss];
    self.bossTitleLabel.hidden = YES;
    self.bossHealthLabel.hidden = YES;
    
    //  Update the View
    [self updateView];
}

- (void)updateView
{
    [self checkAndDisableActionButtonIfApplicable];
    
    [self.actionsButton setTitle:self.tile.actionButtonName forState:UIControlStateNormal]; // of Tile 1
    self.imageView.image = self.tile.backgroundImage;
    self.storyLabel.text = self.tile.story;
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health]; // of Tile 1
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damage]; // of Tile 1
    self.weaponLabel.text = self.character.weapon.name;
    self.armorLabel.text = self.character.armor.name;
    
    if (self.character.health < 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Game Over" message:@"You got defeated by the Pirate Boss." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alertView show];
    }
    if (self.boss.health == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"You Win!" message:@"You successfully completed all the tasks and defeated the Pirate Boss." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alertView show];
    }
    if (self.boss.health == 5) {
        [self.actionsButton setTitle:@"Finish Him" forState:UIControlStateNormal];
    }
}

- (void)checkAndDisableActionButtonIfApplicable
{
    if ([self.tile.name isEqualToString:@"Tile 5" ] && self.octopusWasDefeated == NO) {
        [self disableDirectionalArrorsForTile:self.tile];
    }
    if ([self.tile.name isEqualToString:@"Tile 9" ] && self.walkThePlank == NO) {
        [self disableDirectionalArrorsForTile:self.tile];
    }
    if ([self.tile.name isEqualToString:@"Tile 12" ] && self.bossDidAttack == NO) {
        [self disableDirectionalArrorsForTile:self.tile];
        self.actionsButton.enabled = NO;
        [self performSelector:@selector(bossAttack) withObject:nil afterDelay:2.0];
    }
}

- (void)validDirections:(CGPoint)currentPoint
{
    // North
    if (currentPoint.y != 2) {
        self.northButton.hidden = NO;
    }else{
        self.northButton.hidden = YES;
    }
    // South
    if (currentPoint.y != 0) {
        self.southButton.hidden = NO;
    }else{
        self.southButton.hidden = YES;
    }
    // East
    if (currentPoint.x != 3) {
        self.eastButton.hidden = NO;
    }else{
        self.eastButton.hidden = YES;
    }
    // West
    if (currentPoint.x != 0) {
        self.westButton.hidden = NO;
    }else{
        self.westButton.hidden = YES;
    }
}

// Valid x and y values:
// x: 0, 1, 2, 3
// y: 0, 1, 2
- (IBAction)directionButtonPressed:(UIButton *)sender
{
    CGPoint newPoint = self.point;
    
    // Move North: +1 on y point, x no change
    if ([sender.titleLabel.text isEqualToString:@"N"]) {        
        if (self.point.y != 2) {
            newPoint.y = self.point.y + 1;
        }else{
            newPoint.y = self.point.y;
            self.northButton.hidden = YES;
        }
        newPoint.x = self.point.x;
    }
    
    // Move South: -1 on y point, x no change
    if ([sender.titleLabel.text isEqualToString:@"S"]) {
        if (self.point.y != 0) {
            newPoint.y = self.point.y - 1;
        }else{
            newPoint.y = self.point.y;
            self.southButton.hidden = YES;
        }
        newPoint.x = self.point.x;
    }
    
    // Move East: +1 on x point, y no change
    if ([sender.titleLabel.text isEqualToString:@"E"]) {
        if (self.point.x != 3) {
            newPoint.x = self.point.x + 1;
        }else{
            newPoint.x = self.point.x;
            self.eastButton.hidden = YES;
        }
        newPoint.y = self.point.y;
    }
    
    // Move West: -1 on x point, y no change
    if ([sender.titleLabel.text isEqualToString:@"W"]) {
        if (self.point.x != 0) {
            newPoint.x = self.point.x - 1;
        }else{
            newPoint.x = self.point.x;
            self.westButton.hidden = YES;
        }
        newPoint.y = self.point.y;
    }
    
    // Point in View
    self.point = newPoint;
    
    // Update "Factory" model class
    Factory *factory = [[Factory alloc] init];
    [factory updateCurrentTileWithPoint:self.point];
    self.tile = [factory currentTile];

    //  Update the direction buttons (hide non valid directions)
    [self validDirections:self.point];
    
    //  Update the entire view
    [self updateView];
}

- (IBAction)resetTheGame:(UIButton *)sender
{
    [self viewDidLoad];    
}
- (IBAction)actionsButtonPressed:(UIButton *)sender // character: health, damage, weapon, armor
{
    if ([self.tile.name isEqualToString:@"Tile 1"]) { // Start
        self.character.weapon.name = @"Sword";
        self.character.health += 5;
        self.character.damage +=10;
    }
    if ([self.tile.name isEqualToString:@"Tile 2"]) { // Blacksmith
        self.character.health += 2;
    }
    if ([self.tile.name isEqualToString:@"Tile 3"]) { // Weapons
        self.character.weapon.name = @"Pistol";
        self.character.health += 5;
    }
    if ([self.tile.name isEqualToString:@"Tile 4"]) { // Treasure
        self.character.health += 10;
    }
    if ([self.tile.name isEqualToString:@"Tile 5"]) { // Octopus Attack
        self.character.health -= 8;
        [self enableDirectionalArrorsForTile:self.tile];
        self.octopusWasDefeated = YES;
    }
    if ([self.tile.name isEqualToString:@"Tile 6"]) { // Friendly Dock
        self.character.health += 5;
    }
    if ([self.tile.name isEqualToString:@"Tile 7"]) { // Parrot
        self.character.health += 8;
    }
    if ([self.tile.name isEqualToString:@"Tile 8"]) { // Treasure 2
        self.character.health += 20;
    }
    if ([self.tile.name isEqualToString:@"Tile 9"]) { // Plank
        self.character.health -= 20;
        self.character.damage +=20;
        [self enableDirectionalArrorsForTile:self.tile];
        self.walkThePlank = YES;
    }
    if ([self.tile.name isEqualToString:@"Tile 10"]) { // Attack
        self.character.health -= 5;
        self.character.damage +=10;
    }
    if ([self.tile.name isEqualToString:@"Tile 11"]) { // Ship Battle
        self.character.health -= 10;
        self.character.damage +=10;
    }
    if ([self.tile.name isEqualToString:@"Tile 12"]) { // Boss
        self.bossTitleLabel.hidden = NO;
        self.bossHealthLabel.hidden = NO;
        
        self.character.health -= 10;
        self.boss.health -=5;
        
        self.bossHealthLabel.text = [NSString stringWithFormat:@"%i", self.boss.health];
        
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(bossAttack) object:nil];
        
        [self enableDirectionalArrorsForTile:self.tile];
    }
    [self updateView];
}

- (void)disableDirectionalArrorsForTile:(Tile *)tile
{
    for (NSString *direction in tile.validMovements) {
        if ([direction isEqualToString:@"North"]) {
            self.northButton.hidden = YES;
        }
        if ([direction isEqualToString:@"South"]) {
            self.southButton.hidden = YES;
        }
        if ([direction isEqualToString:@"East"]) {
            self.eastButton.hidden = YES;
        }
        if ([direction isEqualToString:@"West"]) {
            self.westButton.hidden = YES;
        }
    }
}

- (void)enableDirectionalArrorsForTile:(Tile *)tile
{
    for (NSString *direction in tile.validMovements) {
        if ([direction isEqualToString:@"North"]) {
            self.northButton.hidden = NO;
        }
        if ([direction isEqualToString:@"South"]) {
            self.southButton.hidden = NO;
        }
        if ([direction isEqualToString:@"East"]) {
            self.eastButton.hidden = NO;
        }
        if ([direction isEqualToString:@"West"]) {
            self.westButton.hidden = NO;
        }
    }
}

- (void)bossAttack
{
    self.character.health -= 5;
    
    self.bossDidAttack = YES; // boss did attack character at least once
    
    self.actionsButton.enabled = YES; // enable "Fight" button
    
    [self updateView];
}

@end
