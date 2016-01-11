//
//  HedgehogRunViewController.h
//  Hedgehog1
//
//  Created by Garces, Johann (TEKsystems) on 1/11/16.
//  Copyright © 2016 jmg. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^animationBlock)(BOOL);

typedef struct {
    float minX;
    float maxX;
    float minY;
    float maxY;
    
} AnimationBoundingRect ;

@interface HedgehogRunViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *runButton;
@property (weak, nonatomic) IBOutlet UIImageView *sonicImg;

@property (nonatomic) float animationPerimeterPadding;
@property (nonatomic) float animationLenth; 
@property (nonatomic) AnimationBoundingRect boundingBox;


- (IBAction)runButtonAction:(UIButton *)sender forEvent:(UIEvent *)event;
- (void)setupBoundingBox;
- (void)goToRootStory;


@end
