//
//  GameViewController.h
//  CountOnMe
//
//  Created by Pooja Kathail on 6/29/15.
//  Copyright (c) 2015 Pooja Kathail. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface GameViewController : UIViewController
{
    NSTimer *timer;
    int count;
    float speed;
    UILabel *numberLabel;
    IBOutlet UISwitch *vibrate;
    IBOutlet UISegmentedControl *timing;
}
@property (nonatomic, retain)IBOutlet UILabel *numberLabel;
@property (nonatomic, retain)IBOutlet UILabel *bpmLabel;
@property (nonatomic) float bpm;
@property (nonatomic, retain)IBOutlet UISegmentedControl *timing;
@property (nonatomic,weak) UISlider *slider;
@property (nonatomic) IBOutlet UILabel *currentLetter;
@property (nonatomic) IBOutlet UILabel *currentOperation;
@property (nonatomic) int currentLetterIndex;
@property (nonatomic) NSArray *patternArray;
@property (nonatomic) int currentNumber;

//- (instancetype) initWithArray:(NSArray *)pattern sender:(id)sender;
@end
