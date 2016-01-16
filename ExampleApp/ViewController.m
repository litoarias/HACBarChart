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
    NSArray *data3;
    NSTimer *timer;
}
@property (weak, nonatomic) IBOutlet HACBarChart *chart3;
@property (weak, nonatomic) IBOutlet HACBarChart *chart2;

@end

@implementation ViewController
- (IBAction)changeType:(id)sender {
    
    UISegmentedControl *segControl = (UISegmentedControl *)sender;
    
    [self tapClear:nil];
    
    switch (segControl.selectedSegmentIndex) {
        case 0:
            _chart3.typeBar = HACBarType1;
            break;
        case 1:
            _chart3.typeBar = HACBarType2;
            break;
        case 2:
            _chart3.typeBar = HACBarType3;
            break;
        case 3:
            _chart3.typeBar = HACBarType4;
            break;
            
        default:
            _chart3.typeBar = HACBarType1;
            break;
    }
    
    
    ////// CHART SET DATA
    [_chart draw];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    
    data3 = @[
             @{kHACPercentage:@1000, kHACColor  : [UIColor colorWithRed:0.000f green:0.620f blue:0.890f alpha:1.0f], kHACCustomText : @"January"},
             @{kHACPercentage:@875,  kHACColor  : [UIColor colorWithRed:0.431f green:0.000f blue:0.533f alpha:1.0f], kHACCustomText : @"February"},
             @{kHACPercentage:@0,  kHACColor    : [UIColor colorWithRed:0.922f green:0.000f blue:0.000f alpha:1.0f], kHACCustomText : @"March"},
             @{kHACPercentage:@875,  kHACColor  : [UIColor colorWithRed:0.000f green:0.671f blue:0.180f alpha:1.0f], kHACCustomText : @"April"},
             @{kHACPercentage:@750,  kHACColor  : [UIColor colorWithRed:1.000f green:0.000f blue:0.851f alpha:1.0f], kHACCustomText : @"May"},
             @{kHACPercentage:@750,  kHACColor  : [UIColor colorWithRed:1.000f green:0.808f blue:0.000f alpha:1.0f], kHACCustomText : @"June"},
             @{kHACPercentage:@625,  kHACColor  : [UIColor colorWithRed:0.294f green:0.843f blue:0.251f alpha:1.0f], kHACCustomText : @"July"},
             @{kHACPercentage:@500,  kHACColor  : [UIColor colorWithRed:1.000f green:0.404f blue:0.000f alpha:1.0f], kHACCustomText : @"August"},
             @{kHACPercentage:@500,  kHACColor  : [UIColor colorWithRed:0.282f green:0.631f blue:0.620f alpha:1.0f], kHACCustomText : @"September"},
             @{kHACPercentage:@375,  kHACColor  : [UIColor colorWithRed:0.776f green:0.000f blue:0.702f alpha:1.0f], kHACCustomText : @"October"},
             @{kHACPercentage:@2,  kHACColor  : [UIColor colorWithRed:0.282f green:0.631f blue:0.620f alpha:1.0f], kHACCustomText : @"November"},
             @{kHACPercentage:@0,  kHACColor  : [UIColor colorWithRed:0.776f green:0.000f blue:0.702f alpha:1.0f], kHACCustomText : @"December"}
             ];

    
    data = @[
             @{kHACPercentage:@0, kHACColor  : [UIColor colorWithRed:0.44 green:0.66 blue:0.86 alpha:.5], kHACCustomText : @"January"},
             @{kHACPercentage:@15,  kHACColor  : [UIColor colorWithRed:0.43 green:0.62 blue:0.92 alpha:1.0], kHACCustomText : @"February"},
             @{kHACPercentage:@1000,  kHACColor    : [UIColor colorWithRed:0.44 green:0.66 blue:0.86 alpha:.5], kHACCustomText : @"March"},
             @{kHACPercentage:@875,  kHACColor  : [UIColor colorWithRed:0.43 green:0.62 blue:0.92 alpha:1.0], kHACCustomText : @"April"},
             @{kHACPercentage:@730,  kHACColor  : [UIColor colorWithRed:0.44 green:0.66 blue:0.86 alpha:.5], kHACCustomText : @"May"},
             @{kHACPercentage:@750,  kHACColor  : [UIColor colorWithRed:0.43 green:0.62 blue:0.92 alpha:1.0], kHACCustomText : @"June"},
             @{kHACPercentage:@625,  kHACColor  : [UIColor colorWithRed:0.44 green:0.66 blue:0.86 alpha:.5], kHACCustomText : @"July"},
             @{kHACPercentage:@500,  kHACColor  : [UIColor colorWithRed:0.43 green:0.62 blue:0.92 alpha:1.0], kHACCustomText : @"August"},
             @{kHACPercentage:@500,  kHACColor  : [UIColor colorWithRed:0.44 green:0.66 blue:0.86 alpha:.5], kHACCustomText : @"September"},
             @{kHACPercentage:@375,  kHACColor  : [UIColor colorWithRed:0.43 green:0.62 blue:0.92 alpha:1.0], kHACCustomText : @"October"},
             @{kHACPercentage:@2,  kHACColor    : [UIColor colorWithRed:0.44 green:0.66 blue:0.86 alpha:.5], kHACCustomText : @"November"},
             @{kHACPercentage:@0,  kHACColor    : [UIColor colorWithRed:0.43 green:0.62 blue:0.92 alpha:1.0], kHACCustomText : @"December"}
             ];
    
    
    ////// CHART CONFIG
    _chart.showAxis                 = YES;   // Show axis line
    _chart.showProgressLabel        = YES;   // Show text for bar
    _chart.vertical                 = NO;   // Orientation chart
    _chart.reverse                  = YES;   // Orientation chart
    _chart.showDataValue            = YES;   // Show value contains _data, or real percent value
    _chart.showCustomText           = YES;   // Show custom text, in _data with key kHACCustomText
    _chart.barsMargin               = 0;     // Margin between bars
    _chart.sizeLabelProgress        = 30;    // Width of label progress text
    _chart.numberDividersAxisY      = 8;
    _chart.animationDuration        = 2;
//    _chart.axisMaxValue             = 1500;    // If no define maxValue, get maxium of _data
    _chart.progressTextColor        = [UIColor darkGrayColor];
    _chart.axisYTextColor           = [UIColor colorWithRed:0.80 green:0.80 blue:0.80 alpha:1.0];
    _chart.progressTextFont         = [UIFont fontWithName:@"DINCondensed-Bold" size:6];
    _chart.typeBar                  = HACBarType2;
    _chart.dashedLineColor          = [UIColor colorWithRed:0.44 green:0.66 blue:0.86 alpha:.3];
    _chart.axisXColor               = [UIColor colorWithRed:0.44 green:0.66 blue:0.86 alpha:1.0];
    _chart.axisYColor               = [UIColor colorWithRed:0.44 green:0.66 blue:0.86 alpha:1.0];
    _chart.showAxisZeroValue        = NO;
    _chart.data = data;
    
    ////// CHART SET DATA
    [_chart draw];
    
    
    _chart2.showAxis                 = YES;   // Show axis line
    _chart2.showProgressLabel        = YES;   // Show text for bar
    _chart2.vertical                 = NO;   // Orientation chart
    _chart2.reverse                  = NO;   // Orientation chart
    _chart2.showDataValue            = YES;   // Show value contains _data, or real percent value
    _chart2.showCustomText           = YES;   // Show custom text, in _data with key kHACCustomText
    _chart2.barsMargin               = 0;     // Margin between bars
    _chart2.sizeLabelProgress        = 30;    // Width of label progress text
    _chart2.numberDividersAxisY      = 8;
    _chart2.animationDuration        = 2;
    //    _chart.axisMaxValue             = 1500;    // If no define maxValue, get maxium of _data
    _chart2.progressTextColor        = [UIColor darkGrayColor];
    _chart2.axisYTextColor           = [UIColor colorWithRed:0.80 green:0.80 blue:0.80 alpha:1.0];
    _chart2.progressTextFont         = [UIFont fontWithName:@"DINCondensed-Bold" size:6];
    _chart2.typeBar                  = HACBarType2;
    _chart2.dashedLineColor          = [UIColor colorWithRed:0.44 green:0.66 blue:0.86 alpha:.3];
    _chart2.axisXColor               = [UIColor colorWithRed:0.44 green:0.66 blue:0.86 alpha:1.0];
    _chart2.axisYColor               = [UIColor colorWithRed:0.44 green:0.66 blue:0.86 alpha:1.0];
    _chart2.data = data;
    
    ////// CHART SET DATA
    [_chart2 draw];
    
    
    
    _chart3.showAxis                 = YES;   // Show axis line
    _chart3.showProgressLabel        = YES;   // Show text for bar
    _chart3.vertical                 = YES;   // Orientation chart
    _chart3.reverse                  = NO;   // Orientation chart
    _chart3.showDataValue            = YES;   // Show value contains _data, or real percent value
    _chart3.showCustomText           = YES;   // Show custom text, in _data with key kHACCustomText
    _chart3.barsMargin               = 0;     // Margin between bars
    _chart3.sizeLabelProgress        = 30;    // Width of label progress text
    _chart3.numberDividersAxisY      = 8;
    _chart3.animationDuration        = 2;
    //    _chart.axisMaxValue             = 1500;    // If no define maxValue, get maxium of _data
    _chart3.progressTextColor        = [UIColor darkGrayColor];
    _chart3.axisYTextColor           = [UIColor colorWithRed:0.80 green:0.80 blue:0.80 alpha:1.0];
    _chart3.progressTextFont         = [UIFont fontWithName:@"DINCondensed-Bold" size:6];
    _chart3.typeBar                  = HACBarType1;
    _chart3.dashedLineColor          = [UIColor colorWithRed:0.44 green:0.66 blue:0.86 alpha:.3];
    _chart3.axisXColor               = [UIColor colorWithRed:0.44 green:0.66 blue:0.86 alpha:1.0];
    _chart3.axisYColor               = [UIColor colorWithRed:0.44 green:0.66 blue:0.86 alpha:1.0];
    _chart3.data = data;
    
    ////// CHART SET DATA
    [_chart3 draw];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)slideAction:(id)sender {
    UISlider *slide = (UISlider *)sender;
    _chart3.barsMargin = slide.value;
    _lblSlide.text = [NSString stringWithFormat:@"Bar margin= %.0f",fabsf(slide.value)];
    if ([timer isValid]) {
        [timer invalidate];
    }
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(tapSetData:)
                                           userInfo:nil
                                            repeats:NO];
    
}

- (IBAction)tapClear:(id)sender {
    [_chart3 clearChart];
}

- (IBAction)tapSetData:(id)sender {
    
    [self tapClear:nil];
    
    ////// CHART SET DATA
    [_chart3 draw];
}

- (IBAction)tapRealValue:(id)sender {
    UISwitch *mySwitch = (UISwitch *)sender;
    if ([mySwitch isOn]) {
        _chart3.showDataValue = YES;
    } else {
        _chart3.showDataValue = NO;
    }
    [self tapSetData:nil];
}

- (IBAction)tapShowProgress:(id)sender {
    UISwitch *mySwitch = (UISwitch *)sender;
    if ([mySwitch isOn]) {
        _chart3.showProgressLabel = YES;
    } else {
        _chart3.showProgressLabel = NO;
    }
    [self tapSetData:nil];
}

- (IBAction)tapReverse:(id)sender {
    UISwitch *mySwitch = (UISwitch *)sender;
    if ([mySwitch isOn]) {
        _chart3.reverse = YES;
    } else {
        _chart3.reverse = NO;
    }
    [self tapSetData:nil];
}

- (IBAction)tapVertical:(id)sender {
    UISwitch *mySwitch = (UISwitch *)sender;
    if ([mySwitch isOn]) {
        _chart3.vertical = YES;
    } else {
        _chart3.vertical = NO;
    }
    [self tapSetData:nil];
}

- (IBAction)showAxis:(id)sender {
    UISwitch *mySwitch = (UISwitch *)sender;
    if ([mySwitch isOn]) {
        _chart3.showAxis = YES;
    } else {
        _chart3.showAxis = NO;
    }
    [self tapSetData:nil];
}

- (IBAction)showCustomText:(id)sender {
    UISwitch *mySwitch = (UISwitch *)sender;
    if ([mySwitch isOn]) {
        _chart3.showCustomText = YES;
    } else {
        _chart3.showCustomText = NO;
    }
    [self tapSetData:nil];
}

@end
