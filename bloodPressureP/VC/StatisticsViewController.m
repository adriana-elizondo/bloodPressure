//
//  StatisticsViewController.m
//  bloodPressureP
//
//  Created by Adriana Elizondo on 4/20/16.
//  Copyright © 2016 Adriana Elizondo. All rights reserved.
//

#import "StatisticsViewController.h"
#import <GraphKit/GraphKit.h>

@interface StatisticsViewController ()<GKLineGraphDataSource>
@property (weak, nonatomic) IBOutlet GKLineGraph *graphView;
@property (weak, nonatomic) IBOutlet UITableView *dataTableView;
@property (weak, nonatomic) IBOutlet UIButton *loadNextButton;
@property NSArray *tensionData;
@property NSArray *weightData;
@property NSArray *dateLabels;

@end

@implementation StatisticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpGraph];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUpGraph{
    self.tensionData = @[
                         @[@140, @134, @137, @123, @133, @145, @121],
                         @[@98, @96, @98, @85, @83, @91, @87]
                         ];
    
    self.dateLabels = @[@"2001", @"2002", @"2003", @"2004", @"2005", @"2006", @"2007"];
    
    self.graphView.dataSource = self;
    self.graphView.lineWidth = 3.0;
    self.graphView.startFromZero = NO;
   // self.graphView.valueLabelCount = self.dateLabels.count;
    [self.graphView draw];
}

#pragma mark - Graph Datasource
-(NSInteger)numberOfLines{
    return 2.0;
}

-(UIColor *)colorForLineAtIndex:(NSInteger)index{
    id colors = @[[UIColor gk_turquoiseColor],
                  [UIColor gk_peterRiverColor],
                  [UIColor gk_alizarinColor],
                  [UIColor gk_sunflowerColor]
                  ];
    return [colors objectAtIndex:index];
}

- (NSArray *)valuesForLineAtIndex:(NSInteger)index {
    return [self.tensionData objectAtIndex:index];
}

- (CFTimeInterval)animationDurationForLineAtIndex:(NSInteger)index {
    return [[@[@1, @1.6, @2.2, @1.4] objectAtIndex:index] doubleValue];
}

- (NSString *)titleForLineAtIndex:(NSInteger)index {
    return [self.dateLabels objectAtIndex:index];
}

@end
