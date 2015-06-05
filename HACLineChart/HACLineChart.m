//
//  HACLineChart.m
//  Chart
//
//  Created by Hipolito Arias on 2/6/15.
//  Copyright (c) 2015 Hipolito Arias. All rights reserved.
//

#import "HACLineChart.h"

@implementation HACLineChart


-(void)setDatos:(NSArray *)datos
{
    _datos = datos;
    [self createChart];
}

- (void)defaultInit
{
    _showProgress               = NO;   // Show text for bar
    _vertical                   = NO;
    _reverse                    = NO;
    _showRealValue              = NO;   // Show value contains _data, or real percent value
    _sizeLabelProgress          = 40;   // Width of label progress text
    //    _maxValue                   = 1000; // max value for chart
    _customText                 = NO;
    _barMargin                  = 0;
    _progressTextColor          = [UIColor whiteColor];
    _progressTextFont           = [UIFont fontWithName:@"DINCondensed-Bold" size:12.0];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self defaultInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self defaultInit];
    }
    return self;
}

-(void)clearChart{
    [self.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
}

-(float)getMaxValue{
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:kHACPercentage  ascending:YES];
    NSArray *consulados = [[self datos] sortedArrayUsingDescriptors:[NSArray arrayWithObjects:descriptor,nil]];
    return [[[consulados lastObject]valueForKey:kHACPercentage] floatValue];
}

-(void)createChart{
    
    _maxValue ? _maxValue : (_maxValue = [self getMaxValue]);
    
    // Ancho de cada linea
    CGFloat widthLine = _vertical ? CGRectGetWidth(self.bounds)/_datos.count : CGRectGetHeight(self.bounds)/_datos.count;
    
    // Posicion X de cada línea (separacion entre ellas)
    CGFloat positionX = 0;
    
    CGFloat progress100 = _vertical ? CGRectGetHeight(self.bounds) : CGRectGetWidth(self.bounds);
    
    progress100 = _showProgress ? progress100-_sizeLabelProgress : progress100;
    
    // Progreso
    CGFloat progress;
    
    if (_barMargin >= widthLine) {
        NSLog(@"Margin it's excessive width bar it's %f and margin %d",widthLine,_barMargin);
        _barMargin=0;
    }
    
    for (int i = 1; i<=_datos.count; i++) {
        
        CGFloat value = 0.0;
        
        value = [[[_datos objectAtIndex:i-1] valueForKey:kHACPercentage]floatValue];
        progress = (value * progress100) / _maxValue;
        
        // Get Progress real
        int realPercent = (progress*100)/progress100;
        
        // EL pincel pinta desde la mitad de la X, por eso hay que ajustar el grosor de la pintada para que pinte desde la izquierda
        positionX = widthLine*(i-1);
        positionX += widthLine/2;
        
        
        UIColor *barColor;
        [[_datos objectAtIndex:i-1] valueForKey:kHACColor] ? (barColor = [[_datos objectAtIndex:i-1] valueForKey:kHACColor]) : (barColor = [UIColor colorWithHue:drand48() saturation:1.0 brightness:1.0 alpha:1.0]);
        
        
        // CAShapeLayer for line
        CAShapeLayer *pathMarginLayer = [CAShapeLayer layer];
        pathMarginLayer.lineWidth = widthLine;
        pathMarginLayer.lineCap = kCALineCapButt;
        pathMarginLayer.lineJoin = kCALineJoinBevel;
        
        
        // CAShapeLayer for line
        CAShapeLayer *pathLayer = [CAShapeLayer layer];
        [pathMarginLayer addSublayer:pathLayer];
        pathLayer.strokeColor = [barColor CGColor];
        pathLayer.lineWidth = widthLine-_barMargin;
        pathLayer.lineCap = kCALineCapButt;
        pathLayer.lineJoin = kCALineJoinBevel;
        pathLayer.fillColor = [[UIColor clearColor]CGColor];
        
        
        /////// LINE CHART
        // Guia de dibujo de la linea
        UIBezierPath *path = [UIBezierPath bezierPath];
        
        if (_vertical) {
            if (_reverse) {
                ////// VERTICAL TOP TO BOTTOM
                [path moveToPoint:CGPointMake(positionX,0.0)];
                [path addLineToPoint:CGPointMake(positionX, progress)];
            }else{
                ////// VERTICAL BOTTOM TO TOP
                [path moveToPoint:CGPointMake(positionX,CGRectGetHeight(self.bounds))];
                [path addLineToPoint:CGPointMake(positionX, CGRectGetHeight(self.bounds)-progress)];
            }
        }else{
            if (_reverse) {
                ////// VERTICAL RIGTH TO LEFT
                [path moveToPoint:CGPointMake(CGRectGetWidth(self.bounds), positionX)];
                [path addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds)-progress, positionX)];
            }else{
                ////// HORIZONTAL LEFT TO RIGHT
                [path moveToPoint:CGPointMake(0.0, positionX)];
                [path addLineToPoint:CGPointMake(progress, positionX)];
            }
        }
        
        // Insert layer
        [self.layer insertSublayer:pathLayer above:self.layer];
        
        pathMarginLayer.path = pathLayer.path = path.CGPath;
        
        // Animation for line chart
        CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        pathAnimation.duration = 1;
        pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
        pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
        [pathLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
        
        
        
        
        ////// LABEL
        // CreaTe Laber progress
        CGRect frameLabel = !_vertical ? CGRectMake(0, (widthLine*i)-widthLine, _sizeLabelProgress, widthLine) : CGRectMake((widthLine*i)-widthLine, progress, widthLine, _sizeLabelProgress);
        
        NSString *text;
        if (_customText && [[_datos objectAtIndex:i-1]valueForKey:kHACCustomText]) {
            _showRealValue ? (text = [[_datos objectAtIndex:i-1]valueForKey:kHACCustomText]) : (text = [NSString stringWithFormat:@"%d%%",realPercent]);
        }else{
            _showRealValue ? (text = [NSString stringWithFormat:@"%.0f",value]) : (text = [NSString stringWithFormat:@"%d%%",realPercent]);
        }
        
        UILabel *progressText           = [[UILabel alloc]initWithFrame:frameLabel];
        progressText.text               = text;
        progressText.font               = _progressTextFont;
//        progressText.backgroundColor    = [UIColor colorWithRed:0.0f/255.0f green:255.0f/255.0f blue:0.0f/255.0f alpha:.5];
        progressText.backgroundColor    = [UIColor clearColor];
        
        _vertical ? (progressText.textAlignment = NSTextAlignmentCenter) : (progressText.textAlignment = NSTextAlignmentCenter);
        
        progressText.textColor          = _progressTextColor;
        progressText.numberOfLines      = 1;
        [progressText setMinimumScaleFactor:5.0/[UIFont labelFontSize]];
        progressText.adjustsFontSizeToFitWidth = YES;
        
        
        _showProgress ? [self addSubview:progressText] : _showProgress;
        
        NSString *animationLabelDirection;
        
        _vertical ? (animationLabelDirection = @"position.y") : (animationLabelDirection = @"position.x");
        
        CABasicAnimation *animationLabel;
        animationLabel            = [CABasicAnimation animationWithKeyPath:animationLabelDirection];
        animationLabel.duration   = 1;
        
        if (_vertical) {
            if (_reverse) {
                ////// VERTICAL TOP TO BOTTOM
                animationLabel.fromValue  = [NSNumber numberWithFloat:_sizeLabelProgress/2];
                animationLabel.toValue = @(progress+_sizeLabelProgress/2);
            }else{
                ////// VERTICAL BOTTOM TO TOP
                animationLabel.fromValue  = [NSNumber numberWithFloat:CGRectGetHeight(self.bounds) - _sizeLabelProgress/2];
                animationLabel.toValue = @((CGRectGetHeight(self.bounds)-progress) - _sizeLabelProgress/2);
            }
        }else{
            if (_reverse) {
                ////// HORIZONTAL RIGTH TO LEFT
                animationLabel.fromValue  = [NSNumber numberWithFloat:CGRectGetWidth(self.bounds)-_sizeLabelProgress/2];
                animationLabel.toValue = @(CGRectGetWidth(self.bounds)-progress-_sizeLabelProgress/2);
            }else{
                ////// HORIZONTAL LEFT TO RIGHT
                animationLabel.fromValue  = [NSNumber numberWithFloat:_sizeLabelProgress/2];
                animationLabel.toValue = @(progress + _sizeLabelProgress/2);
            }
        }
        
        animationLabel.removedOnCompletion = NO;
        animationLabel.fillMode = kCAFillModeBoth;
        
        _vertical ? [[progressText layer] addAnimation:animationLabel forKey:@"y"] : [[progressText layer] addAnimation:animationLabel forKey:@"x"];
        
    }
}

@end
