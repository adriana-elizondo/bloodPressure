//
//  DailyLog+CoreDataProperties.h
//  
//
//  Created by Adriana Elizondo on 4/17/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "DailyLog.h"

NS_ASSUME_NONNULL_BEGIN

@interface DailyLog (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *date;
@property (nullable, nonatomic, retain) NSString *weight;
@property (nullable, nonatomic, retain) NSNumber *dailyLogId;
@property (nullable, nonatomic, retain) Feeling *feeling;
@property (nullable, nonatomic, retain) NSSet<BloodPressure *> *pressureOfDay;
@property (nullable, nonatomic, retain) User *user;

@end

@interface DailyLog (CoreDataGeneratedAccessors)

- (void)addPressureOfDayObject:(BloodPressure *)value;
- (void)removePressureOfDayObject:(BloodPressure *)value;
- (void)addPressureOfDay:(NSSet<BloodPressure *> *)values;
- (void)removePressureOfDay:(NSSet<BloodPressure *> *)values;

@end

NS_ASSUME_NONNULL_END
