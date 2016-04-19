//
//  BloodPressureHelper.h
//  bloodPressureP
//
//  Created by Adriana Elizondo on 4/17/16.
//  Copyright © 2016 Adriana Elizondo. All rights reserved.
//
#import "BloodPressure.h"
#import "CoreDataHelper.h"
#import <Foundation/Foundation.h>

@interface BloodPressureHelper : NSObject

+(void)todaysBloodPresureWithCompletion:(SaveCompletionBlock)completion;
+(void)addNewMeasurement:(Measurement *)measurement ToObject:(BloodPressure *)bpObject withCompletion:(CompletionBlock)completion;

@end
