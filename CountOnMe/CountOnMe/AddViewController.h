//
//  AddViewController.h
//  CountOnMe
//
//  Created by Pooja Kathail on 6/29/15.
//  Copyright (c) 2015 Pooja Kathail. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GameViewController;

@interface AddViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
@property (strong, nonatomic) NSMutableArray *zeroThroughNine;
@property (strong, nonatomic) NSString *titleForRow;
@property (weak, nonatomic) IBOutlet UIPickerView *addSubtractPickerView;
@property (strong, nonatomic) NSMutableArray *operators;
@property (strong, nonatomic) NSString *pattern;
@property (strong, nonatomic) GameViewController *gvc;
@property (strong, nonatomic) NSArray *splitItSequence;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end
