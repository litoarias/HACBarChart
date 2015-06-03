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
    _chart.showProgress             = YES;
    _chart.backgroundColor          = [UIColor purpleColor];
    _chart.progressTextColor        = [UIColor orangeColor];
    _chart.maxValue                 = 1000;
    
    
    ////// CHART 1
    _chart1.demo                     = NO;
    _chart1.vertical                 = NO;
    _chart1.reverse                  = NO;
    _chart1.showRealValue            = YES;
    _chart1.backgroundColor          = [UIColor blackColor];
    _chart1.progressTextColor        = [UIColor whiteColor];
    _chart1.maxValue                 = 1000;
    

}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    
    ////// CHART SET DATA
    _chart.datos =@[
                    @{@"percent":@1000},
                    @{@"percent":@800},
                    @{@"percent":@320},
                    @{@"percent":@300},
                    @{@"percent":@260},
                    @{@"percent":@400},
                    @{@"percent":@125},
                    @{@"percent":@400},
                    @{@"percent":@800},
                    @{@"percent":@200}
                    ];
    
    ////// CHART 1 SET DATA
    _chart1.datos =@[
                     @{@"percent":@1000},
                     @{@"percent":@800},
                     @{@"percent":@320},
                     @{@"percent":@300},
                     @{@"percent":@260},
                     @{@"percent":@400},
                     @{@"percent":@125},
                     @{@"percent":@400},
                     @{@"percent":@800},
                     @{@"percent":@200},
                     @{@"percent":@1000},
                     @{@"percent":@800},
                     @{@"percent":@320},
                     @{@"percent":@300},
                     @{@"percent":@260},
                     @{@"percent":@400},
                     @{@"percent":@125},
                     @{@"percent":@400},
                     @{@"percent":@800},
                     @{@"percent":@200},
                     @{@"percent":@1000},
                     @{@"percent":@800},
                     @{@"percent":@320},
                     @{@"percent":@300},
                     @{@"percent":@260},
                     @{@"percent":@400},
                     @{@"percent":@125},
                     @{@"percent":@400},
                     @{@"percent":@800},
                     @{@"percent":@200}
                     ];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
