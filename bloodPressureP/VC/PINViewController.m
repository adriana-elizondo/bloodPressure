//
//  PINViewController.m
//  bloodPressureP
//
//  Created by Adriana Elizondo on 4/19/16.
//  Copyright © 2016 Adriana Elizondo. All rights reserved.
//

#import "PINViewController.h"
#import "UserHelper.h"

@interface PINViewController (){
    
}
@property NSMutableString *pinCode;
@end

@implementation PINViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pinCode = [NSMutableString new];
    
    [self addObserver:self forKeyPath:@"pinCode" options:NSKeyValueObservingOptionOld context:nil];
}

-(void)viewWillDisappear:(BOOL)animated{
    [self removeObserver:self forKeyPath:@"pinCode"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addNumberToPin:(UIButton *)sender {
    [self.pinCode appendString:[NSString stringWithFormat:@"%li", (long)sender.tag]];
}

- (IBAction)forgotPin:(id)sender {
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    NSLog(@"new object %@", object);
}

@end
