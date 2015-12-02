//
//  Gues.h
//  HotelManager
//
//  Created by Michael Babiy on 11/30/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Reservation;

NS_ASSUME_NONNULL_BEGIN

@interface Gues : NSManagedObject

+ (instancetype)guestWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END

#import "Gues+CoreDataProperties.h"
