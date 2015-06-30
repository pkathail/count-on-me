//
//  MultiplyViewController.m
//  CountOnMe
//
//  Created by Pooja Kathail on 6/29/15.
//  Copyright (c) 2015 Pooja Kathail. All rights reserved.
//

#import "MultiplyViewController.h"
#import "GameViewController.h"

@interface MultiplyViewController ()
@property (nonatomic) NSArray *numbers;
@property (nonatomic) NSArray *mulDiv;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@end

@implementation MultiplyViewController


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 6;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component % 2 != 0)
    {
        return self.numbers.count;
    }
    else
    {
        return self.mulDiv.count;
    }
    
    
}
//- (IBAction)play:(id)sender {
//    for(int i = 0; i < 6; i ++)
//    {
//        if(i % 2 != 0)
//        {
//            [self.pattern appendString:[self.numbers objectAtIndex:[self.pickerView selectedRowInComponent:i]]];
//        }
//        else
//        {
//            [self.pattern appendString:[self.mulDiv objectAtIndex:[self.pickerView selectedRowInComponent:i]]];
//        }
//    }
//    
//    NSString *pat = self.pattern;
//    NSMutableArray *a = [[NSMutableArray alloc] init];
//    for(int i = 0; i < pat.length; i++)
//    {
//        NSString *s = [NSString stringWithFormat:@"%c",[self.pattern characterAtIndex:i]];
//        [a addObject:s];
//    }
//    self.gvc.patternArray = a;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.numbers = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    self.mulDiv = @[@"x",@"/"];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    self.pattern = [[NSMutableString alloc] initWithString:@""];
    self.slider.maximumValue = 250;
    self.slider.minimumValue = 60;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component % 2 != 0)
    {
        return self.numbers[row];
    }
    else
    {
        return self.mulDiv[row];
    }
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"playMultiply"])
    {
        for(int i = 0; i < 5; i ++)
        {
            if(i % 2 != 0)
            {
                [self.pattern appendString:[self.numbers objectAtIndex:[self.pickerView selectedRowInComponent:i]]];
            }
            else
            {
                [self.pattern appendString:[self.mulDiv objectAtIndex:[self.pickerView selectedRowInComponent:i]]];
            }
        }
        NSString *pat = self.pattern;
        NSMutableArray *a = [[NSMutableArray alloc] init];
        for(int i = 0; i < pat.length; i++)
        {
            NSString *s = [NSString stringWithFormat:@"%c",[self.pattern characterAtIndex:i]];
            [a addObject:s];
        }
        self.gvc.patternArray = a;
        UIViewController *destVC = segue.destinationViewController;
        if([destVC isKindOfClass:[GameViewController class]]) {
            GameViewController *gamevc = (GameViewController *)destVC;
            gamevc.patternArray = a;
            gamevc.bpm = self.slider.value;
            
        }
    }
    
}


@end
