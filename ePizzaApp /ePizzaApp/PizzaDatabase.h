//
//  PizzaDatabase.h
//  ePizzaApp
//
//  Created by JayB on 12/13/15.
//  Copyright © 2015 ePizza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
#import "User.h"

@interface PizzaDatabase : NSObject {
    sqlite3 *_database;
}

+ (PizzaDatabase *)database;
- (NSArray *)allRecords;
- (NSArray *)recordsByAge:(NSString *)minAge secondAge:(NSString *)maxAge;
- (BOOL)saveUser:(User *)user;


@end
