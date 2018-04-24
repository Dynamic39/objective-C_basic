//
//  UIPickerVC.h
//  ViewSample
//
//  Created by Samuel K on 2018. 4. 16..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ViewController.h"

@interface UIPickerVC : ViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *pickerLabel;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@end
