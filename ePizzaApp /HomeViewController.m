//
//  HomeViewController.m
//  ePizzaApp
//
//  Created by JayB on 11/22/15.
//  Copyright (c) 2015 ePizza. All rights reserved.
//

#import "HomeViewController.h"
#import "PizzaPizzaViewController.h"
#import "SWRevealViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface HomeViewController () {
    NSString *webviewUrl;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( rightRevealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }

}

- (void)viewWillAppear:(BOOL)animated {
    [self.revealViewController revealToggleAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dominoPizza:(id)sender {
    webviewUrl = @"http://www.dominos.ca/";
    [self performSegueWithIdentifier:@"PizzaWebViewIdentifier" sender:sender];
    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0x2196F3)];
    //self.view.backgroundColor = UIColorFromRGB(0xE91E63);
    //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

}

- (IBAction)pizzaPizza:(id)sender {
    webviewUrl = @"http://www.pizzapizza.ca/";
    [self performSegueWithIdentifier:@"PizzaWebViewIdentifier" sender:sender];
    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0xFFA000)];
}

- (IBAction)pizzaHut:(id)sender {
    webviewUrl = @"http://www.pizzahut.ca/";
    [self performSegueWithIdentifier:@"PizzaWebViewIdentifier" sender:sender];
     [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0xFFEB3B)];
}

- (IBAction)pizzaNova:(id)sender {
    webviewUrl = @"http://www.pizzanova.ca/";
    [self performSegueWithIdentifier:@"PizzaWebViewIdentifier" sender:sender];
     [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0x43A047)];
}

- (IBAction)likeUs:(id)sender {
    webviewUrl = @"http://www.facebook.com/PizzaPizzaCanada/";
    [self performSegueWithIdentifier:@"PizzaWebViewIdentifier" sender:sender];
    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0x03A9F4)];
}

- (IBAction)storelocator:(id)sender {
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([segue.identifier isEqual:@"PizzaWebViewIdentifier"]) {
        PizzaPizzaViewController *pizzaViewController = (PizzaPizzaViewController *) [segue destinationViewController];
        pizzaViewController.url = webviewUrl;
    }
}

// Allows to goes back to the previous page
- (IBAction)unwindToThisViewController:(UIStoryboardSegue *)unwindSegue
{
}

@end
