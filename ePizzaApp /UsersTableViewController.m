//
//  UsersTableViewController.m
//  ePizzaApp
//
//  Created by JayB on 12/13/15.
//  Copyright © 2015 ePizza. All rights reserved.
//

#import "UsersTableViewController.h"
#import "PizzaDatabase.h"
#import "UserTableViewCell.h"
#import "User.h"

@interface UsersTableViewController ()

@end

@implementation UsersTableViewController

@synthesize userInfos = _userinfos;
@synthesize numberOfSections = _numberOfSections;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    if(self.numberOfSections == 1) {
        //init two dimentional array
        self.userInfos = [[NSMutableArray alloc] initWithCapacity:1];
        
        NSArray *allRecords = [PizzaDatabase database].allRecords;
        [self.userInfos insertObject:allRecords atIndex:0];
    } else {
        //init two dimentional array
        self.userInfos = [[NSMutableArray alloc] initWithCapacity:3];

        //filter array with age
        NSArray *allRecords = [PizzaDatabase database].allRecords;
        [self.userInfos insertObject:[self filterArrayWithAge:allRecords fromAge:@"0" toAge:@"20"] atIndex:0];
        [self.userInfos insertObject:[self filterArrayWithAge:allRecords fromAge:@"21" toAge:@"40"] atIndex:1];
        [self.userInfos insertObject:[self filterArrayWithAge:allRecords fromAge:@"41" toAge:@"60"] atIndex:2];
        [self.userInfos insertObject:[self filterArrayWithAge:allRecords fromAge:@"61" toAge:@"100"] atIndex:3];
    }
    
    [self.tableView reloadData];
    
}

- (NSArray *) filterArrayWithAge:(NSArray *)records fromAge:(NSString *)minAge toAge:(NSString *)maxAge {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"age <= %@ AND age > %@", maxAge, minAge];
    records = [records filteredArrayUsingPredicate:predicate];
    return records;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSString *ageRange;
    switch (section) {
        case 0:
            if (self.numberOfSections == 1) {
                ageRange = @"All Records";
            } else {
                ageRange = @"Age below 20";
            }
            break;
            
        case 1:
            ageRange = @"Age 21-40";
            break;
        
        case 2:
            ageRange = @"Age 41-60";
            break;
            
        case 3:
            ageRange = @"Age above 60";
            break;
        
        default:
            ageRange = @"";
            break;
    }
    
    return ageRange;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    //if user exist set header size 20
    if ([[self.userInfos objectAtIndex:section] count] > 0) {
        return 20.0;
    }
    
    //else hide header
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.numberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *array = [self.userInfos objectAtIndex:section];
    return array.count;
    
    //return [[self.userInfos objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"usersidentifier" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UserTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"usersidentifier"];
    }
    
    User *userInfo = [[self.userInfos objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    // Configure the cell...
    [cell setUpData:userInfo];
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
