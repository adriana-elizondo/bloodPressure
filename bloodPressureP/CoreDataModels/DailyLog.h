//
//  DailyLog.h
//  
//
//  Created by Adriana Elizondo on 4/17/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BloodPressure, Feeling, User;

NS_ASSUME_NONNULL_BEGIN

@interface DailyLog : NSManagedObject

// Insert code here to declare functionality of your managed object subclass

@end

NS_ASSUME_NONNULL_END

#import "DailyLog+CoreDataProperties.h"
