//
//  Feeling+CoreDataProperties.h
//  
//
//  Created by Adriana Elizondo on 4/17/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Feeling.h"

NS_ASSUME_NONNULL_BEGIN

@interface Feeling (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *feelingDescription;
@property (nullable, nonatomic, retain) NSNumber *score;
@property (nullable, nonatomic, retain) NSNumber *feelingId;
@property (nullable, nonatomic, retain) DailyLog *dailyFeeling;

@end

NS_ASSUME_NONNULL_END
