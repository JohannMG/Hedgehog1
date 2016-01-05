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
    
    self.factsNextButton.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)fadeInNextButton{
    self.factsNextButton.alpha = 0;
    self.factsNextButton.hidden = NO;
    
    [UIView transitionWithView:self.factsNextButton
                      duration: 1.3
                       options: UIViewAnimationOptionCurveEaseInOut
                    animations: ^{
                        self.factsNextButton.alpha = 1;
                    }
                    completion:^(BOOL finished) {
                        NSLog(@"transition finished with %@ ", finished ? @"yes" : @"no" );
                    }
     ];
    
}

- (IBAction)testButtonClickedFadeInBtn:(id)sender{
    NSLog(@"Pressed");
    [self fadeInNextButton];
}


@end
