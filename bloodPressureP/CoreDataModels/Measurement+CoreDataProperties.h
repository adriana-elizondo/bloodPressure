//
//  Measurement+CoreDataProperties.h
//  
//
//  Created by Adriana Elizondo on 4/17/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Measurement.h"

NS_ASSUME_NONNULL_BEGIN

@interface Measurement (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *diastolic;
@property (nullable, nonatomic, retain) NSNumber *sistolic;
@property (nullable, nonatomic, retain) NSNumber *measurementID;
@property (nullable, nonatomic, retain) BloodPressure *bloodPressure;

@end

NS_ASSUME_NONNULL_END
