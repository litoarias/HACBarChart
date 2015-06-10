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
    NSTimer *timer;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    data = @[
             @{kHACPercentage:@1000, kHACColor  : [UIColor colorWithRed:0.000f green:0.620f blue:0.890f alpha:1.0f], kHACCustomText : @"January"},
             @{kHACPercentage:@875,  kHACColor  : [UIColor colorWithRed:0.431f green:0.000f blue:0.533f alpha:1.0f], kHACCustomText : @"February"},
             @{kHACPercentage:@875,  kHACColor  : [UIColor colorWithRed:0.922f green:0.000f blue:0.000f alpha:.75f], kHACCustomText : @"March"},
             @{kHACPercentage:@875,  kHACColor  : [UIColor colorWithRed:0.000f green:0.671f blue:0.180f alpha:.75f], kHACCustomText : @"April"},
             @{kHACPercentage:@750,  kHACColor  : [UIColor colorWithRed:1.000f green:0.000f blue:0.851f alpha:.75f], kHACCustomText : @"May"},
             @{kHACPercentage:@750,  kHACColor  : [UIColor colorWithRed:1.000f green:0.808f blue:0.000f alpha:.75f], kHACCustomText : @"June"},
             @{kHACPercentage:@625,  kHACColor  : [UIColor colorWithRed:0.294f green:0.843f blue:0.251f alpha:.75f], kHACCustomText : @"July"},
             @{kHACPercentage:@500,  kHACColor  : [UIColor colorWithRed:1.000f green:0.404f blue:0.000f alpha:.75f], kHACCustomText : @"August"},
             @{kHACPercentage:@500,  kHACColor  : [UIColor colorWithRed:0.282f green:0.631f blue:0.620f alpha:.75f], kHACCustomText : @"September"},
             @{kHACPercentage:@375,  kHACColor  : [UIColor colorWithRed:0.776f green:0.000f blue:0.702f alpha:.75f], kHACCustomText : @"October"},
             @{kHACPercentage:@250,  kHACColor  : [UIColor colorWithRed:0.282f green:0.631f blue:0.620f alpha:.75f], kHACCustomText : @"November"},
             @{kHACPercentage:@125,  kHACColor  : [UIColor colorWithRed:0.776f green:0.000f blue:0.702f alpha:.75f], kHACCustomText : @"December"}
             ];
    
    
    ////// CHART CONFIG
    _chart.showAxis                   = YES;   // Show axis line
    _chart.showProgress               = YES;   // Show text for bar
    _chart.vertical                   = YES;   // Orientation chart
    _chart.reverse                    = YES;   // Orientation chart
    _chart.showRealValue              = YES;   // Show value contains _data, or real percent value
    _chart.customText                 = YES;   // Show custom text, in _data with key kHACCustomText
    _chart.barMargin                  = 0;     // Margin between bars
    _chart.sizeLabelProgress          = 20;    // Width of label progress text
//    _chart.maxValue                 = 1200;  // If no define maxValue, get maxium of _data
    _chart.progressTextColor        = [UIColor darkGrayColor];
    _chart.axisYTextColor           = [UIColor grayColor];
    _chart.backgroundColor          = [UIColor colorWithRed:0.80 green:0.80 blue:0.80 alpha:.6];
//    _chart.backgroundColor          = [UIColor clearColor];
    _chart.progressTextFont         = [UIFont fontWithName:@"DINCondensed-Bold" size:12];
    _chart.data = data;
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    ////// CHART SET DATA
    [_chart draw];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)slideAction:(id)sender {
    UISlider *slide = (UISlider *)sender;
    _chart.barMargin = slide.value;
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
    [_chart clearChart];
}

- (IBAction)tapSetData:(id)sender {
    
    [self tapClear:nil];
    
    ////// CHART SET DATA
    [_chart draw];
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

- (IBAction)showAxis:(id)sender {
    UISwitch *mySwitch = (UISwitch *)sender;
    if ([mySwitch isOn]) {
        _chart.showAxis = YES;
    } else {
        _chart.showAxis = NO;
    }
    [self tapSetData:nil];
}

@end
