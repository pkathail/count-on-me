//
//  MultiplyViewController.h
//  CountOnMe
//
//  Created by Pooja Kathail on 6/29/15.
//  Copyright (c) 2015 Pooja Kathail. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameViewController.h"

@interface MultiplyViewController : UIViewController <UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic) NSMutableString *pattern;
@property (nonatomic) GameViewController *gvc;

@end
