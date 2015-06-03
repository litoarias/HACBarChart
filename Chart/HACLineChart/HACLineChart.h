//
//  HACLineChart.h
//  Chart
//
//  Created by Hipolito Arias on 2/6/15.
//  Copyright (c) 2015 Hipolito Arias. All rights reserved.
//

#import <UIKit/UIKit.h>

//@class HACLineChart;
//
//typedef void (^ChartViewBlock)(HACLineChart *chart);

@interface HACLineChart : UIView


@property (nonatomic) BOOL demo;
@property (nonatomic) BOOL vertical;
@property (nonatomic) BOOL reverse;
@property (nonatomic) BOOL showProgress;
//@property (nonatomic) int numberItems;
@property (nonatomic) int sizeLabelProgress;
@property (nonatomic) int maxValue;
@property (assign, nonatomic) UIColor *progressTextColor;
@property (strong, nonatomic) NSArray *datos;
@property (assign, nonatomic) UIFont *progressTextFont;
@property (nonatomic) BOOL showRealValue;

//@property (nonatomic, copy) ChartViewBlock chartBlock;

@end
