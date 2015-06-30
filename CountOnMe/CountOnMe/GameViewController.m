//
//  GameViewController.m
//  CountOnMe
//
//  Created by Pooja Kathail on 6/29/15.
//  Copyright (c) 2015 Pooja Kathail. All rights reserved.
//

#import "GameViewController.h"
#import "PatternViewController.h"
#import "AddViewController.h"
#import "MultiplyViewController.h"

@interface GameViewController ()
@property (nonatomic, strong) NSTimer *timer;
@property (strong, nonatomic) AVSpeechSynthesizer *synthesizer;
@end

@implementation GameViewController


//- (instancetype)initWithArray:(NSArray *)array sender:(id)sender
//{
//    self = [super init];
//    if(self) {
//        NSLog(@"%@", sender);
//    }
//    return self;
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.currentOperation.text = @"";
    if([self.presentingViewController isKindOfClass:[AddViewController class]]) {
        self.currentLetterIndex = 1;
        self.currentLetter.text = self.patternArray[self.currentLetterIndex];
        self.currentNumber = [self.patternArray[self.currentLetterIndex] intValue];
        self.startNumber = self.currentNumber;
        NSArray *newArray = @[[self.patternArray[2] stringByAppendingString:self.patternArray[3]], [self.patternArray[4] stringByAppendingString:self.patternArray[5]]];
        self.patternArray = newArray;
        self.currentLetterIndex = 0;
    } else if([self.presentingViewController isKindOfClass:[MultiplyViewController class]]) {
        self.currentLetterIndex = 0;
        self.currentLetter.text = self.patternArray[self.currentLetterIndex];
        self.currentNumber = [self.patternArray[self.currentLetterIndex] intValue];
        self.startNumber = self.currentNumber;
        NSArray *newArray = @[[self.patternArray[1] stringByAppendingString:self.patternArray[2]], [self.patternArray[3] stringByAppendingString:self.patternArray[4]]];
        self.patternArray = newArray;
        self.currentLetterIndex = 0;
    } else if([self.presentingViewController isKindOfClass:[PatternViewController class]]) {
        self.currentLetterIndex = 0;
        self.currentLetter.text = self.patternArray[self.currentLetterIndex];
        self.synthesizer = [[AVSpeechSynthesizer alloc] init];
        AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:self.currentLetter.text];
        [self.synthesizer speakUtterance:utterance];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self loopThroughPattern];
}
- (void)loopThroughPattern
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                  target:self
                                                selector:@selector(timerFired:) userInfo:nil
                                                 repeats:YES];
}

- (void)removeFromSuperview
{
    [self.timer invalidate];
    self.timer = nil;
    
}

- (void)timerFired:(NSTimer *)timer
{
    if([self.presentingViewController isKindOfClass:[AddViewController class]]) {
        self.currentOperation.text = self.patternArray[self.currentLetterIndex];
        self.currentNumber = [self.patternArray[self.currentLetterIndex] intValue] + self.currentNumber;
        self.currentLetter.text = [[NSNumber  numberWithInt:self.currentNumber] stringValue];
        self.currentLetterIndex = (self.currentLetterIndex + 1)%self.patternArray.count;
    } else if([self.presentingViewController isKindOfClass:[MultiplyViewController class]]) {
        self.currentOperation.text = self.patternArray[self.currentLetterIndex];
        if([self.currentOperation.text characterAtIndex:0] == 'x')
        {
            
            self.currentNumber = self.currentNumber * [[NSString stringWithFormat:@"%c", [self.patternArray[self.currentLetterIndex] characterAtIndex:1]] intValue];
        } else if([self.currentOperation.text characterAtIndex:0] == '/')
        {
            self.currentNumber = self.currentNumber / [[NSString stringWithFormat:@"%c", [self.patternArray[self.currentLetterIndex] characterAtIndex:1]] intValue];
        }
        self.currentLetter.text = [[NSNumber  numberWithInt:self.currentNumber] stringValue];
        self.currentLetterIndex = (self.currentLetterIndex + 1)%self.patternArray.count;
        
    } else if([self.presentingViewController isKindOfClass:[PatternViewController class]]) {
        self.currentLetterIndex = (self.currentLetterIndex +1)%self.patternArray.count;
        self.currentLetter.text = self.patternArray[self.currentLetterIndex];
        AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:self.currentLetter.text];
        [self.synthesizer speakUtterance:utterance];
    }
    [self.currentLetter setNeedsDisplay];
}


- (IBAction)resetButtonPressed:(id)sender
{
    self.currentLetterIndex = 0;
    self.currentNumber = self.startNumber;
    self.currentOperation.text = @"";
    self.currentLetter.text = [[NSNumber numberWithInt:self.currentNumber] stringValue];
    [self.timer invalidate];
    self.timer = nil;
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:self.currentLetter.text];
    [self.synthesizer speakUtterance:utterance];
    [self loopThroughPattern];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"goHome"]) {
        [self removeFromSuperview];
    }
}


@end
