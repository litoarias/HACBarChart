//
//  HACLineChart.h
//  Chart
//
//  Created by Hipolito Arias on 2/6/15.
//  Copyright (c) 2015 Hipolito Arias. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HACBarLayer.h"

#define kHACPercentage      @"percentage"
#define kHACColor           @"color"
#define kHACCustomText      @"customText"


@interface HACBarChart : UIView

@property (nonatomic) BOOL vertical;
@property (nonatomic) BOOL reverse;
@property (nonatomic) BOOL showProgressLabel;
@property (nonatomic) BOOL showDataValue;
@property (nonatomic) BOOL showCustomText;
@property (nonatomic) BOOL showAxis;

@property (nonatomic) int sizeLabelProgress;
@property (nonatomic) int axisMaxValue;
@property (nonatomic) int barsMargin;
@property (nonatomic) int animationDuration;
@property (nonatomic) int numberDividersAxisY;

@property (strong, nonatomic) UIColor *progressTextColor;
@property (strong, nonatomic) UIColor *axisYTextColor;
@property (strong, nonatomic) UIFont *progressTextFont;

@property (strong, nonatomic) NSArray *data;

- (void)clearChart;
- (void)draw;

@end
