//
//  ViewController.m
//  Chart
//
//  Created by Hipolito Arias on 1/6/15.
//  Copyright (c) 2015 Hipolito Arias. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    ////// CHART
    _chart.demo                     = NO;
    _chart.vertical                 = YES;
    _chart.reverse                  = YES;
    _chart.showProgress             = YES; // if showProgress == YES, and datos > 30 BUG, no caben en la grafica
    _chart.sizeLabelProgress        = 30;
    _chart1.showRealValue           = YES;
    _chart.maxValue                 = 1000;
    _chart.progressTextColor        = [UIColor blackColor];
    _chart.backgroundColor          = [UIColor whiteColor];
    _chart.progressTextFont         = [UIFont fontWithName:@"HelveticaNeue" size:10];
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    ////// CHART 1 SET DATA
    _chart.datos =@[
                    @{kPercentage:@1000},
                    @{kPercentage:@900},
                    @{kPercentage:@800},
                    @{kPercentage:@700},
                    @{kPercentage:@600},
                    @{kPercentage:@500},
                    @{kPercentage:@400},
                    @{kPercentage:@300},
                    @{kPercentage:@200},
                    @{kPercentage:@100},// 10
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},// 20
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},// 30
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000}, // 40
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},// 50
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000}, // 60
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},// 70
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000} // 80
                    ];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapClear:(id)sender {
    [_chart clearChart];
    [_chart1 clearChart];
}

- (IBAction)tapSetData:(id)sender {
    
    [self tapClear:nil];
    
    ////// CHART SET DATA
    _chart.datos =@[
                    @{kPercentage:@1000},
                    @{kPercentage:@900},
                    @{kPercentage:@800},
                    @{kPercentage:@700},
                    @{kPercentage:@600},
                    @{kPercentage:@500},
                    @{kPercentage:@400},
                    @{kPercentage:@300},
                    @{kPercentage:@200},
                    @{kPercentage:@100},// 10
                    //                     @{kPercentage:@100},
                    //                     @{kPercentage:@320},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@940},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@234},
                    //                     @{kPercentage:@423},
                    //                     @{kPercentage:@130},
                    //                     @{kPercentage:@1000},// 20
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},// 30
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},
                    //                     @{kPercentage:@1000},// 40
                    ];
    
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
