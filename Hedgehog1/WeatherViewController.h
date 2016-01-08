//
//  critterWeatherViewController.h
//  Hedgehog1
//
//  Created by Garces, Johann (TEKsystems) on 1/8/16.
//  Copyright © 2016 jmg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrlandoWeatherService.h"

@interface WeatherViewController : UIViewController <WeatherServiceDelegate>

@property (strong, nonatomic) IBOutlet UILabel *tempLabel;
@property (strong, nonatomic) IBOutlet UILabel *windLabel;

@property (strong, nonatomic) OrlandoWeatherService *weather; 


@end
