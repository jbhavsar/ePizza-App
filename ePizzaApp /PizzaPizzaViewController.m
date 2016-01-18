//
//  PizzaPizzaViewController.m
//  ePizzaApp
//
//  Created by JayB on 11/22/15.
//  Copyright (c) 2015 ePizza. All rights reserved.
//

#import "PizzaPizzaViewController.h"
//custom color script for the Navigation Bar //Added in the HomeViewController.m
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface PizzaPizzaViewController ()

@end

@implementation PizzaPizzaViewController;
@synthesize wbPage, activity, url;

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    //show loader
    [activity setHidesWhenStopped:NO];
    [activity startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    //hide loader
    [activity setHidesWhenStopped:YES];
    [activity stopAnimating];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //set webview delegate
    self.wbPage.delegate = self;
    
    //Create a URL object.
    NSURL *urlAddress = [NSURL URLWithString:url];
    
    
/*    
 if ([url isEqualToString:@"http://www.dominos.ca/"]) {
        [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0xEAC6F3)];
    }
 */
    
    //URL Requst Object
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:urlAddress];
    
    
    //Load the request in the UIWebView.
    [wbPage loadRequest:urlRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


@end

