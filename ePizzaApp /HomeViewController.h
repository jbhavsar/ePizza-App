//
//  HomeViewController.h
//  ePizzaApp
//
//  Created by JayB on 11/22/15.
//  Copyright (c) 2015 ePizza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController

- (IBAction)dominoPizza:(id)sender;
- (IBAction)pizzaPizza:(id)sender;
- (IBAction)pizzaHut:(id)sender;
- (IBAction)pizzaNova:(id)sender;
- (IBAction)likeUs:(id)sender;
- (IBAction)storelocator:(id)sender;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@end
