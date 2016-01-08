//
//  OrlandoWeatherService.m
//  Hedgehog1
//
//  Created by Garces, Johann (TEKsystems) on 1/8/16.
//  Copyright © 2016 jmg. All rights reserved.
//

#import "OrlandoWeatherService.h"

@implementation OrlandoWeatherService



- (id) init
{
    if (self = [super init])
    {
        self.apiUrl = @"http://api.openweathermap.org/data/2.5/weather?zip=32801,us&APPID=a02ff5ada233c6ad32d5479712c0ecc0";
    }
    return self;
}

//called on object init.
-(void)fetchWeather {
    
    NSURL *apiUrl = [NSURL URLWithString:self.apiUrl];
    NSURLRequest *dataRequest = [NSURLRequest requestWithURL:apiUrl];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *sessMan = [[AFURLSessionManager alloc] initWithSessionConfiguration:config];
    NSLog(@"GET weather api");
    NSURLSessionDataTask *dataTask = [sessMan
                                      dataTaskWithRequest:dataRequest
                                      completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                  //data complete ^{} block----------
                  if (error){
                      NSLog(@"There was an error with weather");
                      [self.delegate weatherFetchingAndCompletedSuccesfully: NO ];
                  }
                  else { //when succesful
                      self.apiData = (NSDictionary * )responseObject;
                      [self setPropertiesFromData];
                  }
                                          
      }];
    
    
    //completes request
    [dataTask resume];
    
}

-(void)setPropertiesFromData{
    
    NSNumberFormatter *numFomatter = [[NSNumberFormatter alloc] init];
    numFomatter.numberStyle = NSNumberFormatterDecimalStyle;
    numFomatter.maximumFractionDigits = 1;
    
    
    self.humidity = (int) self.apiData[@"main"][@"humidity"];
    self.temperatureKelvin = [self.apiData[@"main"][@"temp"] doubleValue];
    self.windDirection = (int) self.apiData[@"wind"][@"deg"];
    self.windSpeedInMetersPerSecond = [self.apiData[@"wind"][@"speed"] doubleValue];
    [self.delegate weatherFetchingAndCompletedSuccesfully: YES ];
    
    
    
}

//° F = 9/5(° K - 273) + 32
+(double)kelvinToFarenheit:(double)kelvin{
    
    return ((9.0/5.0) * (kelvin - 273)) + 32;
    
}


+(double)metersPerSecondToMilesPerHour:(double)speed{
    return speed * 2.23694;
}





@end
