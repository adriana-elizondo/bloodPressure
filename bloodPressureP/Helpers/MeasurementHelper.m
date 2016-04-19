//
//  MeasurementHelper.m
//  bloodPressureP
//
//  Created by Adriana Elizondo on 4/16/16.
//  Copyright © 2016 Adriana Elizondo. All rights reserved.
//
#import "CoreDataHelper.h"
#import "MeasurementHelper.h"

@implementation MeasurementHelper

+(Measurement *)newMeasurementWithSistolic:(NSNumber *)sistolic andDiastolic:(NSNumber *)diastolic{
    NSDictionary *newMeasurement = @{@"diastolic": diastolic,
                                     @"sistolic" : sistolic};
    return (Measurement *)[CoreDataHelper createNewEntityWithName:@"Measurement" andDictionary:newMeasurement];
}

@end
