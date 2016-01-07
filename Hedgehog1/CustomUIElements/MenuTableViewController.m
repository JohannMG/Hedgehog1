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


//un-removed. i'm still figuring things out here... 
     //Removed b/c this no longer acts a controller, just manages the table
 
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
    //get items from plist
    NSString *listResource = [[NSBundle mainBundle]
                              pathForResource:@"hedgehogExamples" ofType:@"plist" ];
    
    NSDictionary *dataItems = [[NSDictionary alloc] initWithContentsOfFile:listResource];
    NSArray *menuItems = dataItems[@"HedgeHogs"][@"facts"];
    NSLog(@"menu items %@", menuItems);
    
    
    return menuItems;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSLog(@"returned count");
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomMenuTableViewCell *newCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    newCell.customCellLabel.text = @"Hello";
    
    return newCell;
    
    
}


- (void)tableView:(UITableView *)tableView
        willDisplayCell:(CustomMenuTableViewCell *)cell
        forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    cell.customCellLabel.text = self.items[indexPath.row];
}

//this controller becomes the delegator.
//this event fired when an item in the list is selected

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"clicked %ld" , indexPath.row);
}

@end
