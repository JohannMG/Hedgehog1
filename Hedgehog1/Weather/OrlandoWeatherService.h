//
//  OrlandoWeatherService.h
//  Hedgehog1
//
//  Created by Garces, Johann (TEKsystems) on 1/8/16.
//  Copyright © 2016 jmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "AFHTTPSessionManager.h"

@protocol WeatherServiceDelegate <NSObject>

-(void)weatherFetchingAndCompletedSuccesfully:(BOOL)succesful;

@end


@interface OrlandoWeatherService : NSObject


@property (strong, nonatomic) NSString *apiUrl;
@property (strong, nonatomic) NSDictionary *apiData;
@property (weak, nonatomic) id <WeatherServiceDelegate> delegate;

//created weather values
@property (nonatomic) int humidity;
@property (nonatomic) double temperatureKelvin;
@property (nonatomic) int windDirection;
@property (nonatomic) double windSpeedInMetersPerSecond;


+(double)kelvinToFarenheit:(double)kelvin;
+(double)metersPerSecondToMilesPerHour:(double)speed;
-(void)fetchWeather; 

@end
