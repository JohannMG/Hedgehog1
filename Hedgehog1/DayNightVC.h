//
//  DayNight.h
//  Hedgehog1
//
//  Created by Garces, Johann (TEKsystems) on 1/7/16.
//  Copyright © 2016 jmg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DayNightSettings.h"


@interface DayNightVC : UIViewController <DayNightSettingsDelegate>

@property (strong, nonatomic) IBOutlet UILabel *dayNightLabel;
@property (strong, nonatomic) IBOutlet UIButton *optionsButton;
@property (strong, nonatomic) IBOutlet UIImageView *dayNightImg;
@property (nonatomic) DayNightSet dayNightMode;


- (IBAction)optionsButtonTouched:(UIButton *)sender forEvent:(UIEvent *)event;

@end
