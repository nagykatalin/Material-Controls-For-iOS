// The MIT License (MIT)
//
// Copyright (c) 2015 FPT Software
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "TimePickerDialogViewController.h"

#import <MaterialControls/NSDate+MDExtension.h>
#import <MaterialControls/MDTimePickerDialog.h>

@interface TimePickerDialogViewController () <MDTimePickerDialogDelegate>
@property(weak, nonatomic) IBOutlet UITextField *txtTimerStart;
@property(weak, nonatomic) IBOutlet UIButton *btnStartTime;
@property(weak, nonatomic) IBOutlet UISwitch *lightThemeSwitch;
@property(nonatomic) NSDateFormatter *dateFormatter;
@end

@implementation TimePickerDialogViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  self.title = @"MDTimePickerDialog";
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)btnSelectTime:(id)sender {
  MDTimePickerDialog *timePicker = [[MDTimePickerDialog alloc] init];
  if (self.lightThemeSwitch.on) {
    timePicker.theme = MDTimePickerThemeLight;
  } else {
    timePicker.theme = MDTimePickerThemeDark;
  }
  timePicker.delegate = self;
  [timePicker show];
}

- (void)timePickerDialog:(MDTimePickerDialog *)timePickerDialog
           didSelectHour:(NSInteger)hour
               andMinute:(NSInteger)minute {
  _timeTextField.text = [NSString stringWithFormat:@"%.2li:%.2li", (long)hour, (long)minute];
}
@end
