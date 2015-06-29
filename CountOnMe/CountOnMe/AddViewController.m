//
//  AddViewController.m
//  CountOnMe
//
//  Created by Pooja Kathail on 6/29/15.
//  Copyright (c) 2015 Pooja Kathail. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController
//--------------------------------------Methods for UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    for (int component = 0; component < 3; component++) {
        for (int row = 0; row < self.zeroThroughNine.count; row++) {
            self.titleForRow = [self.zeroThroughNine objectAtIndex:row];
        }
    }
    return self.titleForRow;
}

//-------------------------------------Methods for UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 9;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.zeroThroughNine = [[NSMutableArray alloc] initWithObjects: @"0",@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", nil];
    self.titleForRow = [[NSString alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
