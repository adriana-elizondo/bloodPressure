//
//  MeasurementHelper.h
//  bloodPressureP
//
//  Created by Adriana Elizondo on 4/16/16.
//  Copyright © 2016 Adriana Elizondo. All rights reserved.
//
#import "Measurement.h"
#import <Foundation/Foundation.h>

@interface MeasurementHelper : NSObject

+(Measurement *)newMeasurementWithSistolic:(NSNumber *)sistolic andDiastolic:(NSNumber *)diastolic;

@end
