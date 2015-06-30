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
@property (nonatomic) IBOutlet UILabel *currentLetter;
@property (nonatomic) int currentLetterIndex;
@property (nonatomic) NSArray *patternArray;
//- (instancetype) initWithArray:(NSArray *)pattern sender:(id)sender;
@end
