//
//  critterWeatherViewController.m
//  Hedgehog1
//
//  Created by Garces, Johann (TEKsystems) on 1/8/16.
//  Copyright © 2016 jmg. All rights reserved.
//

#import "WeatherViewController.h"

@interface WeatherViewController ()

@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blurry-city.jpg"]];

    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if  (self.weather == nil){
        self.weather = [[OrlandoWeatherService alloc] init];
        [self.weather setDelegate:self ];
        [self.weather fetchWeather];
    }
    else{
        [self weatherFetchingAndCompletedSuccesfully:YES];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)weatherFetchingAndCompletedSuccesfully:(BOOL)succesful{
    if (succesful){
        double temp = [OrlandoWeatherService kelvinToFarenheit:self.weather.temperatureKelvin];
        double wind = [OrlandoWeatherService metersPerSecondToMilesPerHour:self.weather.windSpeedInMetersPerSecond];
        
        self.tempLabel.text = [NSString stringWithFormat:@"%.1f F", temp];
        self.windLabel.text = [NSString stringWithFormat:@"%.1f mph winds", wind];
    }
    else{
        //error things
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

@end
