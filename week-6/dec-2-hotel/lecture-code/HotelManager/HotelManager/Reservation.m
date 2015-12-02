//
//  Reservation.m
//  HotelManager
//
//  Created by Michael Babiy on 11/30/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

#import "Reservation.h"
#import "Room.h"
#import "NSObject+NSmanagedObjectContext_Category.h"

@implementation Reservation

+ (NSString *)name {
    return @"Reservation";
}

+ (instancetype)reservationWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate room:(Room *)room {
    
    Reservation *reservation = [NSEntityDescription insertNewObjectForEntityForName:[self name] inManagedObjectContext:[NSManagedObjectContext managerContext]];
    
    reservation.startDate = startDate;
    reservation.endDate = endDate;
    reservation.room = room;
    
    return reservation;
    
}

@end
