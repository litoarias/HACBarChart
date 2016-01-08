# [![Logo](https://github.com/litoarias/HACBarChart/blob/master/logo.png)](#)
<img src="https://img.shields.io/twitter/url/https/github.com/litoarias/HACBarChart.svg?style=social"><br>
<img src="https://img.shields.io/github/issues/litoarias/HACBarChart.svg?style=flat-square">
<img src="https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square">
<img src="https://img.shields.io/cocoapods/v/HACBarChart.svg?style=flat-square">
<img src="https://img.shields.io/npm/dm/HACBarChart.svg?style=flat-square">

Simple and dynamic bar graph, very easy setup and operation.

![Preview](https://github.com/litoarias/HACBarChart/blob/master/hacbarchart.gif)

![Preview](https://github.com/litoarias/HACBarChart/blob/master/Simulator%20Screen%20Shot%208%20ene%202016%2011.19.07.png)
![Preview](https://github.com/litoarias/HACBarChart/blob/master/Simulator%20Screen%20Shot%208%20ene%202016%2011.19.09.png)
![Preview](https://github.com/litoarias/HACBarChart/blob/master/Simulator%20Screen%20Shot%208%20ene%202016%2011.19.12.png)
![Preview](https://github.com/litoarias/HACBarChart/blob/master/Simulator%20Screen%20Shot%208%20ene%202016%2011.19.18.png)
![Preview](https://github.com/litoarias/HACBarChart/blob/master/Simulator%20Screen%20Shot%208%20ene%202016%2011.20.02.png)
![Preview](https://github.com/litoarias/HACBarChart/blob/master/Simulator%20Screen%20Shot%208%20ene%202016%2011.20.57.png)
![Preview](https://github.com/litoarias/HACBarChart/blob/master/Simulator%20Screen%20Shot%208%20ene%202016%2011.21.05.png)
![Preview](https://github.com/litoarias/HACBarChart/blob/master/Simulator%20Screen%20Shot%208%20ene%202016%2011.21.15.png)

##Requirements and Dependencies
- iOS >= 6.0
- ARC enabled

##Installation

####CocoaPods:
#####Building
    pod 'HACBarChart'

####Manual install:
- Copy `HACBarChart.h` `HACBarChart.m` `HACBarLayer.h` and `HACBarLayer.m`  to your project
- Manual install [HACBarChart](https://github.com/litoarias/HACBarChart/#manual-install)

##Usage

To make it graphically xib or storyboard, add a UIView and assign a subclass of `HACBarChart`.
Allocate the required constraints should be necessary and appropriate measures according to our needs.
The next step would be a sight IBOutlet to assign attributes and data.
Once these steps, we pass the data we want to paint in the graph, it is an `NSArray` of `NSDictionary`, and the keys they should be as in the example I show below.
The keys `kHACColor` and `kHACCustomText` is optional but `kHACPercentage` is required.

```objective-c

#import "HACBarChart.h"

@interface ViewController (){
    NSArray *data;
}

@property (weak, nonatomic) IBOutlet HACBarChart *chart;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    data = @[
             @{kHACPercentage:@1000, kHACColor  : [UIColor colorWithRed:0.000f green:0.620f blue:0.890f alpha:1.0f], kHACCustomText : @"January"},
             @{kHACPercentage:@875,  kHACColor  : [UIColor colorWithRed:0.431f green:0.000f blue:0.533f alpha:1.0f], kHACCustomText : @"February"},
             @{kHACPercentage:@875,  kHACColor  : [UIColor colorWithRed:0.922f green:0.000f blue:0.000f alpha:1.0f], kHACCustomText : @"March"},
             @{kHACPercentage:@875,  kHACColor  : [UIColor colorWithRed:0.000f green:0.671f blue:0.180f alpha:1.0f], kHACCustomText : @"April"},
             @{kHACPercentage:@750,  kHACColor  : [UIColor colorWithRed:1.000f green:0.000f blue:0.851f alpha:1.0f], kHACCustomText : @"May"},
             @{kHACPercentage:@750,  kHACColor  : [UIColor colorWithRed:1.000f green:0.808f blue:0.000f alpha:1.0f], kHACCustomText : @"June"},
             @{kHACPercentage:@625,  kHACColor  : [UIColor colorWithRed:0.294f green:0.843f blue:0.251f alpha:1.0f], kHACCustomText : @"July"},
             @{kHACPercentage:@500,  kHACColor  : [UIColor colorWithRed:1.000f green:0.404f blue:0.000f alpha:1.0f], kHACCustomText : @"August"},
             @{kHACPercentage:@500,  kHACColor  : [UIColor colorWithRed:0.282f green:0.631f blue:0.620f alpha:1.0f], kHACCustomText : @"September"},
             @{kHACPercentage:@375,  kHACColor  : [UIColor colorWithRed:0.776f green:0.000f blue:0.702f alpha:1.0f], kHACCustomText : @"October"},
             @{kHACPercentage:@250,  kHACColor  : [UIColor colorWithRed:0.282f green:0.631f blue:0.620f alpha:1.0f], kHACCustomText : @"November"},
             @{kHACPercentage:@125,  kHACColor  : [UIColor colorWithRed:0.776f green:0.000f blue:0.702f alpha:1.0f], kHACCustomText : @"December"}
             ];
             
    // Assign data   
    _chart.data = data;
}
```
For draw the chart, after assign the data is necessary doing in the method `viewDidAppear`, as in the following example
```objective-c

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [_chart draw];
}
```

##Customize

```objective-c

    ////// CHART CUSTOMIZE
    _chart.showAxis                 = YES;   // Show axis line
    _chart.showProgressLabel        = YES;   // Show text for bar
    _chart.vertical                 = YES;   // Orientation chart
    _chart.reverse                  = YES;   // Orientation chart
    _chart.showDataValue            = YES;   // Show value contains _data, or real percent value
    _chart.showCustomText           = YES;   // Show custom text, in _data with key kHACCustomText
    _chart.barsMargin               = 0;     // Margin between bars
    _chart.sizeLabelProgress        = 25;    // Width of label progress text
    _chart.numberDividersAxisY      = 8;
//    _chart.axisMaxValue             = 1500;    // If no define maxValue, get maxium of _data
    _chart.progressTextColor        = [UIColor darkGrayColor];
    _chart.axisYTextColor           = [UIColor grayColor];
    _chart.progressTextFont         = [UIFont fontWithName:@"DINCondensed-Bold" size:8];

```

Enjoy :D

## Contributing

1. Fork it ( https://github.com/[my-github-username]/HACBarChart/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
