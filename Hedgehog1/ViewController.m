//
//  ViewController.m
//  Hedgehog1
//
//  Created by Garces, Johann (TEKsystems) on 1/5/16.
//  Copyright © 2016 jmg. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //init with clean appearance
    self.fact1Active = NO;
    self.fact2Active = NO;
    self.fact3Active = NO;
    self.swipeAnimationOffset = 90; //pixel or UI "points"
    
    //hide the button on load
    self.factsNextButton.hidden = YES;
    self.factsNextButton.alpha = 0;
    
    //hide swiping hedgehog
    self.swipingHedgehogImg.alpha = 0;
    
    //scale down hedgehog to be pinched
    self.scalingHedgehogImg.transform = CGAffineTransformScale(self.scalingHedgehogImg.transform,
                                                               .03, .03); //tiny
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Move hedge hog into screen
-(void)slidingHedgehogIntoFrame{
    
    if (self.fact1Active){
        return;
    }
    
    //move hedgehog to edge of screen
    CGRect deviceFrame = [[UIScreen mainScreen] bounds ];
    CGFloat maxScreenWidth = deviceFrame.size.width;
    
    CGRect hedgehogFrame = self.hedgehogSlidingImg.frame;
    hedgehogFrame.origin.x = maxScreenWidth + 10;
    self.hedgehogSlidingImg.frame = hedgehogFrame;
    
    CGRect endAnimation = self.hedgehogSlidingImg.frame;
    endAnimation.origin.x = 0;
    
    //animate hedge hog sliding in
    
    [UIView transitionWithView: self.hedgehogSlidingImg
                      duration: 1.5
                       options: UIViewAnimationOptionCurveEaseInOut
                    animations: ^{
                        self.hedgehogSlidingImg.frame = endAnimation;
                    }
                    completion: ^(BOOL finished){
                        NSLog(@"Hedgehog 1 eased in");
                    }
     ];
    
    self.fact1Active = YES;
    [self displayNextButtonIfFactsCompleted];
    

    
}

- (IBAction)scalingPinchOnFacts:(UIPinchGestureRecognizer *)sender {
    
    //scale second hedgehog to pinch event
    self.scalingHedgehogImg.transform = CGAffineTransformScale(self.scalingHedgehogImg.transform,
                                                               sender.scale, sender.scale);

    //suggested online becuase UI Pinch returns from a statc modified value and
    //we're using a relative matix transform
    sender.scale = 1;
    
    self.fact2Active = YES;
    [self displayNextButtonIfFactsCompleted];
    
    
}


- (IBAction)factsSwipedRight:(UISwipeGestureRecognizer *)sender {
    [self univerSwipeActionWithXOffset: -1 * self.swipeAnimationOffset yOffset: 0];
}

- (IBAction)factsSwipedUp:(UISwipeGestureRecognizer *)sender {
    [self univerSwipeActionWithXOffset: 0 yOffset: self.swipeAnimationOffset];
}

- (IBAction)factsSwipedLeft:(UISwipeGestureRecognizer *)sender {
    [self univerSwipeActionWithXOffset: self.swipeAnimationOffset yOffset:0];
}

- (IBAction)factsSwipedDown:(UISwipeGestureRecognizer *)sender {
    [self univerSwipeActionWithXOffset: 0 yOffset: -1 * self.swipeAnimationOffset];
}

//General reception for all swipe methods.
//Send the directions to animate from as a X and Y offset
- (void)univerSwipeActionWithXOffset:(int)xOffset yOffset:(int)yOffset{
    
    if (_fact3Active) {return;}
    self.swipingHedgehogImg.alpha = 0;

    
    CGRect hedgehogOriginalPosition = self.swipingHedgehogImg.frame;
    CGRect animateFromNewPostion = hedgehogOriginalPosition;
    animateFromNewPostion.origin.x = hedgehogOriginalPosition.origin.x + xOffset;
    animateFromNewPostion.origin.y = hedgehogOriginalPosition.origin.y + yOffset;
    
    
    self.swipingHedgehogImg.frame = animateFromNewPostion;
    
    [UIView transitionWithView: self.swipingHedgehogImg
                      duration: 1
                       options: UIViewAnimationOptionCurveEaseInOut
                    animations: ^{
                        self.swipingHedgehogImg.alpha = 1;
                        self.swipingHedgehogImg.frame = hedgehogOriginalPosition;
                        
                    }
                    completion: ^(BOOL finished){
                        NSLog(@"Hedgehog slid in.");
                    }
     ];
    
    self.fact3Active = YES;
    [self displayNextButtonIfFactsCompleted];
    
    
}




- (void)displayNextButtonIfFactsCompleted{
    
    if ( _fact1Active && _fact2Active && _fact3Active){
        
        //only fade button in once
        if (self.factsNextButton.alpha > 0){
            return;
        }
        
        //hide image using alpha channel
        self.factsNextButton.alpha = 0;
        self.factsNextButton.hidden = NO;
        
        //animate alpha channel to 1.00 opacity
        [UIView transitionWithView:self.factsNextButton
                          duration: 0.7
                           options: UIViewAnimationOptionCurveEaseInOut
                        animations: ^{
                            self.factsNextButton.alpha = 1;
                        }
                        completion:^(BOOL finished) {
                            NSLog(@"transition finished with %@ ", finished ? @"yes" : @"no" );
                        }
         ];
    }
}



- (IBAction)factsScreenTapped:(id)sender {
    [self slidingHedgehogIntoFrame];
}







@end

