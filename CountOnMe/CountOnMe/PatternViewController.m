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
    self.patternTextField.delegate = self;
    self.uiAlert = [UIAlertController alertControllerWithTitle:@"Uh oh we have a problem :'(" message:@"Please enter a pattern that contains 6 characters or less" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    int patternCount = [self.patternTextField.text length];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    if(patternCount > 6){
        [self.uiAlert addAction:defaultAction];
        [self presentViewController:self.uiAlert animated:YES completion:nil];
    }
    
    else{
        [self.patternTextField resignFirstResponder];
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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSMutableArray *a = [[NSMutableArray alloc]init];
    
    for(int i = 0; i < [self.patternTextFieldString length]; i++)
    {
        NSString *s = [NSString stringWithFormat:@"%c",[self.patternTextFieldString characterAtIndex:i]];
        [a addObject:s];
    }
    
    UIViewController *destVC = segue.destinationViewController;
    if([destVC isKindOfClass:[GameViewController class]]) {
        GameViewController *gamevc = (GameViewController *)destVC;
        gamevc.patternArray = a;
        NSLog(@"String: %@", self.patternTextFieldString);
    }
    
    

}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *) identifier sender:(id)sender{
    if([self.patternTextField.text isEqualToString:@""]){
        return NO;
    }
    
    if ([identifier isEqualToString:@"playPattern"] && [self.patternTextField.text length] > 6) {
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
        
        [self.uiAlert addAction:defaultAction];
        [self presentViewController:self.uiAlert animated:YES completion:nil];
        
        return NO;
        
    }
    else{
        self.patternTextFieldString = self.patternTextField.text;
        
        return YES;
    }
}


@end
