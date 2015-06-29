//
//  AddViewController.h
//  CountOnMe
//
//  Created by Pooja Kathail on 6/29/15.
//  Copyright (c) 2015 Pooja Kathail. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AddViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
@property (strong, nonatomic) NSArray *zeroThroughNine;
@property (strong, nonatomic) NSString *titleForRow;
@property (weak, nonatomic) IBOutlet UIPickerView *addSubtractPickerView;
@end
