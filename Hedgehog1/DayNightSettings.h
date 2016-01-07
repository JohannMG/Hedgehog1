//
//  DayNightSettings.h
//  Hedgehog1
//
//  Created by Garces, Johann (TEKsystems) on 1/7/16.
//  Copyright © 2016 jmg. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger { DAY, NIGHT } DayNightSet;

@protocol DayNightSettingsDelegate <NSObject>

- (void) updateDayNightSetting:(DayNightSet)setting;
- (void) closeSettingsPanel;

@end


@interface DayNightSettings : UIViewController

@property (strong, nonatomic) IBOutlet UISegmentedControl *nightDayControl;
@property (weak, nonatomic) id <DayNightSettingsDelegate> delegate;


- (IBAction)nightDaySettingsChange:(UISegmentedControl *)sender forEvent:(UIEvent *)event;
- (void) setDayNightSetting: (DayNightSet)setting;

@end
