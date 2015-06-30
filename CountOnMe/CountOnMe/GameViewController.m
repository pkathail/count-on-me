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
    //self.patternArray = @[@"a", @"b", @"c"];
    self.currentLetterIndex = 0;
    self.currentLetter.text = self.patternArray[self.currentLetterIndex];
    self.synthesizer = [[AVSpeechSynthesizer alloc] init];
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:self.currentLetter.text];
    [self.synthesizer speakUtterance:utterance];
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
    self.currentLetterIndex = (self.currentLetterIndex +1)%self.patternArray.count;
    self.currentLetter.text = self.patternArray[self.currentLetterIndex];
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:self.currentLetter.text];
    [self.synthesizer speakUtterance:utterance];
    [self.currentLetter setNeedsDisplay];
}


- (IBAction)resetButtonPressed:(id)sender
{
    self.currentLetterIndex = 0;
    self.currentLetter.text = self.patternArray[self.currentLetterIndex];
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
