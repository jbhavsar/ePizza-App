//
//  LoginViewController.h
//  ePizzaApp
//
//  Created by JayB on 11/22/15.
//  Copyright (c) 2015 ePizza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface LoginViewController : UIViewController<FBLoginViewDelegate>

@property (weak, nonatomic) UIColor *color;
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *favPizzaField;
@property (weak, nonatomic) IBOutlet UITextField *topping1Field;
@property (weak, nonatomic) IBOutlet UITextField *topping2Field;
@property (weak, nonatomic) IBOutlet UITextField *topping3Field;

@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (strong, nonatomic) IBOutlet UIView *ageSlider;

@property (weak, nonatomic) IBOutlet FBLoginView *loginButton;
@property (weak, nonatomic) IBOutlet UILabel *lblLoginStatus;
@property (weak, nonatomic) IBOutlet UILabel *lblUserName;

- (IBAction)homeButton:(id)sender;
- (IBAction)saveButton:(id)sender;
- (IBAction)allUsersButton:(id)sender;
- (IBAction)userByAgeButton:(id)sender;
- (IBAction)sliding:(id)sender;
- (IBAction)getRidOfKeyboard:(id)sender;
- (IBAction)tapBackground:(id)sender;

//-(IBAction)registerAction:(id)sender;

@end
