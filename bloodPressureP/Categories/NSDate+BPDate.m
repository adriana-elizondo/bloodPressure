//
//  NSDate+BPDate.m
//  bloodPressureP
//
//  Created by Adriana Elizondo on 4/17/16.
//  Copyright © 2016 Adriana Elizondo. All rights reserved.
//

#import "NSDate+BPDate.h"

@implementation NSDate (BPDate)

+(NSString *)todaysDate{
    NSUInteger flags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *components = [[NSCalendar currentCalendar] components:flags
                                                                   fromDate:[NSDate date]];
    NSString *stringDate = [NSString stringWithFormat:@"%ld/%ld/%ld", (long)components.day, (long)components.month, (long)components.year];
    
    return stringDate;
}

@end
