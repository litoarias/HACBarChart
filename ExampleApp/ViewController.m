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
    _chart.showProgress             = YES; // if showProgress == YES, and datos > 30 BUG, no caben en la grafica
    _chart.sizeLabelProgress        = 30;
    _chart.showRealValue            = YES;
    _chart.maxValue                 = 1000;
    _chart.progressTextColor        = [UIColor blackColor];
    _chart.backgroundColor          = [UIColor yellowColor];
    _chart.progressTextFont         = [UIFont fontWithName:@"HelveticaNeue" size:10];
    
    data = @[
             @{kHACPercentage:@1000, kHACColor : [UIColor purpleColor]},
             @{kHACPercentage:@900, kHACColor  : [UIColor redColor]},
             @{kHACPercentage:@800, kHACColor  : [UIColor cyanColor]},
             @{kHACPercentage:@700, kHACColor  : [UIColor yellowColor]},
             @{kHACPercentage:@600, kHACColor  : [UIColor blueColor]},
             @{kHACPercentage:@500, kHACColor  : [UIColor blackColor]},
             @{kHACPercentage:@400, kHACColor  : [UIColor orangeColor]},
             @{kHACPercentage:@300, kHACColor  : [UIColor lightGrayColor]},
             @{kHACPercentage:@200, kHACColor  : [UIColor magentaColor]},
             @{kHACPercentage:@100, kHACColor  : [UIColor brownColor]},// 10
             @{kHACPercentage:@1000},
             @{kHACPercentage:@1000},
             @{kHACPercentage:@1000},
             @{kHACPercentage:@1000},
             @{kHACPercentage:@1000},
             @{kHACPercentage:@1000},
             @{kHACPercentage:@1000},
             @{kHACPercentage:@1000},
             @{kHACPercentage:@1000},
             @{kHACPercentage:@1000},// 20
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
    
    ////// CHART 1 SET DATA
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
    _chart.datos =data;
    
    
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
