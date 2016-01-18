//
//  StoreLocatorViewController.h
//  ePizzaApp
//
//  Created by JayB on 11/22/15.
//  Copyright (c) 2015 ePizza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface StoreLocatorViewController : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *map;
@property(nonatomic, retain) CLLocationManager *locationManager;

@end
