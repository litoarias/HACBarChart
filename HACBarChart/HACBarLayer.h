//
//  HACBar.h
//  Chart
//
//  Created by Hipolito Arias on 16/6/15.
//  Copyright (c) 2015 Hipolito Arias. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface HACBarLayer : CAShapeLayer

@property (nonatomic) int HACAnimationDuration;
@property (nonatomic) CGFloat margin;

-(id)initWithStrokeWidth:(CGFloat)strokeWidth
             strokeColor:(UIColor *)strokeColor
               fillColor:(UIColor *)fillColor
               fromValue:(CGFloat)fromValue
                 toValue:(CGFloat)toValue
                  margin:(CGFloat)margin
       durationAnimation:(int)duration;

@end
