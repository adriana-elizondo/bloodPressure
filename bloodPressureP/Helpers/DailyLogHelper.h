//
//  DailyLogHelper.h
//  bloodPressureP
//
//  Created by Adriana Elizondo on 4/16/16.
//  Copyright © 2016 Adriana Elizondo. All rights reserved.
//
#import "DailyLog.h"
#import <Foundation/Foundation.h>

@interface DailyLogHelper : NSObject

+(DailyLog *)dailyLogWithDate:(NSDate *)date;
+(DailyLog *)todaysLog;
+(void)addNewPressure:(BloodPressure *)pressure ToObject:(DailyLog *)dlObject withCompletion:(CompletionBlock)completion;

@end
