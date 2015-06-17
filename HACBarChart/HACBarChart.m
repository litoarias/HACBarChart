//
//  HACLineChart.m
//  Chart
//
//  Created by Hipolito Arias on 2/6/15.
//  Copyright (c) 2015 Hipolito Arias. All rights reserved.
//

#import "HACBarChart.h"

@implementation HACBarChart

CGFloat marginAxis = 0.0;
CGFloat const constantMarginAxis = 20.0;

# pragma mark - Life cycle

- (void)defaultInit
{
    _showAxis                   = YES;  // Show axis line
    _showProgressLabel          = NO;   // Show text for bar
    _vertical                   = NO;   // Orientation chart
    _reverse                    = NO;   // Orientation chart
    _showDataValue              = NO;   // Show value contains _data, or real percent value
    _sizeLabelProgress          = 40;   // Width of label progress text
    _showCustomText             = NO;   // Show custom text, in _data with key kHACCustomText
    _barsMargin                 = 0;    // Margin between bars
    _animationDuration          = 1;
    _numberDividersAxisY        = 7;
    _progressTextColor          = [UIColor blackColor];
    _axisYTextColor             = [UIColor lightGrayColor];
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
    return _axisMaxValue ? abs(_axisMaxValue) : abs((_axisMaxValue = [self calculateMaxValue]));
}

-(CGFloat)getWitdOfLine{
    return _vertical ? ( CGRectGetWidth(self.bounds) - marginAxis ) / _data.count : (CGRectGetHeight(self.bounds) - marginAxis) / _data.count;
}

-(CGFloat)getMaxiumProgress{
    CGFloat progress100 = _vertical ? CGRectGetHeight(self.bounds) : CGRectGetWidth(self.bounds);
    return _showProgressLabel ? progress100  : progress100;
}

-(CGFloat)getMaxiumProgressWithAxisAndLastMaxiumProgress:(CGFloat)progress100{
    return _showAxis ? progress100 - marginAxis : progress100;
}

-(void)checkWidthBarPossibleWithWidthBar:(CGFloat)width{
    if (_barsMargin >= width) {
        NSLog(@"Margin it's excessive width bar it's %f and margin %d", width, _barsMargin);
        _barsMargin=0;
    }
}

-(UIColor *)getBarColorWithIndex:(int)index{
    return [[_data objectAtIndex:index-1] valueForKey:kHACColor] ? [[_data objectAtIndex:index-1] valueForKey:kHACColor] : [UIColor colorWithHue:drand48() saturation:1.0 brightness:1.0 alpha:1.0];
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
            [pathBar moveToPoint:CGPointMake(positionX,CGRectGetHeight(self.bounds) - marginAxis)];
            [pathBar addLineToPoint:CGPointMake(positionX, CGRectGetHeight(self.bounds) - (progress + marginAxis))];
        }
    }else{
        if (_reverse) {
            ////// VERTICAL RIGTH TO LEFT
            if (_showAxis) {
                [pathBar moveToPoint:CGPointMake(CGRectGetWidth(self.bounds), positionX - marginAxis)];
                [pathBar addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds) - progress, positionX - marginAxis)];
            }else{
                [pathBar moveToPoint:CGPointMake(CGRectGetWidth(self.bounds), positionX - marginAxis)];
                [pathBar addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds) - progress, positionX + marginAxis)];
            }
        }else{
            ////// HORIZONTAL LEFT TO RIGHT
            if (_showAxis) {
                [pathBar moveToPoint:CGPointMake(marginAxis, positionX - marginAxis)];
                [pathBar addLineToPoint:CGPointMake(progress + marginAxis, positionX - marginAxis)];
            }else{
                [pathBar moveToPoint:CGPointMake(marginAxis, positionX - marginAxis)];
                [pathBar addLineToPoint:CGPointMake(progress + marginAxis, positionX - marginAxis)];
            }
        }
    }
    return pathBar;
}

# pragma mark - UILabel Methods

-(CGRect)getFrameLabelWith:(CGFloat)witdthBar index:(int)index progress:(CGFloat)progress{
    if (_showAxis) {
        return _vertical ?
        CGRectMake((witdthBar * index) - witdthBar + marginAxis, progress, witdthBar, _sizeLabelProgress)
        :
        CGRectMake(marginAxis, (witdthBar * index) - witdthBar, _sizeLabelProgress, witdthBar);
    }else{
        return _vertical ?
        CGRectMake((witdthBar * index) - witdthBar, progress, witdthBar, _sizeLabelProgress)
        :
        CGRectMake(0.0, (witdthBar * index) - witdthBar, _sizeLabelProgress, witdthBar);
    }
}

-(NSString*)getTextWithIndex:(int)index realPercent:(int)realPercent value:(CGFloat)value{
    NSString *text;
    if (_showCustomText && [[_data objectAtIndex:index-1]valueForKey:kHACCustomText]) {
        _showDataValue ? (text = [[_data objectAtIndex:index-1]valueForKey:kHACCustomText]) : (text = [NSString stringWithFormat:@"%d%%",realPercent]);
    }else{
        _showDataValue ? (text = [NSString stringWithFormat:@"%.0f",value]) : (text = [NSString stringWithFormat:@"%d%%",realPercent]);
    }
    return text;
}

-(UILabel *) setLabelWithFrame:(CGRect)frame text:(NSString*)text barColor:(UIColor *)barColor{
    UILabel *progressText           = [[UILabel alloc]initWithFrame:frame];
    progressText.text               = text;
    progressText.font               = _progressTextFont;
    progressText.backgroundColor    = [barColor colorWithAlphaComponent:.3];
    _vertical ? (progressText.textAlignment = NSTextAlignmentCenter) : (progressText.textAlignment = NSTextAlignmentCenter);
    progressText.textColor          = _progressTextColor;
    progressText.numberOfLines      = 1;
    progressText.layer.borderWidth  = 1;
    progressText.layer.borderColor  = barColor.CGColor;
    [progressText setMinimumScaleFactor:5.0/[UIFont labelFontSize]];
    progressText.adjustsFontSizeToFitWidth = YES;
    progressText.layer.masksToBounds = YES;
    
    return progressText;
}

-(CABasicAnimation *)setupAnimationLabelWithProgress:(CGFloat)progress{
    CABasicAnimation *animationLabel;
    animationLabel            = [CABasicAnimation animationWithKeyPath: _vertical ? (@"position.y") : (@"position.x")];
    animationLabel.duration   = _animationDuration;
    
    if (_vertical) {
        if (_reverse) {
            ////// VERTICAL TOP TO BOTTOM
            animationLabel.fromValue  = [NSNumber numberWithFloat:_sizeLabelProgress / 2];
            animationLabel.toValue = @(progress+(_sizeLabelProgress/2));
            
        }else{
            ////// VERTICAL BOTTOM TO TOP
            animationLabel.fromValue  = [NSNumber numberWithFloat:(CGRectGetHeight(self.bounds) - _sizeLabelProgress / 2) - marginAxis];
            animationLabel.toValue = @(((CGRectGetHeight(self.bounds) - progress) - _sizeLabelProgress / 2) - marginAxis);
        }
    }else{
        if (_reverse) {
            ////// HORIZONTAL RIGTH TO LEFT
            if (_showAxis) {
                animationLabel.fromValue  = [NSNumber numberWithFloat:CGRectGetWidth(self.bounds)-_sizeLabelProgress / 2];
                animationLabel.toValue = @(CGRectGetWidth(self.bounds) - progress - _sizeLabelProgress / 2);
            }else{
                animationLabel.fromValue  = [NSNumber numberWithFloat:CGRectGetWidth(self.bounds)-_sizeLabelProgress / 2];
                animationLabel.toValue = @(CGRectGetWidth(self.bounds) - progress - _sizeLabelProgress / 2);
            }
        }else{
            ////// HORIZONTAL LEFT TO RIGHT
            if (_showAxis) {
                animationLabel.fromValue  = [NSNumber numberWithFloat:(_sizeLabelProgress + (marginAxis / 2) - 3)];
                animationLabel.toValue = @(progress + _sizeLabelProgress + (marginAxis / 2)/*ÑAPA*/-3/*ÑAPA*/);
            }else{
                animationLabel.fromValue  = [NSNumber numberWithFloat:(_sizeLabelProgress / 2) + marginAxis];
                animationLabel.toValue = @((progress + _sizeLabelProgress / 2) + marginAxis);
            }
        }
    }
    
    animationLabel.removedOnCompletion = NO;
    animationLabel.fillMode = kCAFillModeBoth;
    
    return animationLabel;
}


# pragma mark - Axis Bar


-(void)setupHorizontalAxisX{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(marginAxis/*-1*/, CGRectGetHeight(self.bounds) - marginAxis /*+ 1*/)];
    [path addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) - marginAxis /*+1*/)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [path CGPath];
    shapeLayer.strokeColor = [[UIColor blackColor] CGColor];
    shapeLayer.lineWidth = 1.0;
    shapeLayer.fillColor = [[UIColor clearColor] CGColor];
    
    [self.layer addSublayer:shapeLayer];
}

-(void)setupVerticalAxisY{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(marginAxis /*- 1*/, 0.0)];
    [path addLineToPoint:CGPointMake(marginAxis /*- 1*/, CGRectGetHeight(self.bounds) - marginAxis /*+ 1*/)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [path CGPath];
    shapeLayer.strokeColor = [[UIColor blackColor] CGColor];
    shapeLayer.lineWidth = 1.0;
    shapeLayer.fillColor = [[UIColor clearColor] CGColor];
    
    [self.layer addSublayer:shapeLayer];
}

-(void)setupAxisYNumbers{
    
    int i;
    int j;
    int divider = _numberDividersAxisY;
    
    for (i = 0, j = (divider-1); i < divider; i++, j--) {
        
        if (_vertical) {
            
            // Dot for axis number
            UIBezierPath *path = [UIBezierPath bezierPath];
            [path moveToPoint:CGPointMake(marginAxis - 3, (((CGRectGetHeight(self.bounds)-marginAxis)/(divider-1))) * i)];
            [path addLineToPoint:CGPointMake(marginAxis, (((CGRectGetHeight(self.bounds)-marginAxis)/(divider-1))) * i)];
            
            CAShapeLayer *shapeLayer = [CAShapeLayer layer];
            shapeLayer.path = [path CGPath];
            shapeLayer.strokeColor = [[UIColor blackColor] CGColor];
            shapeLayer.lineWidth = 1.0;
            shapeLayer.fillColor = [[UIColor clearColor] CGColor];
            
            [self.layer addSublayer:shapeLayer];
            if (i != 0 && i!= divider-1) {
                [self drawDashedLineWithPositionY:(((CGRectGetHeight(self.bounds)-marginAxis)/(divider-1))) * i];
            }
            // Label for axis number
            NSString *text;
            
            _reverse ? (text = [NSString stringWithFormat:@"%.0f", fabs(ceil(_axisMaxValue / (divider-1))) * i]) : (text = [NSString stringWithFormat:@"%.0f", fabs(ceil(_axisMaxValue / (divider-1))) * j]);
            
            CGRect frame;
            
            i==(divider-1) ? (frame = CGRectMake(0, CGRectGetHeight(self.bounds)-marginAxis - 15/2, marginAxis - 3, 15)) : (frame = CGRectMake(0, ((CGRectGetHeight(self.bounds)-marginAxis)/(divider-1) * i) - 15 / 2, marginAxis - 3, 15)) ;
            
            UILabel *lbl           = [[UILabel alloc]initWithFrame:frame];
            
            
            if (divider-1==i && _reverse) {
                lbl.text = [NSString stringWithFormat:@"%d",[self getMaxValue]];
            }
            else if (0==i && !_reverse){
                lbl.text = [NSString stringWithFormat:@"%d",[self getMaxValue]];
            }
            else{
                lbl.text = text;
            }
            
            lbl.font               = _progressTextFont;
            lbl.backgroundColor    = [UIColor clearColor];
            lbl.textAlignment      = NSTextAlignmentCenter;
            lbl.textColor          = _axisYTextColor;
            lbl.numberOfLines      = 1;
            [lbl setMinimumScaleFactor:5.0/[UIFont labelFontSize]];
            lbl.adjustsFontSizeToFitWidth = YES;
            
            [self addSubview:lbl];
            
        }
        else{
            
            // Dot for axis number
            UIBezierPath *path = [UIBezierPath bezierPath];
            [path moveToPoint:CGPointMake(((((CGRectGetWidth(self.bounds)-marginAxis)/(divider-1))) * i)+marginAxis, CGRectGetHeight(self.bounds) - (marginAxis-1 ))];
            [path addLineToPoint:CGPointMake(((((CGRectGetWidth(self.bounds)-marginAxis)/(divider-1))) * i)+marginAxis, CGRectGetHeight(self.bounds) - (marginAxis-5))];
            
            CAShapeLayer *shapeLayer = [CAShapeLayer layer];
            shapeLayer.path = [path CGPath];
            shapeLayer.strokeColor = [[UIColor blackColor] CGColor];
            shapeLayer.lineWidth = 1.0;
            shapeLayer.fillColor = [[UIColor clearColor] CGColor];
            
            [self.layer addSublayer:shapeLayer];
            if (i != 0 && i!= divider-1) {
                [self drawDashedLineWithPositionX:((((CGRectGetWidth(self.bounds)-marginAxis)/(divider-1))) * i)+marginAxis];
            }
            // Label for axis number
            NSString *text;
            
            !_reverse ? (text = [NSString stringWithFormat:@"%.0f", fabs(ceil(_axisMaxValue / (divider-1))) * i]) : (text = [NSString stringWithFormat:@"%.0f", fabs(ceil(_axisMaxValue / (divider-1))) * j]);
            
            CGRect frame;
            
            i==(divider-1) ?
            (frame =  CGRectMake(((((CGRectGetWidth(self.bounds)-marginAxis)/(divider-1))) * i)+marginAxis/4, CGRectGetHeight(self.bounds) - (marginAxis-1 )+5, marginAxis - 3, 15))
            :
            (frame = CGRectMake(((((CGRectGetWidth(self.bounds)-marginAxis)/(divider-1))) * i)+marginAxis/2, CGRectGetHeight(self.bounds) - (marginAxis-1 )+5, marginAxis - 3, 15));
            
            UILabel *lbl           = [[UILabel alloc]initWithFrame:frame];
            
            if (0==i && _reverse) {
                lbl.text = [NSString stringWithFormat:@"%d",[self getMaxValue]];
            }
            else if (divider-1==i && !_reverse){
                lbl.text = [NSString stringWithFormat:@"%d",[self getMaxValue]];
            }
            else{
                lbl.text = text;
            }
            
            lbl.font               = _progressTextFont;
            lbl.backgroundColor    = [UIColor clearColor];
            lbl.textAlignment      = NSTextAlignmentCenter;
            lbl.textColor          = _axisYTextColor;
            lbl.numberOfLines      = 1;
            [lbl setMinimumScaleFactor:5.0/[UIFont labelFontSize]];
            lbl.adjustsFontSizeToFitWidth = YES;
            
            [self addSubview:lbl];
            
        }
    }
}

-(void)drawDashedLineWithPositionX:(CGFloat)positionX{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
    [shapeLayer setStrokeColor:[[UIColor colorWithRed:0.26 green:0.26 blue:0.26 alpha:.5] CGColor]];
    [shapeLayer setLineWidth:1.0f];
    shapeLayer.zPosition = 1.0f;
    [shapeLayer setLineJoin:kCALineJoinRound];
    [shapeLayer setLineDashPattern: [NSArray arrayWithObjects:[NSNumber numberWithInt:3], [NSNumber numberWithInt:3],nil]];
    
    // Setup the path
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, positionX, CGRectGetHeight(self.bounds) - marginAxis);
    CGPathAddLineToPoint(path, NULL, positionX, 0);
    
    [shapeLayer setPath:path];
    CGPathRelease(path);
    
    [[self layer] addSublayer:shapeLayer];
}
-(void)drawDashedLineWithPositionY:(CGFloat)positionY{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
    [shapeLayer setStrokeColor:[[UIColor colorWithRed:0.26 green:0.26 blue:0.26 alpha:.5] CGColor]];
    [shapeLayer setLineWidth:1.0f];
    shapeLayer.zPosition = 1.0f;
    [shapeLayer setLineJoin:kCALineJoinRound];
    [shapeLayer setLineDashPattern: [NSArray arrayWithObjects:[NSNumber numberWithInt:3], [NSNumber numberWithInt:3],nil]];
    
    // Setup the path
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, marginAxis, positionY);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(self.bounds), positionY);
    
    [shapeLayer setPath:path];
    CGPathRelease(path);
    
    [[self layer] addSublayer:shapeLayer];
}

# pragma mark - Construct Chart

-(void)createChart{
    
    // Máximo valor posible de los datos obtenidos (Valor mas alto)
    int maxVal = [self getMaxValue];
    
    if (_showAxis) {
        marginAxis = constantMarginAxis;
        [self setupHorizontalAxisX];
        [self setupVerticalAxisY];
        [self setupAxisYNumbers];
    }else {
        marginAxis = 0.0;
    }
    
    // Ancho de cada linea, arreglo al ancho de la vista
    CGFloat widthLine = [self getWitdOfLine];
    
    // Progreso máximo posible de la barra, dependiendo de la orientación elegida, se auto ajustará
    CGFloat progress100 = [self getMaxiumProgressWithAxisAndLastMaxiumProgress:[self getMaxiumProgress]];
    
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
        
        _showProgressLabel ? (progress -= _sizeLabelProgress) : progress;
        
        BOOL minusProgres=NO;
        
        if (progress<0 && _showProgressLabel==YES) {
            (progress += _sizeLabelProgress);
            _showProgressLabel=NO;
            minusProgres=YES;
        }
        
        // Posicion X de cada línea (separación entre ellas)
        CGFloat positionX = _showAxis ? ((widthLine * (i - 1)) + (widthLine / 2) + marginAxis) : ((widthLine * (i - 1)) + (widthLine / 2));
        
        UIColor*barColor = [self getBarColorWithIndex:i];
        
        HACBarLayer *bLayer = [[HACBarLayer alloc]initWithStrokeWidth:widthLine
                                                          strokeColor:barColor
                                                            fillColor:[UIColor clearColor]
                                                            fromValue:0.0
                                                              toValue:1.0
                                                               margin:_barsMargin
                                                    durationAnimation:_animationDuration];
        
        // Insert layer
        [self.layer insertSublayer:bLayer above:self.layer];
        
        // Camino a seguir de la barra
        UIBezierPath *pathBar = [self pathForBarWithXPosition:positionX progress:progress];
        
        bLayer.path = pathBar.CGPath;
        
        ////// LABEL
        // CreaTe Laber progress
        UILabel *progressText = [self setLabelWithFrame:[self getFrameLabelWith:widthLine index:i progress:progress]
                                                   text:[self getTextWithIndex:i realPercent:realPercent value:value]
                                               barColor:barColor];
        
        // Show progress ?
        _showProgressLabel ? [self addSubview:progressText] : _showProgressLabel;
        
        // Setup animation Label from orientation
        CABasicAnimation *animationLabel = [self setupAnimationLabelWithProgress:progress];
        
        _vertical ? [[progressText layer] addAnimation:animationLabel forKey:@"y"] : [[progressText layer] addAnimation:animationLabel forKey:@"x"];
        
        if (minusProgres==YES) {
            _showProgressLabel=YES;
        }
        
    }
}

@end
