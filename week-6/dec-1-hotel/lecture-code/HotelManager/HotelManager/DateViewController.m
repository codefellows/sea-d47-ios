//
//  DateViewController.m
//  HotelManager
//
//  Created by Michael Babiy on 12/1/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

#import "DateViewController.h"
#import "AvailabilityViewController.h"

@interface DateViewController ()

@property (strong, nonatomic) UIDatePicker *endPicker;

@end

@implementation DateViewController

- (void)loadView {
    [super loadView];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupDateViewController];
    [self setupDatePickers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setupDateViewController {
    [self.navigationItem setTitle:@"Select End Date"];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonSelected:)]];
}

- (void)setupDatePickers {
    self.endPicker = [[UIDatePicker alloc]init];
    self.endPicker.datePickerMode = UIDatePickerModeDate;
    self.endPicker.frame = CGRectMake(0.0, 84.0, CGRectGetWidth(self.view.frame), 200.0);
    [self.view addSubview:self.endPicker];
}

- (void)doneButtonSelected:(UIBarButtonItem *)sender {
    
    NSDate *endDate = [self.endPicker date];
    
    if ([[NSDate date] timeIntervalSinceReferenceDate] > [endDate timeIntervalSinceReferenceDate]) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Hmm..." message:@"Please make sure end date is in the future." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.endPicker.date = [NSDate date];
        }];
        
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
        
        return;
    }
    
    AvailabilityViewController *availabilityViewController = [[AvailabilityViewController alloc]init];
    
    availabilityViewController.endDate = endDate;
    
    [self.navigationController pushViewController:availabilityViewController animated:YES];
    
}

@end
