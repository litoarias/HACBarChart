//
//  HACLineChart.h
//  Chart
//
//  Created by Hipolito Arias on 2/6/15.
//  Copyright (c) 2015 Hipolito Arias. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kHACPercentage @"percentage"
#define kHACColor      @"color"

@interface HACLineChart : UIView

@property (nonatomic) BOOL demo;
@property (nonatomic) BOOL vertical;
@property (nonatomic) BOOL reverse;
@property (nonatomic) BOOL showProgress;
@property (nonatomic) BOOL showRealValue;
@property (nonatomic) int sizeLabelProgress;
@property (nonatomic) int maxValue;
@property (strong, nonatomic) UIColor *progressTextColor;
@property (strong, nonatomic) UIFont *progressTextFont;

@property (strong, nonatomic) NSArray *datos;

- (void)clearChart;

@end
