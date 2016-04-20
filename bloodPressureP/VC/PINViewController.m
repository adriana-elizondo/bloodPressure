//
//  PINViewController.m
//  bloodPressureP
//
//  Created by Adriana Elizondo on 4/19/16.
//  Copyright © 2016 Adriana Elizondo. All rights reserved.
//

#import "PINViewController.h"
#import "UIHelper.h"
#import "UserHelper.h"

@interface PINViewController ()
@property NSMutableString *pinCode;
@property int pinCount;
@property (weak, nonatomic) IBOutlet UIView *digit1;
@property (weak, nonatomic) IBOutlet UIView *digit2;
@property (weak, nonatomic) IBOutlet UIView *digit3;
@property (weak, nonatomic) IBOutlet UIView *digit4;
@property (weak, nonatomic) IBOutlet UIStackView *circlesStackView;
@end

@implementation PINViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pinCode = [NSMutableString new];
    self.pinCount = 0;
    [self addObserver:self forKeyPath:@"pinCount" options:NSKeyValueObservingOptionNew context:NULL];
}

-(void)viewWillDisappear:(BOOL)animated{
    [self removeObserver:self forKeyPath:@"pinCount"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addNumberToPin:(UIButton *)sender {
    [self.pinCode appendString:[NSString stringWithFormat:@"%li", (long)sender.tag]];
    self.pinCount++;
}

- (IBAction)forgotPin:(id)sender {
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if (self.pinCode.length == 4) {
        [self.digit4 setBackgroundColor:[UIColor whiteColor]];
        [UserHelper signInWithPin:self.pinCode andCompletion:^(BOOL success) {
            if (success) {
                [self performSegueWithIdentifier:@"homeSegue" sender:self];
            }else{
                [UIHelper shakeView:self.circlesStackView times:3];
                [self resetValues];
            }
        }];
        
    }else{
        switch (self.pinCode.length) {
            case 1:
                [self.digit1 setBackgroundColor:[UIColor whiteColor]];
                break;
            case 2:
                [self.digit2 setBackgroundColor:[UIColor whiteColor]];
                break;
            case 3:
                [self.digit3 setBackgroundColor:[UIColor whiteColor]];
                break;
            default:
                break;
        }
    }
}

-(void)resetValues{
    self.pinCode = [NSMutableString new];
    self.pinCount = 0;
    
    [UIView animateWithDuration:.2 animations:^{
        UIColor *defaultColor = [UIColor colorWithRed:41/255.0f green:41/255.0f blue:41/255.0f alpha:1.0];
        [self.digit1 setBackgroundColor:defaultColor];
        [self.digit2 setBackgroundColor:defaultColor];
        [self.digit3 setBackgroundColor:defaultColor];
        [self.digit4 setBackgroundColor:defaultColor];
    }];
}

@end
