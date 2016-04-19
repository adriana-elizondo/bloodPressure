//
//  DailyLogHelper.m
//  bloodPressureP
//
//  Created by Adriana Elizondo on 4/16/16.
//  Copyright © 2016 Adriana Elizondo. All rights reserved.
//
#import "CoreDataHelper.h"
#import "dailyLog.h"
#import "DailyLogHelper.h"
#import "NSDate+BPDate.h"

@implementation DailyLogHelper

+(DailyLog *)dailyLogWithDate:(NSDate *)date{
    DailyLog *log = (DailyLog *)[CoreDataHelper entityWithName:@"DailyLog" attribute:@"date" value:date];
    return log;
}

+(DailyLog *)todaysLog{
    DailyLog *log = (DailyLog *)[CoreDataHelper entityWithName:@"DailyLog" attribute:@"date" value:[NSDate todaysDate]];
    if (log) {
        return log;
    }else{
        log = [DailyLog MR_createEntity];
        log.date = [NSDate todaysDate];
        return log;
    }
}

+(void)addNewPressure:(BloodPressure *)pressure ToObject:(DailyLog *)dlObject withCompletion:(CompletionBlock)completion{
    [dlObject addPressureOfDayObject:pressure];
    [CoreDataHelper saveCoreDataStackWithCompletion:^(NSError *error) {
        completion(error);
    }];
}

@end
