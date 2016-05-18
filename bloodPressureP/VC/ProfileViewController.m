//
//  ProfileViewController.m
//  bloodPressureP
//
//  Created by Adriana Elizondo on 4/24/16.
//  Copyright © 2016 Adriana Elizondo. All rights reserved.
//
#import "AlertAction.h"
#import "DraggableImage.h"
#import "ProfileViewController.h"
#import "UIHelper.h"
#import <QuartzCore/QuartzCore.h>

@interface ProfileViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet DraggableImage *profileImageView;
@property (strong) CAShapeLayer *blurFilterMask;
@property (assign) CGPoint blurFilterOrigin;
@property (assign) CGFloat blurFilterDiameter;
@property (weak, nonatomic) IBOutlet UIButton *editPictureButton;
@property UIImage *finalImage;
@property UIImagePickerController *pickerController;
@property NSArray <AlertAction *>* actionSheetActions;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.profileImageView setUserInteractionEnabled:YES];
    [self createUIElements];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createUIElements{
    self.pickerController = [[UIImagePickerController alloc] init];
    self.pickerController.delegate = self;
    
    AlertAction *pictureFromCamera = [[AlertAction alloc] init];
    pictureFromCamera.actionTitle = @"Camera roll";
    pictureFromCamera.completion = ^{
        [self.pickerController setSourceType:UIImagePickerControllerSourceTypeCamera];
        [self presentViewController:self.pickerController animated:YES completion:nil];
    };
    
    AlertAction *pictureFromGallery = [[AlertAction alloc] init];
    pictureFromGallery.actionTitle = @"Gallery";
    pictureFromGallery.completion = ^{
        [self.pickerController setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        [self presentViewController:self.pickerController animated:YES completion:nil];
    };
    
    self.actionSheetActions = @[pictureFromCamera, pictureFromGallery];
    
}

- (IBAction)editProfilePicture:(id)sender {
    [UIHelper presentActionsheetControllerWithTitle:@"Select a picture" message:@"" onViewController:self withActions:self.actionSheetActions];
}


#pragma mark - UIimage picker delegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    self.profileImageView.image = image;
}

@end
