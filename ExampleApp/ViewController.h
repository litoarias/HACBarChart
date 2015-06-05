//
//  ViewController.h
//  Chart
//
//  Created by Hipolito Arias on 1/6/15.
//  Copyright (c) 2015 Hipolito Arias. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HACLineChart.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet HACLineChart *chart;

- (IBAction)tapClear:(id)sender;
- (IBAction)tapSetData:(id)sender;
- (IBAction)tapRealValue:(id)sender;
- (IBAction)tapShowProgress:(id)sender;
- (IBAction)tapReverse:(id)sender;
- (IBAction)tapVertical:(id)sender;

@end

