//
//  User.m
//  ePizzaApp
//
//  Created by JayB on 12/13/15.
//  Copyright © 2015 ePizza. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize uniqueId = _uniqueId;
@synthesize name = _name;
@synthesize favPizzaPlace = _favPizzaPlace;
@synthesize age = _age;
@synthesize topping1 = _topping1;
@synthesize topping2 = _topping2;
@synthesize topping3 = _topping3;

- (id)initWithUniqueId:(int)uniqueId name:(NSString *)name favPizzaPlace:(NSString *)favPizzaPlace age:(NSString *)age topping1: (NSString *)topping1 topping2: (NSString *)topping2 topping3: (NSString *)topping3 {
    if ((self = [super init])) {
        self.uniqueId = uniqueId;
        self.name = name;
        self.favPizzaPlace = favPizzaPlace;
        self.age = age;
        self.topping1 = topping1;
        self.topping2 = topping2;
        self.topping3 = topping3;
    }
    return self;
}

- (void) dealloc {
    self.name = nil;
    self.favPizzaPlace = nil;
    self.age = nil;
    self.topping1 = nil;
    self.topping2 = nil;
    self.topping3 = nil;
}

@end
