//
//  DominosPizzaViewController.m
//  ePizzaApp
//
//  Created by JayB on 11/22/15.
//  Copyright (c) 2015 ePizza. All rights reserved.
//

#import "DominosPizzaViewController.h"

@interface DominosPizzaViewController ()

@end

@implementation DominosPizzaViewController;
@synthesize wbPage, activity;

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [activity setHidesWhenStopped:NO];
    [activity startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [activity setHidesWhenStopped:YES];
    [activity stopAnimating];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURL *urlAddress = [NSURL URLWithString:@"http://www.dominos.ca/"];
    NSURLRequest *url = [NSURLRequest requestWithURL:urlAddress];
    [wbPage loadRequest:url];
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


// Allows to goes back to the previous page


@end

