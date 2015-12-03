//
//  Gues.m
//  HotelManager
//
//  Created by Michael Babiy on 11/30/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

#import "Gues.h"
#import "Reservation.h"
#import "AppDelegate.h"

@implementation Gues

+ (instancetype)guestWithName:(NSString *)name {
    
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    
    Gues *guest = [NSEntityDescription insertNewObjectForEntityForName:@"Gues" inManagedObjectContext:delegate.managedObjectContext];
    
    guest.name = name;
    
    return guest;
}

@end
