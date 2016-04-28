//
//  TestViewController.m
//  bloodPressureP
//
//  Created by Adriana Elizondo on 4/25/16.
//  Copyright © 2016 Adriana Elizondo. All rights reserved.
//
#import "DraggableImage.h"
#import "TestViewController.h"
#import "UIHelper.h"

@interface TestViewController ()
@property UIImageView *ivSource1, *ivDestination2, *tempIV;
@property (weak, nonatomic) IBOutlet DraggableImage *userImage;
@property (weak, nonatomic) IBOutlet UIView *userImageView;
@property (weak, nonatomic) IBOutlet UIImageView *resultView;
@property (weak, nonatomic) IBOutlet UIImageView *layerview;

@end

@implementation TestViewController
@synthesize ivSource1,ivDestination2,tempIV;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"done"];
    
    self.userImage.image = image;
      [self.userImage setUserInteractionEnabled:YES];
    
       // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)ended:(id)sender {
    self.resultView.image = [UIHelper takeScreenshotOfView:self.userImageView];

     [self.view bringSubviewToFront:self.layerview];
    self.layerview.image= [UIHelper circularOverlayForView:self.layerview];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}
@end
