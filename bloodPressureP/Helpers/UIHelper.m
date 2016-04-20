//
//  UIHelper.m
//  bloodPressureP
//
//  Created by Adriana Elizondo on 4/17/16.
//  Copyright © 2016 Adriana Elizondo. All rights reserved.
//

#import "UIHelper.h"

@implementation UIHelper

+(void)presentAlertControllerWithTitle:(NSString *)title message:(NSString *)message onViewController:(UIViewController *)viewController{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }]];
    
    [viewController presentViewController:alertController animated:YES completion:nil];
}

+(void)setBorderToLabel:(UILabel*)label{
    CALayer *border = [CALayer layer];
    CGFloat borderWidth = 1;
    border.borderColor = [UIColor whiteColor].CGColor;
    border.frame = CGRectMake(0, label.frame.size.height - borderWidth, label.frame.size.width, label.frame.size.height);
    border.borderWidth = borderWidth;
    [label.layer addSublayer:border];
    label.layer.masksToBounds = YES;
}

+(void)shakeView:(UIView *)view times:(NSInteger)times{
    [UIView animateWithDuration:.05
                     animations:^
     {
         CGAffineTransform transform = CGAffineTransformMakeTranslation(7.0, 0);
         
         view.transform = transform;
     }
                     completion:^(BOOL finished)
     {
         [UIView animateWithDuration:.05
                          animations:^
          {
              // returning to identity
              view.transform = CGAffineTransformIdentity;
          } completion:^(BOOL finished) {
              if (times > 1)
              {
                  // tilting the other direction
                  [self shakeView:view times:times-1];
              }
          }];
     }];}

@end
