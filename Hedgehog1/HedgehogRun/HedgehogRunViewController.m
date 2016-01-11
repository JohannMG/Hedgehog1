//
//  HedgehogRunViewController.m
//  Hedgehog1
//
//  Created by Garces, Johann (TEKsystems) on 1/11/16.
//  Copyright © 2016 jmg. All rights reserved.
//

#import "HedgehogRunViewController.h"
#import "ViewController.h"


@interface HedgehogRunViewController ()

@end

@implementation HedgehogRunViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.animationPerimeterPadding = 0; //pixel ui 'points'
    self.animationLenth = 0.5; //how long each leg of animation takes
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self setupBoundingBox];
    [self placeSonicAtStart];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupBoundingBox{
    
//    float minX;
//    float maxX;
//    float minY;
//    float maxY;
    
    AnimationBoundingRect newPad = {
        self.animationPerimeterPadding,
        self.view.bounds.size.width - self.animationPerimeterPadding ,
        self.navigationController.navigationBar.frame.size.height +
            [UIApplication sharedApplication].statusBarFrame.size.height +  self.animationPerimeterPadding,
        self.view.bounds.size.height - self.animationPerimeterPadding
    };
    
    self.boundingBox = newPad;
}

-(void)placeSonicAtStart{
    CGRect sonicStart = self.sonicImg.frame;
    sonicStart.origin.x = self.boundingBox.minX;
    sonicStart.origin.y = self.boundingBox.minY;
    self.sonicImg.frame = sonicStart;

}


- (IBAction)runButtonAction:(UIButton *)sender forEvent:(UIEvent *)event {
    
    self.runButton.hidden = true;
    [self runAnimation];
    
}

- (void)goToRootStory {
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *rootVC = [story instantiateInitialViewController];
    [self presentViewController:rootVC animated:YES completion:^{}];
}

- (IBAction)setImgAtStart:(UIButton *)sender forEvent:(UIEvent *)event {
    
    [self placeSonicAtStart];
}

-(void)runAnimation{

    [self placeSonicAtStart];
    
    //chaining the animation by using a array queue of blocks
    //as demonstrated in this example: http://stackoverflow.com/questions/17949511/the-proper-way-of-doing-chain-animations
    
    //make the chaining object with __block so it can be modified in the closure's scope
    __block NSMutableArray *animationBlocks = [NSMutableArray array];
    
    //we already have >> typedef void(^animationBlock)(BOOL);
    //the controller for the UIKit animations
    animationBlock (^getNextAnimation)() = ^{
        if([animationBlocks count] > 0){
            animationBlock nextBlock = (animationBlock) [animationBlocks objectAtIndex:0];
            [animationBlocks removeObjectAtIndex:0];
            return nextBlock;
        }
        else {
            return ^(BOOL finished){
                animationBlocks = nil;
                
                UIAlertController *finishedAlert =
                    [UIAlertController alertControllerWithTitle:@"SO FAST!"
                                                        message:@"Would you like to make him run again?"
                                                 preferredStyle: UIAlertControllerStyleAlert
                 ];
                
                UIAlertAction *runAgain =
                    [UIAlertAction actionWithTitle:@"Run Again"
                                             style:UIAlertActionStyleDefault
                                           handler:^(UIAlertAction * _Nonnull action) {
                                               [finishedAlert dismissViewControllerAnimated:YES completion:nil];
                                               [self runAnimation];
                                            }];
                
                UIAlertAction *restart =
                    [UIAlertAction actionWithTitle:@"Beginning"
                                             style:UIAlertActionStyleDestructive
                                           handler:^(UIAlertAction * _Nonnull action) {
                                               [finishedAlert dismissViewControllerAnimated:YES completion:nil];
                                               [self goToRootStory];
                                           }];
                
                [finishedAlert addAction:runAgain];
                [finishedAlert addAction:restart];
                
                [self presentViewController:finishedAlert animated:YES completion:nil];
                
                
                
            };//end return block
        }//end else
    };//end animationBlock
    
    //------------animations---------------
    
    //1: top-left to top-right (an X-coord translation only)
    CGRect topRight = self.sonicImg.frame;
    topRight.origin.x = self.boundingBox.maxX - self.sonicImg.bounds.size.width;
    
    [animationBlocks addObject:^(BOOL finished){
        [UIView animateWithDuration:_animationLenth
                              delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.sonicImg.frame = topRight;
                         }
                         completion:getNextAnimation()
         ];
    }];
    
    
    //2: top-right to bottom-right (a y-translation)
    CGRect bottomRight = topRight;
    bottomRight.origin.y = self.boundingBox.maxY - self.sonicImg.bounds.size.height;
    
    [animationBlocks addObject:^(BOOL finished){
        [UIView animateWithDuration:_animationLenth
                              delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.sonicImg.frame = bottomRight;
                         }
                         completion:getNextAnimation()
         ];
    }];
    
    
    //3: bottom left (negative x translation)
    CGRect bottomLeft = bottomRight;
    bottomLeft.origin.x = self.boundingBox.minX;
    [animationBlocks addObject:^{
        [UIView animateWithDuration:_animationLenth
                              delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.sonicImg.frame = bottomLeft;
                         }
                         completion:getNextAnimation()
         ];
    
    }];
    
    //4: return to top right (negative y translation)
    CGRect topLeftStart = bottomLeft;
    topLeftStart.origin.y = self.boundingBox.minY;
    [animationBlocks addObject:^{
        [UIView animateWithDuration:_animationLenth
                              delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.sonicImg.frame = topLeftStart;
                         }
                         completion:getNextAnimation()
         ];
    }];
    
    
    
    //----- run animation
    getNextAnimation()(YES);
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
