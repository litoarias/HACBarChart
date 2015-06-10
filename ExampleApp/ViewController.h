//
//  ViewController.h
//  Chart
//
//  Created by Hipolito Arias on 1/6/15.
//  Copyright (c) 2015 Hipolito Arias. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HACBarChart.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet HACBarChart *chart;
@property (weak, nonatomic) IBOutlet UILabel *lblSlide;

- (IBAction)slideAction:(id)sender;
- (IBAction)tapClear:(id)sender;
- (IBAction)tapSetData:(id)sender;
- (IBAction)tapRealValue:(id)sender;
- (IBAction)tapShowProgress:(id)sender;
- (IBAction)tapReverse:(id)sender;
- (IBAction)tapVertical:(id)sender;
- (IBAction)showAxis:(id)sender;

@end

