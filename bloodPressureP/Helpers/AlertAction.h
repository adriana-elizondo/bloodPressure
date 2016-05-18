//
//  AlertAction.h
//  bloodPressureP
//
//  Created by Adriana Elizondo on 4/29/16.
//  Copyright © 2016 Adriana Elizondo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^AlertActionCompletion)();

@interface AlertAction : NSObject

@property (nonatomic, strong) NSString *actionTitle;
@property (nonatomic, copy) AlertActionCompletion completion;

@end
