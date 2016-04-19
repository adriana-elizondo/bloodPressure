//
//  BloodPressure+CoreDataProperties.h
//  
//
//  Created by Adriana Elizondo on 4/17/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "BloodPressure.h"

NS_ASSUME_NONNULL_BEGIN

@interface BloodPressure (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *bloodPressureId;
@property (nullable, nonatomic, retain) NSSet<Measurement *> *measurement;
@property (nullable, nonatomic, retain) DailyLog *log;

@end

@interface BloodPressure (CoreDataGeneratedAccessors)

- (void)addMeasurementObject:(Measurement *)value;
- (void)removeMeasurementObject:(Measurement *)value;
- (void)addMeasurement:(NSSet<Measurement *> *)values;
- (void)removeMeasurement:(NSSet<Measurement *> *)values;

@end

NS_ASSUME_NONNULL_END
