//
//  AddViewController.m
//  CountOnMe
//
//  Created by Pooja Kathail on 6/29/15.
//  Copyright (c) 2015 Pooja Kathail. All rights reserved.
//

#import "AddViewController.h"
#import "GameViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController
//--------------------------------------Methods for UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component % 2 == 0) {
        return self.zeroThroughNine[row];
    } else {
        return self.operators[row];
    }
}

//-------------------------------------Methods for UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 5;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component % 2 == 0) {
        return self.zeroThroughNine.count;
    } else
        return 2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pattern = [[NSString alloc] initWithFormat:@""];
    self.addSubtractPickerView.delegate = self;
    self.addSubtractPickerView.dataSource = self;
    self.zeroThroughNine = [[NSMutableArray alloc] initWithObjects: @"0",@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", nil];
    self.titleForRow = [[NSString alloc] init];
    self.operators = [[NSMutableArray alloc] initWithObjects: @"+", @"-", nil];
    self.splitItSequence = [[NSMutableArray alloc] init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"PlayAdd"]) {
        for (int count = 0; count < 5; count++) {
            [self.addSubtractPickerView selectedRowInComponent:count];
            NSInteger index = [self.addSubtractPickerView selectedRowInComponent:count];
            
            if (count % 2 == 0) {
                NSString *appendedString = [[NSString alloc]initWithFormat: @",%@" ,[self.zeroThroughNine objectAtIndex:index]];
                self.pattern = [self.pattern stringByAppendingString:appendedString];
            } else {
                NSString *appendedString = [[NSString alloc]initWithFormat: @",%@" ,[self.operators objectAtIndex:index]];
                self.pattern = [self.pattern stringByAppendingString:appendedString];
            }
        }
    
    } self.splitItSequence = [self.pattern componentsSeparatedByString:@","];
    self.gvc.patternArray = self.splitItSequence;
//    for (int i = 0; i < self.splitItSequence.count; i++) {
//    
//        NSLog(@"Individual elements in the pattern:  %@", [self.splitItSequence objectAtIndex:i]);
//    }
    UIViewController *destVC = segue.destinationViewController;
    if([destVC isKindOfClass:[GameViewController class]]) {
        GameViewController *gamevc = (GameViewController *)destVC;
        gamevc.patternArray = self.splitItSequence;
        
    }
    
}
//*/

@end
