//
//  BookViewController.h
//  HotelManager
//
//  Created by Michael Babiy on 12/1/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Room.h"
#import "Hotel.h"
#import "Reservation.h"
#import "Gues.h"

@interface BookViewController : UIViewController

@property (strong, nonatomic) Room *room;
@property (strong, nonatomic) NSDate *endDate;

@end
