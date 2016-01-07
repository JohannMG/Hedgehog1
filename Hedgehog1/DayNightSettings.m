//
//  DayNightSettings.m
//  Hedgehog1
//
//  Created by Garces, Johann (TEKsystems) on 1/7/16.
//  Copyright © 2016 jmg. All rights reserved.
//

#import "DayNightSettings.h"

@interface DayNightSettings ()

@end

@implementation DayNightSettings

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setDayNightSetting:(DayNightSet)setting{
    
    if (setting == NIGHT){
        self.nightDayControl.selectedSegmentIndex = 0;
    }
    else {
        self.nightDayControl.selectedSegmentIndex = 1;
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(DayNightSet)getDayNightSettingFromUI{
    
    switch ( self.nightDayControl.selectedSegmentIndex ) {
        case 0:
            return NIGHT;
            break;
            
        case 1:
            return DAY;
            break; 
            
        default:
            return NIGHT;
            break;
    }
}

//sends the delegate the changed/updated setting
- (IBAction)nightDaySettingsChange:(UISegmentedControl *)sender forEvent:(UIEvent *)event {
    
    [self.delegate updateDayNightSetting: [self getDayNightSettingFromUI] ];
}

//sends the deleate a notice that the close button was "pressed up inside"
- (IBAction)settingsCloseButton:(UIButton *)sender {
    [self.delegate closeSettingsPanel];
}


@end
