//
//  ViewController.h
//  Hedgehog1
//
//  Created by Garces, Johann (TEKsystems) on 1/5/16.
//  Copyright © 2016 jmg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@private 

//facts screen
@property (strong, nonatomic) IBOutlet UILabel *europeFactLabel;
@property (strong, nonatomic) IBOutlet UILabel *speciesFactLabel;
@property (strong, nonatomic) IBOutlet UILabel *hibernateFactsLabel;
@property (strong, nonatomic) IBOutlet UIButton *factsNextButton;

-(void)fadeInNextButton;
-(void)slidingHedgehogIntoFrame;

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapFactsEvent;
@property (strong, nonatomic) IBOutlet UIImageView *hedgehogSlidingImg;

- (IBAction)factsScreenTapped:(id)sender;


@end

