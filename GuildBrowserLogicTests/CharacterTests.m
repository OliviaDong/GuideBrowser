//
//  CharacterTests.m
//  GuildBrowser
//
//  Created by Olivia Dong on 2016-04-25.
//  Copyright © 2016 Charlie Fulton. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Character.h"
#import "Item.h"

@interface CharacterTests : XCTestCase{
    NSDictionary *_characterDetailJson;
}

@property(nonatomic, strong) Character *testGuy;

@end

@implementation CharacterTests

- (void)setUp {
    [super setUp];
    
    NSURL *dataServiceUrl = [[NSBundle bundleForClass:self.class] URLForResource:@"character" withExtension:@"json"];
    
    NSData *sampleData = [NSData dataWithContentsOfURL:dataServiceUrl];
    NSError *error;
    
    id json = [NSJSONSerialization JSONObjectWithData:sampleData options:kNilOptions error:&error];
    XCTAssertNotNil(json, @"invalid test data");
    _characterDetailJson = json;
    
    self.testGuy = [[Character alloc] initWithCharacterDetailData:_characterDetailJson];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    _characterDetailJson = nil;
    _testGuy = nil;
    [super tearDown];
}

- (void)testCreateCharacterFromDetailJson{
    Character *testGuy1 = [[Character alloc] initWithCharacterDetailData:_characterDetailJson];
    XCTAssertNotNil(testGuy1, @"Could not create character from detail json");
    
    Character *testGuy2 = [[Character alloc] initWithCharacterDetailData:nil];
    XCTAssertNotNil(testGuy2, @"Could not create character from nil data");
}

-(void)testCreateCharacterFromDetailJsonProps
{
    XCTAssertEqualObjects(_testGuy.thumbnail, @"borean-tundra/171/40508075-avatar.jpg", @"thumbnail url is wrong");
    XCTAssertEqualObjects(_testGuy.name, @"Hagrel", @"name is wrong");
    XCTAssertEqualObjects(_testGuy.battleGroup, @"Emberstorm", @"battlegroup is wrong");
    XCTAssertEqualObjects(_testGuy.realm, @"Borean Tundra", @"realm is wrong");
    XCTAssertEqualObjects(_testGuy.achievementPoints, @3130, @"achievement points is wrong");
    XCTAssertEqualObjects(_testGuy.level,@85, @"level is wrong");
    
    XCTAssertEqualObjects(_testGuy.classType, @"Warrior", @"class type is wrong");
    XCTAssertEqualObjects(_testGuy.race, @"Human", @"race is wrong");
    XCTAssertEqualObjects(_testGuy.gender, @"Male", @"gener is wrong");
    XCTAssertEqualObjects(_testGuy.averageItemLevel, @379, @"avg item level is wrong");
    XCTAssertEqualObjects(_testGuy.averageItemLevelEquipped, @355, @"avg item level is wrong");
}

-(void)testCreateCharacterFromDetailJsonValidateItems
{
    XCTAssertEqualObjects(_testGuy.neckItem.name,@"Stoneheart Choker", @"name is wrong");
    XCTAssertEqualObjects(_testGuy.wristItem.name,@"Vicious Pyrium Bracers", @"name is wrong");
    XCTAssertEqualObjects(_testGuy.waistItem.name,@"Girdle of the Queen's Champion", @"name is wrong");
    XCTAssertEqualObjects(_testGuy.handsItem.name,@"Time Strand Gauntlets", @"name is wrong");
    XCTAssertEqualObjects(_testGuy.shoulderItem.name,@"Temporal Pauldrons", @"name is wrong");
    XCTAssertEqualObjects(_testGuy.chestItem.name,@"Ruthless Gladiator's Plate Chestpiece", @"name is wrong");
    XCTAssertEqualObjects(_testGuy.fingerItem1.name,@"Thrall's Gratitude", @"name is wrong");
    XCTAssertEqualObjects(_testGuy.fingerItem2.name,@"Breathstealer Band", @"name is wrong");
    XCTAssertEqualObjects(_testGuy.shirtItem.name,@"Black Swashbuckler's Shirt", @"name is wrong");
    XCTAssertEqualObjects(_testGuy.tabardItem.name,@"Tabard of the Wildhammer Clan", @"nname is wrong");
    XCTAssertEqualObjects(_testGuy.headItem.name,@"Vicious Pyrium Helm", @"neck name is wrong");
    XCTAssertEqualObjects(_testGuy.backItem.name,@"Cloak of the Royal Protector", @"neck name is wrong");
    XCTAssertEqualObjects(_testGuy.legsItem.name,@"Bloodhoof Legguards", @"neck name is wrong");
    XCTAssertEqualObjects(_testGuy.feetItem.name,@"Treads of the Past", @"neck name is wrong");
    XCTAssertEqualObjects(_testGuy.mainHandItem.name,@"Axe of the Tauren Chieftains", @"neck name is wrong");
    XCTAssertEqualObjects(_testGuy.offHandItem.name,nil, @"offhand should be nil");
    XCTAssertEqualObjects(_testGuy.trinketItem1.name,@"Rosary of Light", @"neck name is wrong");
    XCTAssertEqualObjects(_testGuy.trinketItem2.name,@"Bone-Link Fetish", @"neck name is wrong");
    XCTAssertEqualObjects(_testGuy.rangedItem.name,@"Ironfeather Longbow", @"neck name is wrong");
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
