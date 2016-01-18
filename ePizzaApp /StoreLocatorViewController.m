//
//  StoreLocatorViewController.m
//  ePizzaApp
//
//  Created by JayB on 11/22/15.
//  Copyright (c) 2015 ePizza. All rights reserved.
//

#import "StoreLocatorViewController.h"

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

@interface StoreLocatorViewController ()

@end

@implementation StoreLocatorViewController
@synthesize map;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.map.delegate = self;
    self.map.zoomEnabled = YES;
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    if(IS_OS_8_OR_LATER) {
        [self.locationManager requestAlwaysAuthorization];
    }
    
    [self.locationManager startUpdatingLocation];
    
    NSLog(@"%@", self.map.userLocation.title);
    
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorizedAlways || status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        self.map.showsUserLocation = YES;
    }
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    
    MKCoordinateRegion mapRegion;
     
    mapRegion.center = mapView.userLocation.coordinate;
    //mapRegion.center.latitude = 43.655709;
    //mapRegion.center.longitude = -79.740250;
    mapRegion.span.latitudeDelta = 0.2;
    mapRegion.span.longitudeDelta = 0.2;
    
    
    [mapView setRegion:mapRegion animated: YES];
    
   // MKMapCamera *camera = [MKMapCamera cameraLookingAtCenterCoordinate:userLocation.coordinate fromEyeCoordinate:CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude) eyeAltitude:1000];
    //[mapView setCamera: camera animated:YES];
    
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


@end
