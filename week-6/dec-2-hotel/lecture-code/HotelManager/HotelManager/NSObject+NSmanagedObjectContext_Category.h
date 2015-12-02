//
//  NSObject+NSmanagedObjectContext_Category.h
//  HotelManager
//
//  Created by Michael Babiy on 12/1/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreData;

@interface NSObject (NSmanagedObjectContext_Category)

+ (NSManagedObjectContext *)managerContext;

@end
