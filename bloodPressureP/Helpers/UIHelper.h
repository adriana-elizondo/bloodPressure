//
//  UIHelper.h
//  bloodPressureP
//
//  Created by Adriana Elizondo on 4/17/16.
//  Copyright © 2016 Adriana Elizondo. All rights reserved.
//
#import "AlertAction.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIHelper : NSObject

+(void)presentAlertControllerWithTitle:(NSString *)title message:(NSString *)message onViewController:(UIViewController *)viewController;
+(void)presentActionsheetControllerWithTitle:(NSString *)title message:(NSString *)message onViewController:(UIViewController *)viewController withActions:(NSArray<AlertAction *>*)actions;
+(void)setBorderToLabel:(UILabel*)label;
+(void)shakeView:(UIView *)view times:(NSInteger)times;
+(UIImage *)takeScreenshotOfView:(UIView *)view;
+(UIImage *)circularOverlayForView:(UIView *)view;
+(UIImage *)applyBlurWithRadius:(CGFloat)blurRadius toImage:(UIImage *)image tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;
+(UIImage *)blurredImage:(UIImage *)image;
@end
