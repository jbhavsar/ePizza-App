//
//  UserTableViewCell.m
//  ePizzaApp
//
//  Created by JayB on 12/13/15.
//  Copyright © 2015 ePizza. All rights reserved.
//

#import "UserTableViewCell.h"

@implementation UserTableViewCell

@synthesize nameLabel;
@synthesize toppingLabel;
@synthesize favPizzaPlaceLabel;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setUpData:(User *)userInfo {
    self.nameLabel.text = userInfo.name;
    self.toppingLabel.text = [NSString stringWithFormat:@"%@, %@, %@", userInfo.topping1, userInfo.topping2, userInfo.topping3];
    self.favPizzaPlaceLabel.text = userInfo.favPizzaPlace;
}

@end
