//
//  DayNight.m
//  Hedgehog1
//
//  Created by Garces, Johann (TEKsystems) on 1/7/16.
//  Copyright © 2016 jmg. All rights reserved.
//

#import "DayNightVC.h"

@interface DayNightVC ()

@end

@implementation DayNightVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dayNightMode = NIGHT;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)optionsButtonTouched:(UIButton *)sender forEvent:(UIEvent *)event {
    //open setting view
    self.dayNightSettingsView = [[DayNightSettings alloc] initWithNibName:@"DayNightSettings" bundle:nil];
    [self.dayNightSettingsView setDelegate:self ];
    [self presentViewController:self.dayNightSettingsView animated:YES completion:^{}];
    [self.dayNightSettingsView setDayNightSetting:self.dayNightMode];
}

// DayNightSettingsDelegate method
- (void) updateDayNightSetting: (DayNightSet)setting{
    self.dayNightMode = setting;
    
    if (setting == DAY) {
        self.dayNightMode = DAY;
        self.view.backgroundColor = [UIColor colorWithRed:1.00 green:1.00 blue:1.00 alpha:1.00];
        self.dayNightLabel.text = @"It's Day!";
        
        UIImage *sleepingHedgehogImg = [UIImage imageNamed:@"hedgehogSleeping.jpeg"];
        self.dayNightImg.image = sleepingHedgehogImg;
    }
    
    else  {
        self.dayNightMode = NIGHT;
        self.view.backgroundColor = [UIColor colorWithRed:0.00 green:0.00 blue:0.00 alpha:1.00];
        self.dayNightLabel.text = @"It's Night!";
        
        UIImage *moonImage = [UIImage imageNamed:@"moon.jpeg"];
        self.dayNightImg.image = moonImage;
        
        
    }
    
}

// DayNightSettingsDelegate method
- (void) closeSettingsPanel{
    [self dismissViewControllerAnimated:YES completion:^{}];
    
}

@end
