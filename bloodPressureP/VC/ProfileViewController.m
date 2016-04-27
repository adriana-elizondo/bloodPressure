//
//  ProfileViewController.m
//  bloodPressureP
//
//  Created by Adriana Elizondo on 4/24/16.
//  Copyright © 2016 Adriana Elizondo. All rights reserved.
//

#import "ProfileViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (strong) CAShapeLayer *blurFilterMask;
@property (assign) CGPoint blurFilterOrigin;
@property (assign) CGFloat blurFilterDiameter;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self beginBlurMasking];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// begin the blur masking operation.
- (void)beginBlurMasking
{
    self.blurFilterOrigin = self.profileImageView.center;
    self.blurFilterDiameter = MIN(CGRectGetWidth(self.profileImageView.bounds), CGRectGetHeight(self.profileImageView.bounds));
    
    CAShapeLayer *blurFilterMask = [CAShapeLayer layer];
    
    // Disable implicit animations for the blur filter mask's path property.
    blurFilterMask.actions = [[NSDictionary alloc] initWithObjectsAndKeys:[NSNull null], @"path", nil];
    blurFilterMask.fillColor = [UIColor blackColor].CGColor;
    blurFilterMask.fillRule = kCAFillRuleEvenOdd;
    blurFilterMask.frame = self.profileImageView.bounds;
    blurFilterMask.opacity = 0.5f;
    self.blurFilterMask = blurFilterMask;
    [self refreshBlurMask];
    [self.profileImageView.layer addSublayer:blurFilterMask];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.profileImageView addGestureRecognizer:tapGesture];
    
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    [self.profileImageView addGestureRecognizer:pinchGesture];
}

// Move the origin of the blur mask to the location of the tap.
- (void)handleTap:(UITapGestureRecognizer *)sender
{
    self.blurFilterOrigin = [sender locationInView:self.profileImageView];
    [self refreshBlurMask];
}

// Expand and contract the clear region of the blur mask.
- (void)handlePinch:(UIPinchGestureRecognizer *)sender
{
    // Use some combination of sender.scale and sender.velocity to determine the rate at which you want the circle to expand/contract.
    self.blurFilterDiameter += sender.velocity;
    [self refreshBlurMask];
}

// Update the blur mask within the UI.
- (void)refreshBlurMask
{
    CGFloat blurFilterRadius = self.blurFilterDiameter * 0.5f;
    
    CGMutablePathRef blurRegionPath = CGPathCreateMutable();
    CGPathAddRect(blurRegionPath, NULL, self.profileImageView.bounds);
    CGPathAddEllipseInRect(blurRegionPath, NULL, CGRectMake(self.blurFilterOrigin.x - blurFilterRadius, self.blurFilterOrigin.y - blurFilterRadius, self.blurFilterDiameter, self.blurFilterDiameter));
    
    self.blurFilterMask.path = blurRegionPath;
    
    CGPathRelease(blurRegionPath);
}


@end
