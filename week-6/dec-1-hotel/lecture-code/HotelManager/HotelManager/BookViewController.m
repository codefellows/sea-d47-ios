//
//  BookViewController.m
//  HotelManager
//
//  Created by Michael Babiy on 12/1/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

#import "BookViewController.h"
#import "NSObject+NSmanagedObjectContext_Category.h"

@interface BookViewController ()

@property (strong, nonatomic) UITextField *nameField;

@end

@implementation BookViewController

- (void)loadView {
    [super loadView];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBookViewController];
    [self setupMessageLabel];
    [self setupNameField];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setupBookViewController {
    [self.navigationItem setTitle:self.room.hotel.name];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveButtonSelected:)]];
}

- (void)setupMessageLabel {
    UILabel *messageLabel = [[UILabel alloc]init];
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.numberOfLines = 0;
    messageLabel.translatesAutoresizingMaskIntoConstraints = NO;
    messageLabel.text = [NSString stringWithFormat:@"Reservation at %@, Room: %i, From: Today - To: %@", self.room.hotel.name, self.room.number.intValue, [NSDateFormatter localizedStringFromDate:self.endDate dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle]];
    
    [self.view addSubview:messageLabel];
    
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:messageLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:20.0];
    
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:messageLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-20.0];
    
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:messageLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    
    leading.active = YES;
    trailing.active = YES;
    centerY.active = YES;
}

- (void)setupNameField {
    self.nameField = [[UITextField alloc]init];
    self.nameField.placeholder = @"Please enter your name...";
    self.nameField.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.nameField];
    
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:self.nameField attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:20.0];
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.nameField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:84.0];
    
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:self.nameField attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-20.0];
    
    leading.active = YES;
    top.active = YES;
    trailing.active = YES;
    
    [self.nameField becomeFirstResponder];
}

- (void)saveButtonSelected:(UIBarButtonItem *)sender {
    
    Reservation *reservation = [Reservation reservationWithStartDate:[NSDate date] endDate:self.endDate room:self.room];
    self.room.reservation = reservation;
    
    reservation.guest = [Gues guestWithName:self.nameField.text];
    
    NSError *saveError;
    [[NSManagedObjectContext managerContext] save:&saveError];
    
    if (saveError) {
        NSLog(@"Save error is %@", saveError);
    } else {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

@end
