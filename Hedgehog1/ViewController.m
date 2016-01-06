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
    self.factsNextButton.hidden = YES;
    self.factsNextButton.alpha = 0;
    
    //scale down hedgehog to be pinched
    self.scalingHedgehogImg.transform = CGAffineTransformScale(self.scalingHedgehogImg.transform, .03, .03);
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fadeInNextButton{
    
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

//- (IBAction)swipeGestureOverFacts:(UISwipeGestureRecognizer *)sender {
//    
//    switch (sender.direction) {
//        case UISwipeGestureRecognizerDirectionUp:
//            NSLog(@"swiped down");
//            break;
//            
//        default:
//            break;
//    }
//    
//    NSLog(@"swiped");
//}

- (void)displayNextButtonIfFactsCompleted{
    
    if ( _fact1Active && _fact2Active && _fact3Active){
        [self fadeInNextButton];
    }
}



- (IBAction)factsScreenTapped:(id)sender {
    [self slidingHedgehogIntoFrame];
}







@end

