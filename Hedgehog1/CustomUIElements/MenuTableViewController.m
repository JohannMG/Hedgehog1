//
//  MenuTableViewController.m
//  Hedgehog1
//
//  Created by Garces, Johann (TEKsystems) on 1/6/16.
//  Copyright © 2016 jmg. All rights reserved.
//

#import "MenuTableViewController.h"
#import "CustomMenuTableViewCell.h"

@implementation MenuTableViewController

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSArray *)items {
    
    return @[@"Hello", @"Two", @"Three"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomMenuTableViewCell *newCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    newCell.customCellLabel.text = @"Hello";
    
    return newCell;
    
    
}

@end
