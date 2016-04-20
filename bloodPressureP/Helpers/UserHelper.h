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

typedef void (^SignInCompletion)(BOOL success);

+(BOOL)isSignedIn;
+(void)signInWithPin:(NSString *)pin andCompletion:(SignInCompletion)completion;
+(void)signUpWithPhone:(NSString *)phone andPasscode:(NSString *)passcode withCompletion:(void(^)(NSError *error))completionBlock;
+(User *)userWithUsername:(NSString *)username;
+(void)savePhone:(NSString *)phone andPassCode:(NSString *)passCode;
@end
