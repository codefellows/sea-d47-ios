//
//  ViewController.m
//  Reminders
//
//  Created by Michael Babiy on 11/16/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)locationButtonSelected:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // As of iOS 8, you need to ask for permissions first.
    [self requestPermissions];
    
    [self.mapView.layer setCornerRadius:20.0];
    [self.mapView setShowsUserLocation:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)requestPermissions {
    
    // NSLocationWhenInUseUsageDescription key is required in info.plist. Add valid reason for location use.
    // Make sure to enable location updates in Simulator.
    
    [self setLocationManager:[[CLLocationManager alloc]init]];
    [self.locationManager requestWhenInUseAuthorization];
}

- (void)setRegionForCoordinate:(MKCoordinateRegion)region {
    [self.mapView setRegion:region animated:YES];
}

- (IBAction)locationButtonSelected:(UIButton *)sender {
    
    NSString *buttonTitle = sender.titleLabel.text;
    
    if ([buttonTitle isEqualToString:@"One"]) {
        NSLog(@"One");
        
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(47.6566674, -122.35109699999998); // IKEA store haha.
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 500.0, 500.0);
        
        [self setRegionForCoordinate:region];
    }
    
    if ([buttonTitle isEqualToString:@"Two"]) {
        NSLog(@"Two");
    }
    
    if ([buttonTitle isEqualToString:@"Three"]) {
        NSLog(@"Three");
    }
    
}
@end
