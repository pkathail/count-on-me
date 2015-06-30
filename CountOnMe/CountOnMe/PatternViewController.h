//
//  PatternViewController.h
//  CountOnMe
//
//  Created by Pooja Kathail on 6/29/15.
//  Copyright (c) 2015 Pooja Kathail. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatternViewController : UIViewController<UITextFieldDelegate>

@property (strong,nonatomic) IBOutlet UITextField *patternTextField;
@property (strong, nonatomic) NSString *patternTextFieldString;
@property (strong, nonatomic) UISlider  *metronomeSlider;
@property (strong, nonatomic) UIAlertController *uiAlert;



@end
