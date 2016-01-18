//
//  PizzaPizzaViewController.h
//  ePizzaApp
//
//  Created by JayB on 11/22/15.
//  Copyright (c) 2015 ePizza. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface PizzaPizzaViewController : UIViewController <UIWebViewDelegate>
{
    IBOutlet UIWebView *wbPage;
    IBOutlet UIActivityIndicatorView *activity;
    
    NSString *url;
    
}

@property (nonatomic, retain) NSString *url;
@property (nonatomic, strong) IBOutlet UIWebView *wbPage;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *activity;


@end