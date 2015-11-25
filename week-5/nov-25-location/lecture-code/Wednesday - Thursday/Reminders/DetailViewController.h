//
//  DetailViewController.h
//  Reminders
//
//  Created by Michael Babiy on 11/16/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

@import UIKit;
@import MapKit;

typedef void(^DetailViewControllerCompletion)(MKCircle *circle);

@interface DetailViewController : UIViewController

@property (copy, nonatomic) DetailViewControllerCompletion completion;
@property (strong, nonatomic) NSString *annotationTitle;
@property (nonatomic) CLLocationCoordinate2D coordinate;

@end
