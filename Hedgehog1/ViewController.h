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
@property (nonatomic) int swipeAnimationOffset;

@property (strong, nonatomic) IBOutlet UILabel *europeFactLabel;
@property (strong, nonatomic) IBOutlet UILabel *speciesFactLabel;
@property (strong, nonatomic) IBOutlet UILabel *hibernateFactsLabel;
@property (strong, nonatomic) IBOutlet UIButton *factsNextButton;
@property (strong, nonatomic) IBOutlet UIImageView *scalingHedgehogImg;
@property (strong, nonatomic) IBOutlet UIImageView *hedgehogSlidingImg;
@property (strong, nonatomic) IBOutlet UIImageView *swipingHedgehogImg;

//- (void)fadeInNextButton;
- (void)slidingHedgehogIntoFrame;
- (void)displayNextButtonIfFactsCompleted;
- (void)univerSwipeActionWithXOffset:(int)xOffset yOffset:(int)yOffset;

- (IBAction)factsScreenTapped:(id)sender;
- (IBAction)scalingPinchOnFacts:(UIPinchGestureRecognizer *)sender;

- (IBAction)factsSwipedDown:(UISwipeGestureRecognizer *)sender;
- (IBAction)factsSwipedRight:(UISwipeGestureRecognizer *)sender;
- (IBAction)factsSwipedUp:(UISwipeGestureRecognizer *)sender;
- (IBAction)factsSwipedLeft:(UISwipeGestureRecognizer *)sender;


@end

