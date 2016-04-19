//
//  BloodPressureViewController.m
//  bloodPressureP
//
//  Created by Adriana Elizondo on 4/16/16.
//  Copyright © 2016 Adriana Elizondo. All rights reserved.
//
#import "BloodPressureHelper.h"
#import "BloodPressureViewController.h"
#import "DailyLog.h"
#import "DailyLogHelper.h"
#import "Measurement.h"
#import "MeasurementHelper.h"
#import "UIHelper.h"

@interface BloodPressureViewController ()
@property (weak, nonatomic) IBOutlet UITextField *sistolicTxt;
@property (weak, nonatomic) IBOutlet UILabel *sistolicLabel;
@property (weak, nonatomic) IBOutlet UITextField *diastolicTxt;
@property (weak, nonatomic) IBOutlet UILabel *diastolicLabel;
@property (weak, nonatomic) IBOutlet UIButton *continueButton;
@property (weak, nonatomic) IBOutlet UIButton *endButton;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property DailyLog *todaysLog;
@property BloodPressure *bloodPressure;
@property NSMutableSet<Measurement *>* measurements;

@end

@implementation BloodPressureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.todaysLog = [DailyLogHelper todaysLog];
    [BloodPressureHelper todaysBloodPresureWithCompletion:^(NSSet<BloodPressure *> *object, NSError *error) {
        self.bloodPressure = [[object allObjects] lastObject];
    }];
}

-(void)viewDidLayoutSubviews{
    [UIHelper setBorderToLabel:self.sistolicLabel];
    [UIHelper setBorderToLabel:self.diastolicLabel];
    [self.progressView setProgress:0.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)next:(id)sender {
    Measurement *newMeasurement = [MeasurementHelper newMeasurementWithSistolic:@([self.sistolicTxt.text integerValue]) andDiastolic:@([self.diastolicTxt.text integerValue])];
    
    [BloodPressureHelper addNewMeasurement:newMeasurement ToObject:self.bloodPressure withCompletion:^(NSError *error) {
        if (error) {
            if (error.code == 403) {
                [UIHelper presentAlertControllerWithTitle:@"Error" message:@"You already added 3 measurements!" onViewController:self];
                return;
            }
            [UIHelper presentAlertControllerWithTitle:@"Error" message:@"Couldn't add measurement" onViewController:self];
        }else{
            [self.progressView setProgress:self.bloodPressure.measurement.count/3.0f];
        }
    }];
}


- (IBAction)finish:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
