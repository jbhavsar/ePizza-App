//
//  PizzaDatabase.m
//  ePizzaApp
//
//  Created by JayB on 12/13/15.
//  Copyright © 2015 ePizza. All rights reserved.
//

#import "PizzaDatabase.h"

@implementation PizzaDatabase

static PizzaDatabase *_database;

//singleton object
+ (PizzaDatabase *)database {
    if (_database == nil) {
        _database = [[PizzaDatabase alloc] init];
    }
    return _database;
}

- (id)init {
    //open database
    if ((self = [super init])) {
        NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"epizza" ofType:@"sqlite3"];
        
        // check if database connection is successful
        if (sqlite3_open([sqLiteDb UTF8String], &_database) != SQLITE_OK) {
            NSLog(@"Failed to open database!");
        }
    }
    return self;
}

- (void)dealloc {
    //close database
    sqlite3_close(_database);
}

- (BOOL)saveUser:(User *)user {
    
    BOOL success = false;
    
    //query to save user
    NSString *insertQuery = [NSString stringWithFormat:
                       @"insert into user (name, age, fav_pizza_place, topping1, topping2, topping3) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\")",
                       user.name,
                       user.age,
                       user.favPizzaPlace,
                       user.topping1,
                       user.topping2,
                       user.topping3];
    
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_database, [insertQuery UTF8String], -1, &statement, nil) == SQLITE_OK) {
        sqlite3_prepare_v2(_database, [insertQuery UTF8String], -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            success = true;
        }
        sqlite3_finalize(statement);
    }
    return success;
    
}

- (NSArray *)allRecords {
    //query to get all users
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    NSString *query = @"SELECT * FROM user";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            //generate uniqueId
            int uniqueId = sqlite3_column_int(statement, 0);
            char *nameChars = (char *) sqlite3_column_text(statement, 0);
            char *ageChars = (char *) sqlite3_column_text(statement, 1);
            char *favPlaceChars = (char *) sqlite3_column_text(statement, 2);
            char *topping1Chars = (char *) sqlite3_column_text(statement, 3);
            char *topping2Chars = (char *) sqlite3_column_text(statement, 4);
            char *topping3Chars = (char *) sqlite3_column_text(statement, 5);
            NSString *name = [[NSString alloc] initWithUTF8String:nameChars];
            NSString *favPlace = [[NSString alloc] initWithUTF8String:favPlaceChars];
            NSString *age = [[NSString alloc] initWithUTF8String:ageChars];
            NSString *topping1 = [[NSString alloc] initWithUTF8String:topping1Chars];
            NSString *topping2 = [[NSString alloc] initWithUTF8String:topping2Chars];
            NSString *topping3 = [[NSString alloc] initWithUTF8String:topping3Chars];
            
            //populate model
            User *info = [[User alloc] initWithUniqueId:uniqueId name:name favPizzaPlace:favPlace age:age topping1:topping1 topping2:topping2 topping3:topping3];
            [retval addObject:info];
        }
        sqlite3_finalize(statement);
    }
    return retval;
    
}

- (NSArray *)recordsByAge:(NSString *)minAge secondAge:(NSString *)maxAge {
    //query to get users by age
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    NSString *query = [NSString stringWithFormat:@"SELECT * FROM user where age <= %@ AND age >= %@", minAge, maxAge];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            //generate uniqueId
            int uniqueId = sqlite3_column_int(statement, 0);
            char *nameChars = (char *) sqlite3_column_text(statement, 1);
            char *favPlaceChars = (char *) sqlite3_column_text(statement, 2);
            char *ageChars = (char *) sqlite3_column_text(statement, 3);
            char *topping1Chars = (char *) sqlite3_column_text(statement, 4);
            char *topping2Chars = (char *) sqlite3_column_text(statement, 5);
            char *topping3Chars = (char *) sqlite3_column_text(statement, 6);
            NSString *name = [[NSString alloc] initWithUTF8String:nameChars];
            NSString *favPlace = [[NSString alloc] initWithUTF8String:favPlaceChars];
            NSString *age = [[NSString alloc] initWithUTF8String:ageChars];
            NSString *topping1 = [[NSString alloc] initWithUTF8String:topping1Chars];
            NSString *topping2 = [[NSString alloc] initWithUTF8String:topping2Chars];
            NSString *topping3 = [[NSString alloc] initWithUTF8String:topping3Chars];

            //populate model
            User *info = [[User alloc] initWithUniqueId:uniqueId name:name favPizzaPlace:favPlace age:age topping1:topping1 topping2:topping2 topping3:topping3];
            [retval addObject:info];
        }
        sqlite3_finalize(statement);
    }
    return retval;
}

@end
