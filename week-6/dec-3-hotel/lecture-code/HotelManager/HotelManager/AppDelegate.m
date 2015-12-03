//
//  AppDelegate.m
//  HotelManager
//
//  Created by Michael Babiy on 11/30/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

#import "Hotel.h"
#import "Room.h"
#import "Reservation.h"
#import "Gues.h"

@interface AppDelegate ()

@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) ViewController *viewController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setupRootViewController];
    [self bootstrapApp];
    // [self addImages];
    [self setupNotifications];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self saveContext];
}

- (void)setupRootViewController {
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.viewController = [[ViewController alloc]init];
    self.navigationController = [[UINavigationController alloc]initWithRootViewController:self.viewController];
    
    self.viewController.view.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = self.navigationController;
    
    [self.window makeKeyAndVisible];
}

- (void)bootstrapApp {
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
    
    NSError *error;
    NSInteger count = [self.managedObjectContext countForFetchRequest:request error:&error];
    
    if (count == 0) {
        
        NSDictionary *hotels = [NSDictionary new];
        NSDictionary *rooms = [NSDictionary new];
        
        NSString *jsonPath = [[NSBundle mainBundle]pathForResource:@"hotels" ofType:@"json"];
        NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
        
        NSError *jsonError;
        NSDictionary *rootObject = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&jsonError];
        
        if (jsonError) { NSLog(@"Error serializing JSON."); return; }
        
        hotels = rootObject[@"Hotels"];
        
        for (NSDictionary *hotel in hotels) {
            
            Hotel *newHotel = [NSEntityDescription insertNewObjectForEntityForName:@"Hotel" inManagedObjectContext:self.managedObjectContext];
            newHotel.name = hotel[@"name"];
            newHotel.location = hotel[@"location"];
            newHotel.stars = hotel[@"stars"];
            
            rooms = hotel[@"rooms"];
            
            for (NSDictionary *room in rooms) {
                
                Room *newRoom = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:self.managedObjectContext];
                
                newRoom.number = room[@"number"];
                newRoom.beds = room[@"beds"];
                newRoom.rate = room[@"rate"];
                newRoom.hotel = newHotel;
                
            }
            
        }
        
        NSError *saveError;
        BOOL isSaved = [self.managedObjectContext save:&saveError];
        
        if (isSaved) {
            NSLog(@"Saved successfully.");
        } else {
            NSLog(@"%@", saveError.localizedDescription);
        }
        
    }
    
}

- (void)addImages {
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
    NSArray *hotels = [self.managedObjectContext executeFetchRequest:request error:nil];
    UIImage *image = [UIImage imageNamed:@"hotel"];
    
    for (Hotel *hotel in hotels) {
        hotel.image = UIImageJPEGRepresentation(image, 0.8);
    }
    
    // ... Save ...
    [self.managedObjectContext save:nil];
    
}

- (void)setupNotifications {
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(persistentStoreDidImportUbiquitousContentChanges:) name:NSPersistentStoreDidImportUbiquitousContentChangesNotification object:nil];
}

- (void)persistentStoreDidImportUbiquitousContentChanges:(NSNotification *)notification {
    NSLog(@"Merging ubiquitous content changes");
    [self.managedObjectContext performBlock:^{
        [self.managedObjectContext mergeChangesFromContextDidSaveNotification:notification];
    }];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"HotelManager" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"HotelManager.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    
    NSDictionary *options = @{NSMigratePersistentStoresAutomaticallyOption : @YES,
                              NSInferMappingModelAutomaticallyOption : @YES,
                              NSPersistentStoreUbiquitousContainerIdentifierKey : @"HotelManager"};
    
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
