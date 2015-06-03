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
    _chart.reverse                  = NO;
    _chart.showProgress             = YES; // if showProgress == YES, and datos > 30 BUG, no caben en la grafica
    _chart.sizeLabelProgress        = 30;
    _chart1.showRealValue           = YES;
    _chart.maxValue                 = 1000;
    _chart.progressTextColor        = [UIColor whiteColor];
    _chart.backgroundColor          = [UIColor blackColor];
    _chart.progressTextFont         = [UIFont fontWithName:@"HelveticaNeue" size:10];
    
    
    ////// CHART 1
    _chart1.demo                     = NO;
    _chart1.vertical                 = NO;
    _chart1.reverse                  = NO;
    _chart1.showProgress             = YES; // if showProgress == YES, and datos > 30 BUG, no caben en la grafica
    _chart1.sizeLabelProgress        = 30;
    _chart1.showRealValue            = YES;
    _chart1.maxValue                 = 1000;
    _chart1.progressTextColor        = [UIColor blackColor];
    _chart1.backgroundColor          = [UIColor colorWithRed:0.81 green:0.89 blue:0.95 alpha:1.0];
    _chart1.progressTextFont         = [UIFont fontWithName:@"HelveticaNeue" size:5];
    

}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    
    ////// CHART SET DATA
    _chart.datos =@[
                    @{kPercentage:@1000},
                    @{kPercentage:@800},
                    @{kPercentage:@320},
                    @{kPercentage:@300},
                    @{kPercentage:@260},
                    @{kPercentage:@400},
                    @{kPercentage:@125},
                    @{kPercentage:@400},
                    @{kPercentage:@800},
                    @{kPercentage:@200}
                    ];
    
    ////// CHART 1 SET DATA
    _chart1.datos =@[
                     @{kPercentage:@1000},
                     @{kPercentage:@800},
                     @{kPercentage:@320},
                     @{kPercentage:@300},
                     @{kPercentage:@260},
                     @{kPercentage:@400},
                     @{kPercentage:@125},
                     @{kPercentage:@400},
                     @{kPercentage:@800},
                     @{kPercentage:@200},// 10
                     @{kPercentage:@1000},
                     @{kPercentage:@1000},
                     @{kPercentage:@1000},
                     @{kPercentage:@1000},
                     @{kPercentage:@1000},
                     @{kPercentage:@1000},
                     @{kPercentage:@1000},
                     @{kPercentage:@1000},
                     @{kPercentage:@1000},
                     @{kPercentage:@1000},// 20
                     @{kPercentage:@1000},
                     @{kPercentage:@1000},
                     @{kPercentage:@1000},
                     @{kPercentage:@1000},
                     @{kPercentage:@1000},
                     @{kPercentage:@1000},
                     @{kPercentage:@1000},
                     @{kPercentage:@1000},
                     @{kPercentage:@1000},
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
                    @{kPercentage:@800},
                    @{kPercentage:@320},
                    @{kPercentage:@300},
                    @{kPercentage:@260},
                    @{kPercentage:@400},
                    @{kPercentage:@125},
                    @{kPercentage:@400},
                    @{kPercentage:@800},
                    @{kPercentage:@200}
                    ];
    
    ////// CHART 1 SET DATA
    _chart1.datos =@[
                     @{kPercentage:@1000},
                     @{kPercentage:@800},
                     @{kPercentage:@320},
                     @{kPercentage:@300},
                     @{kPercentage:@260},
                     @{kPercentage:@400},
                     @{kPercentage:@125},
                     @{kPercentage:@400},
                     @{kPercentage:@800},
                     @{kPercentage:@200},// 10
                     @{kPercentage:@1000},
                     @{kPercentage:@1000},
                     @{kPercentage:@1000},
                     @{kPercentage:@1000},
                     @{kPercentage:@1000},
                     @{kPercentage:@1000},
                     @{kPercentage:@1000},
                     @{kPercentage:@1000},
                     @{kPercentage:@1000},
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

@end
