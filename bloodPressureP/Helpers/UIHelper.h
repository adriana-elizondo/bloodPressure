//
//  UIHelper.h
//  bloodPressureP
//
//  Created by Adriana Elizondo on 4/17/16.
//  Copyright © 2016 Adriana Elizondo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIHelper : NSObject

+(void)presentAlertControllerWithTitle:(NSString *)title message:(NSString *)message onViewController:(UIViewController *)viewController;
+(void)setBorderToLabel:(UILabel*)label;
@end
