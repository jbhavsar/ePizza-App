//
//  LoginViewController.m
//  ePizzaApp
//
//  Created by JayB on 11/22/15.
//  Copyright (c) 2015 ePizza. All rights reserved.
//

#import "LoginViewController.h"
#import "PizzaDatabase.h"
#import "UsersTableViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.loginButton.delegate = self;
    self.loginButton.readPermissions = @[@"public_profile", @"email"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)checkFieldsComplete {
    
    //check if all the textfields are empty. (validation)
    if (_usernameField.text.length == 0 || _favPizzaField.text.length == 0 || _topping1Field.text.length == 0 || _topping2Field.text.length == 0 || _topping3Field.text.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ooopse!" message:@"You need to complete all the fields" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
        return false;
    }
    
    return true;
}

- (User *) createUser {
    //init user
    User *user = [[User alloc] init];
    user.name = _usernameField.text;
    user.age = _ageLabel.text;
    user.favPizzaPlace = _favPizzaField.text;
    user.topping1 = _topping1Field.text;
    user.topping2 = _topping2Field.text;
    user.topping3 = _topping3Field.text;
    
    return user;
}

- (IBAction)homeButton:(id)sender {
    NSString *segueIdentifier = @"homeScreen";
    
    //transition to homeviewcontroller
    [self performSegueWithIdentifier:segueIdentifier sender:sender];
}

- (IBAction)saveButton:(id)sender {
    
    if ([self checkFieldsComplete]) {
        BOOL isSaved = [[PizzaDatabase database] saveUser:[self createUser]];
        if (isSaved) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Awesome!" message:@"New user added" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ooopse!" message:@"Something went wrong please try again" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }
    
}

- (IBAction)allUsersButton:(id)sender {
    NSString *segueIdentifier = @"showAllUsers";
    
    //transition to homeviewcontroller
    ((UIButton *)sender).tag = 1;
    [self performSegueWithIdentifier:segueIdentifier sender:sender];
}

- (IBAction)userByAgeButton:(id)sender {
    NSString *segueIdentifier = @"showAllUsers";
    
    //transition to homeviewcontroller
    ((UIButton *)sender).tag = 4;
    [self performSegueWithIdentifier:segueIdentifier sender:sender];
}

- (IBAction)sliding:(id)sender {
    UISlider *s = (UISlider *)sender;
    int value = s.value;
    NSString *age = [[NSString alloc]initWithFormat:@"%i", value];
    
    //set slider value to ageLabel
    _ageLabel.text = age;
}

- (IBAction)getRidOfKeyboard:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)tapBackground:(id)sender {
    [_usernameField resignFirstResponder];
    [_favPizzaField resignFirstResponder];
    [_topping1Field resignFirstResponder];
    [_topping2Field resignFirstResponder];
    [_topping3Field resignFirstResponder];
}

#pragma mark - FBLoginView Delegate method implementation

-(void)loginViewShowingLoggedInUser:(FBLoginView *)loginView{
    self.lblLoginStatus.text = @"You are logged in.";
}


-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user{
    NSLog(@"%@", user);
    self.lblUserName.text = user.name;
}


-(void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView{
    self.lblLoginStatus.text = @"You are logged out";
}


-(void)loginView:(FBLoginView *)loginView handleError:(NSError *)error{
    NSLog(@"%@", [error localizedDescription]);
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqual: @"showAllUsers"]) {
        UsersTableViewController *usersTableViewController = (UsersTableViewController *) [segue destinationViewController];
        usersTableViewController.numberOfSections = (int) [sender tag];
    }
    
}

@end
