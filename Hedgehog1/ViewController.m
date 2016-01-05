//
//  ViewController.m
//  Hedgehog1
//
//  Created by Garces, Johann (TEKsystems) on 1/5/16.
//  Copyright © 2016 jmg. All rights reserved.
//

#import "ViewController.h"
@import Foundation

@interface ViewController ()

@end

@implementation ViewController {
    BOOL img1 = NO;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.factsNextButton.hidden = YES;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)fadeInNextButton{
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
    
    
    
    //move hedgehog to edge of screen
    CGRect deviceFrame = [[UIScreen mainScreen] bounds ];
    CGFloat maxScreenWidth = deviceFrame.size.width;
    
    CGRect hedgehogFrame = self.hedgehogSlidingImg.frame;
    hedgehogFrame.origin.x = maxScreenWidth + 10;
    self.hedgehogSlidingImg.frame = hedgehogFrame;
    
    CGRect endAnimation = self.hedgehogSlidingImg.frame;
    endAnimation.origin.x = 0;
    
    NSLog(@"origin y value: %f", self.hedgehogSlidingImg.frame.origin.x);
    
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
    

    
}



- (IBAction)factsScreenTapped:(id)sender {
    [self fadeInNextButton];
    [self slidingHedgehogIntoFrame];

    
}
@end

