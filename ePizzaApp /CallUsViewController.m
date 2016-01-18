//
//  CallUsViewController.m
//  ePizzaApp
//
//  Created by JayB on 12/14/15.
//  Copyright © 2015 ePizza. All rights reserved.
//

#import "CallUsViewController.h"

@interface CallUsViewController ()

@end

@implementation CallUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.sidebarButton setTarget: self];
    [self.sidebarButton setAction: @selector(cancelGoBack:)];
}

- (void)cancelGoBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
@IBAction func pizzacall(sender: AnyObject)
{
    var url:NSURL = NSURL(string: "tel://1234567890")!
    UIApplication.sharedApplication().openURL(url)
}
 */


@end
