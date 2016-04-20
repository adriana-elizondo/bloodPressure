//
//  UserHelper.h
//  bloodPressureP
//
//  Created by Adriana Elizondo on 4/15/16.
//  Copyright © 2016 Adriana Elizondo. All rights reserved.
//
#import "User.h"
#import <Foundation/Foundation.h>

@interface UserHelper : NSObject

+(BOOL)isSignedIn;
+(BOOL)signInWithPin:(NSString *)pin;
+(void)signUpWithPhone:(NSString *)phone andPasscode:(NSString *)passcode withCompletion:(void(^)(NSError *error))completionBlock;
+(User *)userWithUsername:(NSString *)username;

@end
