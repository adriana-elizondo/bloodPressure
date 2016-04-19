//
//  User+CoreDataProperties.h
//  
//
//  Created by Adriana Elizondo on 4/17/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface User (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *age;
@property (nullable, nonatomic, retain) NSString *doctorEmail;
@property (nullable, nonatomic, retain) NSNumber *drinker;
@property (nullable, nonatomic, retain) NSString *email;
@property (nullable, nonatomic, retain) NSString *gender;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *passCode;
@property (nullable, nonatomic, retain) NSString *phone;
@property (nullable, nonatomic, retain) NSString *picture;
@property (nullable, nonatomic, retain) NSNumber *smoker;
@property (nullable, nonatomic, retain) NSString *userEmail;
@property (nullable, nonatomic, retain) NSNumber *userId;
@property (nullable, nonatomic, retain) NSSet<DailyLog *> *dailyLog;
@property (nullable, nonatomic, retain) Preferences *preferences;

@end

@interface User (CoreDataGeneratedAccessors)

- (void)addDailyLogObject:(DailyLog *)value;
- (void)removeDailyLogObject:(DailyLog *)value;
- (void)addDailyLog:(NSSet<DailyLog *> *)values;
- (void)removeDailyLog:(NSSet<DailyLog *> *)values;

@end

NS_ASSUME_NONNULL_END
