//
//  BloodPressureHelper.m
//  bloodPressureP
//
//  Created by Adriana Elizondo on 4/17/16.
//  Copyright © 2016 Adriana Elizondo. All rights reserved.
//
#import "BloodPressure+CoreDataProperties.h"
#import "BloodPressureHelper.h"
#import "DailyLog.h"
#import "DailyLogHelper.h"
#import "NSDate+BPDate.h"
#import <MagicalRecord/MagicalRecord.h>

@implementation BloodPressureHelper

+(void)todaysBloodPresureWithCompletion:(SaveCompletionBlock)completion{
    DailyLog *dailyLog = [DailyLogHelper todaysLog];
    __block NSSet<BloodPressure *> *bpSet = dailyLog.pressureOfDay;
    if (bpSet.count == 0) {
        BloodPressure *bp = [BloodPressure MR_createEntity];
        [DailyLogHelper addNewPressure:bp ToObject:dailyLog withCompletion:^(NSError *error) {
            [CoreDataHelper saveCoreDataStackWithCompletion:^(NSError *error) {
                completion(bpSet, error);
            }];
        }];
    }else{
        completion(bpSet, nil);
    }
}

+(void)addNewMeasurement:(Measurement *)measurement ToObject:(BloodPressure *)bpObject withCompletion:(CompletionBlock)completion{
    if (bpObject.measurement.count >= 3) {
        completion([NSError errorWithDomain:@"Exceeded measurements" code:403 userInfo:nil]);
    }
    
    [bpObject addMeasurementObject:measurement];
    [CoreDataHelper saveCoreDataStackWithCompletion:^(NSError *error) {
        completion(error);
    }];
}

@end
