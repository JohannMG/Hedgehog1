//
//  JMGCustomUITableViewCell.m
//  Hedgehog1
//
//  Created by Garces, Johann (TEKsystems) on 1/6/16.
//  Copyright © 2016 jmg. All rights reserved.
//

#import "JMGCustomUITableViewCell.h"

@implementation JMGCustomUITableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UITableViewCell) tableView:(UITableView *)tableView
            willDisplayCell:(UITableViewCell *)cell
            forRowAtIndexPath:(NSIndexPath *) indexPath{
    
    JMGCustomUITableViewCell *newCustomCell = [tableView dequeueReusableCellWithIdentifier:@"customCell"];
    
    newCustomCell.customTableCellLabel = @"Custom Label";
    
    return newCustomCell;

}

@end
