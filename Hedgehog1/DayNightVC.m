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
}

// DayNightSettingsDelegate method
- (void) updateDayNightSetting: (DayNightSet)setting{
    self.dayNightMode = setting;
    
    if (setting == DAY) {
        NSLog(@"I know it's day");
    }
    
    else  {
        NSLog(@"I know it's night");
    }

}

// DayNightSettingsDelegate method
- (void) closeSettingsPanel{
    return;
    
}

@end
