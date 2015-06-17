//
//  HACBar.m
//  Chart
//
//  Created by Hipolito Arias on 16/6/15.
//  Copyright (c) 2015 Hipolito Arias. All rights reserved.
//

#import "HACBarLayer.h"

@implementation HACBarLayer

-(id)initWithStrokeWidth:(CGFloat)strokeWidth
             strokeColor:(UIColor *)strokeColor
               fillColor:(UIColor *)fillColor
               fromValue:(CGFloat)fromValue
                 toValue:(CGFloat)toValue
                  margin:(CGFloat)margin
       durationAnimation:(int)duration{
    
    if (self = [super init]) {
        if ([self isKindOfClass:[HACBarLayer class]]) {
            HACBarLayer *pathLayer  = (HACBarLayer *)self;
            pathLayer.strokeColor   = [strokeColor CGColor];
            pathLayer.lineWidth     = strokeWidth - margin;
            pathLayer.lineCap       = kCALineCapButt;
            pathLayer.lineJoin      = kCALineJoinBevel;
            pathLayer.fillColor     = [[UIColor clearColor]CGColor];
            
            [self addAnimation:[self generateAnimationWithKey:@"strokeEnd" duration:duration] forKey:@"strokeEnd"];
        }
    }
    return self;
}

-(CABasicAnimation *)generateAnimationWithKey:(NSString *)key duration:(int)duration{
    // Animation for bar chart
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:key];
    pathAnimation.duration = duration;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    
    return pathAnimation;
}

@end
