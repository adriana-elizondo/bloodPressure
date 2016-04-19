//
//  CoreDataHelper.h
//  bloodPressureP
//
//  Created by Adriana Elizondo on 4/15/16.
//  Copyright © 2016 Adriana Elizondo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MagicalRecord/MagicalRecord.h>

@interface CoreDataHelper : NSObject

typedef void (^CompletionBlock)(NSError *error);
typedef void (^SaveCompletionBlock)(id object, NSError * error);

+(void)saveCoreDataStackWithCompletion:(CompletionBlock)completion;
+(NSArray *)allFromEntityWithName:(NSString *)name;
+(NSManagedObject *)entityWithName:(NSString *)name attribute:(NSString *)attribute value:(id)value;
+(NSManagedObject *)createNewEntityWithName:(NSString *)name andDictionary:(NSDictionary *)dictionary;

@end
