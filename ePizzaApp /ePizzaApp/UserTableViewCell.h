//
//  UserTableViewCell.h
//  ePizzaApp
//
//  Created by JayB on 12/13/15.
//  Copyright © 2015 ePizza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface UserTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *toppingLabel;
@property (weak, nonatomic) IBOutlet UILabel *favPizzaPlaceLabel;

- (void)setUpData:(User *)userInfo;

@end
