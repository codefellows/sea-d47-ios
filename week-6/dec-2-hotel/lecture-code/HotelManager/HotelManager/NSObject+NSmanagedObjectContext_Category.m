//
//  NSObject+NSmanagedObjectContext_Category.m
//  HotelManager
//
//  Created by Michael Babiy on 12/1/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

#import "NSObject+NSmanagedObjectContext_Category.h"
#import "AppDelegate.h"

@implementation NSObject (NSmanagedObjectContext_Category)

+ (NSManagedObjectContext *)managerContext {
    
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    return  delegate.managedObjectContext;
    
}

@end
