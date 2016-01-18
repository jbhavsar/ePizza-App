//
//  UsersTableViewController.h
//  ePizzaApp
//
//  Created by JayB on 12/13/15.
//  Copyright © 2015 ePizza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UsersTableViewController : UITableViewController {
    NSMutableArray *_userInfos;
    
}

@property (nonatomic) int numberOfSections;
@property (nonatomic, retain) NSMutableArray *userInfos;

@end
