//
//  User.h
//  ePizzaApp
//
//  Created by JayB on 12/13/15.
//  Copyright © 2015 ePizza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject {
    int _uniqueId;
    NSString *_name;
    NSString *_favPizzaPlace;
    NSString *_age;
    NSString *_topping1;
    NSString *_topping2;
    NSString *_topping3;
}

@property (nonatomic, assign) int uniqueId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *favPizzaPlace;
@property (nonatomic, copy) NSString *age;
@property (nonatomic, copy) NSString *topping1;
@property (nonatomic, copy) NSString *topping2;
@property (nonatomic, copy) NSString *topping3;

- (id)initWithUniqueId:(int)uniqueId name:(NSString *)name favPizzaPlace:(NSString *)favPizzaPlace age:(NSString *)age topping1: (NSString *)topping1 topping2: (NSString *)topping2 topping3: (NSString *)topping3;

@end
