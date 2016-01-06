//
//  ViewController.h
//  Hedgehog1
//
//  Created by Garces, Johann (TEKsystems) on 1/5/16.
//  Copyright © 2016 jmg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


//facts screen

@property (nonatomic) BOOL fact1Active;
@property (nonatomic) BOOL fact2Active;
@property (nonatomic) BOOL fact3Active;

@property (strong, nonatomic) IBOutlet UILabel *europeFactLabel;
@property (strong, nonatomic) IBOutlet UILabel *speciesFactLabel;
@property (strong, nonatomic) IBOutlet UILabel *hibernateFactsLabel;
@property (strong, nonatomic) IBOutlet UIButton *factsNextButton;
@property (strong, nonatomic) IBOutlet UIImageView *scalingHedgehogImg;

-(void)fadeInNextButton;
-(void)slidingHedgehogIntoFrame;
- (void)displayNextButtonIfFactsCompleted;

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapFactsEvent;
@property (strong, nonatomic) IBOutlet UIImageView *hedgehogSlidingImg;

- (IBAction)factsScreenTapped:(id)sender;
- (IBAction)scalingPinchOnFacts:(UIPinchGestureRecognizer *)sender;
//- (IBAction)swipeGestureOverFacts:(UISwipeGestureRecognizer *)sender;



@end

