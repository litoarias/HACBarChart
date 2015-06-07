//
//  HACLineChart.m
//  Chart
//
//  Created by Hipolito Arias on 2/6/15.
//  Copyright (c) 2015 Hipolito Arias. All rights reserved.
//

#import "HACLineChart.h"

@implementation HACLineChart


# pragma mark - Life cycle

- (void)defaultInit
{
    _showProgress               = NO;   // Show text for bar
    _vertical                   = NO;   // Orientation chart
    _reverse                    = NO;   // Orientation chart
    _showRealValue              = NO;   // Show value contains _data, or real percent value
    _sizeLabelProgress          = 40;   // Width of label progress text
    _customText                 = NO;   // Show custom text, in _data with key kHACCustomText
    _barMargin                  = 0;    // Margin between bars
    _progressTextColor          = [UIColor whiteColor];
    _progressTextFont           = [UIFont fontWithName:@"DINCondensed-Bold" size:12.0];
}

- (id)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        [self defaultInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ([super initWithCoder:aDecoder]) {
        [self defaultInit];
    }
    return self;
}

# pragma mark - Public Methods

-(void)draw{
    [self createChart];
}

-(void)setData:(NSArray *)data
{
    _data = data;
}

-(void)clearChart{
    [self.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
}

# pragma mark - Bar Methods

-(float)calculateMaxValue{
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:kHACPercentage  ascending:YES];
    NSArray *consulados = [[self data] sortedArrayUsingDescriptors:[NSArray arrayWithObjects:descriptor,nil]];
    return [[[consulados lastObject]valueForKey:kHACPercentage] floatValue];
}

-(int)getMaxValue{
    return _maxValue ? _maxValue : (_maxValue = [self calculateMaxValue]);
}

-(CGFloat)getWitdOfLine{
    return _vertical ? CGRectGetWidth(self.bounds)/_data.count : CGRectGetHeight(self.bounds)/_data.count;
}

-(CGFloat)getMaxiumProgress{
    CGFloat progress100 = _vertical ? CGRectGetHeight(self.bounds) : CGRectGetWidth(self.bounds);
    return _showProgress ? progress100-_sizeLabelProgress : progress100;
}

-(void)checkWidthBarPossibleWithWidthBar:(CGFloat)width{
    if (_barMargin >= width) {
        NSLog(@"Margin it's excessive width bar it's %f and margin %d", width, _barMargin);
        _barMargin=0;
    }
}

-(UIColor *)getBarColorWithIndex:(int)index{
    return [[_data objectAtIndex:index-1] valueForKey:kHACColor] ? [[_data objectAtIndex:index-1] valueForKey:kHACColor] : [UIColor colorWithHue:drand48() saturation:1.0 brightness:1.0 alpha:1.0];
}

-(CAShapeLayer *)getMarginPathWith:(CGFloat)widthBar{
    CAShapeLayer *pathMarginLayer = [CAShapeLayer layer];
    pathMarginLayer.lineWidth = widthBar;
    pathMarginLayer.lineCap = kCALineCapButt;
    pathMarginLayer.strokeColor = [[UIColor colorWithRed:0.00 green:0.00 blue:0.00 alpha:.3] CGColor];
    pathMarginLayer.lineJoin = kCALineJoinBevel;
    
    return pathMarginLayer;
}

-(CAShapeLayer *)getPathWith:(CGFloat)widthBar marginShapeLayer:(CAShapeLayer *)marginPath barColor:(UIColor *)barColor{
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    [marginPath addSublayer:pathLayer];
    pathLayer.strokeColor = [barColor CGColor];
    pathLayer.lineWidth = widthBar - _barMargin;
    pathLayer.lineCap = kCALineCapButt;
    pathLayer.lineJoin = kCALineJoinBevel;
    pathLayer.fillColor = [[UIColor clearColor]CGColor];
    
    return pathLayer;
}

-(UIBezierPath *)pathForBarWithXPosition:(CGFloat) positionX progress:(CGFloat)progress{
    /////// LINE CHART
    // Guia de dibujo de la linea
    UIBezierPath *pathBar = [UIBezierPath bezierPath];
    
    if (_vertical) {
        if (_reverse) {
            ////// VERTICAL TOP TO BOTTOM
            [pathBar moveToPoint:CGPointMake(positionX,0.0)];
            [pathBar addLineToPoint:CGPointMake(positionX, progress)];
        }else{
            ////// VERTICAL BOTTOM TO TOP
            [pathBar moveToPoint:CGPointMake(positionX,CGRectGetHeight(self.bounds))];
            [pathBar addLineToPoint:CGPointMake(positionX, CGRectGetHeight(self.bounds)-progress)];
        }
    }else{
        if (_reverse) {
            ////// VERTICAL RIGTH TO LEFT
            [pathBar moveToPoint:CGPointMake(CGRectGetWidth(self.bounds), positionX)];
            [pathBar addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds)-progress, positionX)];
        }else{
            ////// HORIZONTAL LEFT TO RIGHT
            [pathBar moveToPoint:CGPointMake(0.0, positionX)];
            [pathBar addLineToPoint:CGPointMake(progress, positionX)];
        }
    }
    return pathBar;
}

-(CABasicAnimation *)getAnimationWithKey:(NSString *)key{
    // Animation for bar chart
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:key];
    pathAnimation.duration = 1;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    
    return pathAnimation;
}


# pragma mark - UILabel Methods

-(CGRect)getFrameLabelWith:(CGFloat)witdthBar index:(int)index progress:(CGFloat)progress{
    return !_vertical ? CGRectMake(0, (witdthBar*index)-witdthBar, _sizeLabelProgress, witdthBar) : CGRectMake((witdthBar*index)-witdthBar, progress, witdthBar, _sizeLabelProgress);
}

-(NSString*)getTextWithIndex:(int)index realPercent:(int)realPercent value:(CGFloat)value{
    NSString *text;
    if (_customText && [[_data objectAtIndex:index-1]valueForKey:kHACCustomText]) {
        _showRealValue ? (text = [[_data objectAtIndex:index-1]valueForKey:kHACCustomText]) : (text = [NSString stringWithFormat:@"%d%%",realPercent]);
    }else{
        _showRealValue ? (text = [NSString stringWithFormat:@"%.0f",value]) : (text = [NSString stringWithFormat:@"%d%%",realPercent]);
    }
    return text;
}

-(UILabel *) setLabelWithFrame:(CGRect)frame text:(NSString*)text{
    UILabel *progressText           = [[UILabel alloc]initWithFrame:frame];
    progressText.text               = text;
    progressText.font               = _progressTextFont;
    progressText.backgroundColor    = [UIColor clearColor];
    _vertical ? (progressText.textAlignment = NSTextAlignmentCenter) : (progressText.textAlignment = NSTextAlignmentCenter);
    progressText.textColor          = _progressTextColor;
    progressText.numberOfLines      = 1;
    [progressText setMinimumScaleFactor:5.0/[UIFont labelFontSize]];
    progressText.adjustsFontSizeToFitWidth = YES;
    
    return progressText;
}

-(CABasicAnimation *)setupAnimationLabelWithProgress:(CGFloat)progress{
    CABasicAnimation *animationLabel;
    animationLabel            = [CABasicAnimation animationWithKeyPath: _vertical ? (@"position.y") : (@"position.x")];
    animationLabel.duration   = 1;
    
    if (_vertical) {
        if (_reverse) {
            ////// VERTICAL TOP TO BOTTOM
            animationLabel.fromValue  = [NSNumber numberWithFloat:_sizeLabelProgress / 2];
            animationLabel.toValue = @(progress+_sizeLabelProgress / 2);
        }else{
            ////// VERTICAL BOTTOM TO TOP
            animationLabel.fromValue  = [NSNumber numberWithFloat:CGRectGetHeight(self.bounds) - _sizeLabelProgress / 2];
            animationLabel.toValue = @((CGRectGetHeight(self.bounds)-progress) - _sizeLabelProgress / 2);
        }
    }else{
        if (_reverse) {
            ////// HORIZONTAL RIGTH TO LEFT
            animationLabel.fromValue  = [NSNumber numberWithFloat:CGRectGetWidth(self.bounds)-_sizeLabelProgress / 2];
            animationLabel.toValue = @(CGRectGetWidth(self.bounds)-progress - _sizeLabelProgress / 2);
        }else{
            ////// HORIZONTAL LEFT TO RIGHT
            animationLabel.fromValue  = [NSNumber numberWithFloat:_sizeLabelProgress / 2];
            animationLabel.toValue = @(progress + _sizeLabelProgress / 2);
        }
    }
    
    animationLabel.removedOnCompletion = NO;
    animationLabel.fillMode = kCAFillModeBoth;

    return animationLabel;
}

# pragma mark - Construct Chart

-(void)createChart{
    
    // Máximo valor posible de los datos obtenidos (Valor mas alto)
    int maxVal = [self getMaxValue];
    
    // Ancho de cada linea, arreglo al ancho de la vista
    CGFloat widthLine = [self getWitdOfLine];
    
    // Progreso máximo posible de la barra, dependiendo de la orientación elegida, se auto ajustará
    CGFloat progress100 = [self getMaxiumProgress];
    
    
    // Progreso
    CGFloat progress;
    
    // Compruebo el margen, si es posible se aplica, si no se pone a 0
    [self checkWidthBarPossibleWithWidthBar:widthLine];
    
    for (int i = 1; i<=_data.count; i++) {
        
        // Obtain value from data
        CGFloat value = [[[_data objectAtIndex:i-1] valueForKey:kHACPercentage]floatValue];
        
        // Obtain progress size
        progress = (value * progress100) / maxVal;
        
        // Get real Progress
        int realPercent = (progress*100)/progress100;
        
        // Posicion X de cada línea (separacion entre ellas)
        CGFloat positionX = ( (widthLine * (i - 1)) + (widthLine / 2) );
        
        UIColor *barColor = [self getBarColorWithIndex:i];
        
        // CAShapeLayer margin for bar
        CAShapeLayer *shadowLayer = [self getMarginPathWith:widthLine];
        
        [self.layer insertSublayer:shadowLayer above:self.layer];
        
        // CAShapeLayer for bar
        CAShapeLayer *barLayer = [self getPathWith:widthLine marginShapeLayer:shadowLayer barColor:barColor];
        
        // Insert layer
        [self.layer insertSublayer:barLayer above:self.layer];
        
        // Camino a seguir de la barra
        UIBezierPath *pathBar = [self pathForBarWithXPosition:positionX progress:progress];
        
        /*pathShadowLayer.path =*/ barLayer.path = pathBar.CGPath;
        
        // Animation for line chart
        [barLayer addAnimation:[self getAnimationWithKey:@"strokeEnd"] forKey:@"strokeEnd"];
        
        ////// LABEL
        // CreaTe Laber progress
        UILabel *progressText = [self setLabelWithFrame:[self getFrameLabelWith:widthLine index:i progress:progress]
                                                   text:[self getTextWithIndex:i realPercent:realPercent value:value]];
        
        // Show progress ?
        _showProgress ? [self addSubview:progressText] : _showProgress;
        
        // Setup animation Label from orientation
        CABasicAnimation *animationLabel = [self setupAnimationLabelWithProgress:progress];
        
        _vertical ? [[progressText layer] addAnimation:animationLabel forKey:@"y"] : [[progressText layer] addAnimation:animationLabel forKey:@"x"];
        
    }
}

@end
