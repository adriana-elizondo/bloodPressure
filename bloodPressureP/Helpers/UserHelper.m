//
//  UserHelper.m
//  bloodPressureP
//
//  Created by Adriana Elizondo on 4/15/16.
//  Copyright © 2016 Adriana Elizondo. All rights reserved.
//

#import "CoreDataHelper.h"
#import "UserHelper.h"
#import "User+CoreDataProperties.h"

@implementation UserHelper

+(BOOL)signInWithPin:(NSString *)pin{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:@"userPin"] isEqualToString:pin];
}

+(BOOL)isSignedIn{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
}

+(void)signUpWithPhone:(NSString *)phone andPasscode:(NSString *)passcode withCompletion:(void(^)(NSError *error))completionBlock{
    
    User *newUser = [User MR_createEntity];
    newUser.phone = phone;
    newUser.passCode = passcode;
    [CoreDataHelper saveCoreDataStackWithCompletion:^(NSError *error) {
        completionBlock(error);
    }];
}

+(User *)userWithUsername:(NSString *)username{
    return (User *)[CoreDataHelper entityWithName:@"User" attribute:@"phone" value:username];
}

@end
