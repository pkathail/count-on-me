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
    self.patternArray = @[@"A", @"B", @"C"];
    self.currentLetterIndex = 0;
    self.currentLetter.text = self.patternArray[self.currentLetterIndex];
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
    [self.currentLetter removeFromSuperview];
}

- (void)timerFired:(NSTimer *)timer
{
    self.currentLetterIndex = (self.currentLetterIndex +1)%self.patternArray.count;
    self.currentLetter.text = self.patternArray[self.currentLetterIndex];
    [self.currentLetter setNeedsDisplay];
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
