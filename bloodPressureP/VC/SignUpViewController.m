//
//  SignUpViewController.m
//  bloodPressureP
//
//  Created by Adriana Elizondo on 4/15/16.
//  Copyright © 2016 Adriana Elizondo. All rights reserved.
//

#import "SignUpViewController.h"
#import "UIHelper.h"
#import "UserHelper.h"

@interface SignUpViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTxt;
@property (weak, nonatomic) IBOutlet UITextField *passCodeTxt;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Dismiss keyboard on view tap
    self.signUpButton.enabled = NO;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tapGesture];
    
    [self addObservers];
    
}

-(void)addObservers{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleKeyboardNotification:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dismissKeyboard{
    [self.phoneTxt resignFirstResponder];
    [self.passCodeTxt resignFirstResponder];
}

-(void)handleKeyboardNotification:(NSNotification *)notification{
    if (self.phoneTxt.text.length > 0 && ![self isPhoneValid]) {
        [self showErrorInTextField:self.phoneTxt];
    }else if (self.phoneTxt.text.length > 0 && [self isPhoneValid]){
        [self showSuccessInTextField:self.phoneTxt];
    }
    
    if (self.passCodeTxt.text.length > 0 && ![self isPassCodeValid]) {
        [self showErrorInTextField:self.passCodeTxt];
    }else if (self.passCodeTxt.text.length > 0 && [self isPhoneValid]){
        [self showSuccessInTextField:self.passCodeTxt];
    }
    
}

-(BOOL)isPhoneValid{
    return self.phoneTxt.text.length >= 10;
}

-(BOOL)isPassCodeValid{
    return self.passCodeTxt.text.length == 4;
}

-(void)showErrorInTextField:(UITextField *)textField{
    [UIView animateWithDuration:.5 animations:^{
        textField.layer.borderWidth = 1.0f;
        textField.layer.borderColor = [[UIColor redColor] CGColor];
        self.signUpButton.enabled = NO;
    }];
}

-(void)showSuccessInTextField:(UITextField *)textField{
    [UIView animateWithDuration:.5 animations:^{
        textField.layer.borderWidth = 1.0f;
        textField.layer.borderColor = [[UIColor greenColor] CGColor];
        self.signUpButton.enabled = [self isPhoneValid] && [self isPassCodeValid] ? YES : NO;
    }];
}

- (IBAction)signUp:(id)sender {
    [UserHelper signUpWithPhone:self.phoneTxt.text andPasscode:self.passCodeTxt.text withCompletion:^(NSError *error) {
        if (error) {
            [UIHelper presentAlertControllerWithTitle:@"Error" message:@"Couldn't sign in" onViewController:self];
        }else{
            [[NSUserDefaults standardUserDefaults] setObject:self.phoneTxt.text forKey:@"username"];
            [self performSegueWithIdentifier:@"homeSegue" sender:self];
        }
    }];
}
@end
