//
//  ViewController.m
//  Chart
//
//  Created by Hipolito Arias on 1/6/15.
//  Copyright (c) 2015 Hipolito Arias. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSArray *data;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    ////// CHART
    _chart.demo                     = NO;
    _chart.vertical                 = YES;
    _chart.reverse                  = YES;
    _chart.showProgress             = YES;
    _chart.sizeLabelProgress        = 30;
    _chart.showRealValue            = YES;
//    _chart.maxValue                 = 1000;
    _chart.progressTextColor        = [UIColor whiteColor];
    _chart.backgroundColor          = [UIColor blackColor];
    _chart.progressTextFont         = [UIFont fontWithName:@"HelveticaNeue" size:10];
    
    data = @[
             @{kHACPercentage:@1000, kHACColor : [UIColor colorWithRed:0.000f green:0.620f blue:0.890f alpha:1.00f]},
             @{kHACPercentage:@900, kHACColor  : [UIColor colorWithRed:0.431f green:0.000f blue:0.533f alpha:1.00f]},
             @{kHACPercentage:@800, kHACColor  : [UIColor colorWithRed:0.922f green:0.000f blue:0.000f alpha:1.00f]},
             @{kHACPercentage:@700, kHACColor  : [UIColor colorWithRed:0.000f green:0.671f blue:0.180f alpha:1.00f]},
             @{kHACPercentage:@600, kHACColor  : [UIColor colorWithRed:1.000f green:0.000f blue:0.851f alpha:1.00f]},
             @{kHACPercentage:@500, kHACColor  : [UIColor colorWithRed:1.000f green:0.808f blue:0.000f alpha:1.00f]},
             @{kHACPercentage:@400, kHACColor  : [UIColor colorWithRed:0.294f green:0.843f blue:0.251f alpha:1.00f]},
             @{kHACPercentage:@300, kHACColor  : [UIColor colorWithRed:1.000f green:0.404f blue:0.000f alpha:1.00f]},
             @{kHACPercentage:@200, kHACColor  : [UIColor colorWithRed:0.282f green:0.631f blue:0.620f alpha:1.00f]},
             @{kHACPercentage:@100, kHACColor  : [UIColor colorWithRed:0.776f green:0.000f blue:0.702f alpha:1.00f]},// 10
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},// 20
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},// 30
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000}, // 40
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},// 50
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //             @{kHACPercentage:@1000},
             //                     @{kHACPercentage:@1000},
             //                     @{kHACPercentage:@1000},
             //                     @{kHACPercentage:@1000},
             //                     @{kHACPercentage:@1000},
             //                     @{kHACPercentage:@1000},
             //                     @{kHACPercentage:@1000}, // 60
             //                     @{kHACPercentage:@1000},
             //                     @{kHACPercentage:@1000},
             //                     @{kHACPercentage:@1000},
             //                     @{kHACPercentage:@1000},
             //                     @{kHACPercentage:@1000},
             //                     @{kHACPercentage:@1000},
             //                     @{kHACPercentage:@1000},
             //                     @{kHACPercentage:@1000},
             //                     @{kHACPercentage:@1000},
             //                     @{kHACPercentage:@1000},// 70
             //                     @{kHACPercentage:@1000},
             //                     @{kHACPercentage:@1000},
             //                     @{kHACPercentage:@1000},
             //                     @{kHACPercentage:@1000},
             //                     @{kHACPercentage:@1000},
             //                     @{kHACPercentage:@1000},
             //                     @{kHACPercentage:@1000},
             //                     @{kHACPercentage:@1000},
             //                     @{kHACPercentage:@1000},
             //                     @{kHACPercentage:@1000} // 80
             ];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    ////// CHART SET DATA
    _chart.datos = data;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapClear:(id)sender {
    [_chart clearChart];
}

- (IBAction)tapSetData:(id)sender {
    
    [self tapClear:nil];
    
    ////// CHART SET DATA
    _chart.datos = data;
}

- (IBAction)tapRealValue:(id)sender {
    UISwitch *mySwitch = (UISwitch *)sender;
    if ([mySwitch isOn]) {
        _chart.showRealValue = YES;
    } else {
        _chart.showRealValue = NO;
    }
    [self tapSetData:nil];
}

- (IBAction)tapShowProgress:(id)sender {
    UISwitch *mySwitch = (UISwitch *)sender;
    if ([mySwitch isOn]) {
        _chart.showProgress = YES;
    } else {
        _chart.showProgress = NO;
    }
    [self tapSetData:nil];
}

- (IBAction)tapReverse:(id)sender {
    UISwitch *mySwitch = (UISwitch *)sender;
    if ([mySwitch isOn]) {
        _chart.reverse = YES;
    } else {
        _chart.reverse = NO;
    }
    [self tapSetData:nil];
}

- (IBAction)tapVertical:(id)sender {
    UISwitch *mySwitch = (UISwitch *)sender;
    if ([mySwitch isOn]) {
        _chart.vertical = YES;
    } else {
        _chart.vertical = NO;
    }
    [self tapSetData:nil];
}

@end
