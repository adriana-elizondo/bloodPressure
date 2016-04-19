//
//  Preferences+CoreDataProperties.h
//  
//
//  Created by Adriana Elizondo on 4/17/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Preferences.h"

NS_ASSUME_NONNULL_BEGIN

@interface Preferences (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *language;
@property (nullable, nonatomic, retain) NSNumber *wantsNotifications;
@property (nullable, nonatomic, retain) NSNumber *preferencesId;
@property (nullable, nonatomic, retain) User *user;

@end

NS_ASSUME_NONNULL_END
