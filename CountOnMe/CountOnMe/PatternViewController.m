//
//  PatternViewController.m
//  CountOnMe
//
//  Created by Pooja Kathail on 6/29/15.
//  Copyright (c) 2015 Pooja Kathail. All rights reserved.
//

#import "PatternViewController.h"
#import "GameViewController.h"

@interface PatternViewController ()

@end

@implementation PatternViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    int patternCount = [self.patternTextField.text length];
    if(patternCount > 6){
        
    }
    self.patternTextFieldString = self.patternTextField.text;
    return YES;
    
}

-(BOOL)textFieldShouldClear:(UITextField *)textField{
    
    return YES;
    
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    return YES;
    
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}
@end
