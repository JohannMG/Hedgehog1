//
//  JMGCustomUITableViewCell.h
//  Hedgehog1
//
//  Created by Garces, Johann (TEKsystems) on 1/6/16.
//  Copyright © 2016 jmg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JMGCustomUITableViewCell : UITableViewCell


 @property (strong, nonatomic) IBOutlet UILabel *customTableCellLabel;
 @property (strong, nonatomic) IBOutlet UIImageView *customTableCellImg;

- (UITableViewCell) tableView:(UITableView *)tableView
        willDisplayCell:(UITableViewCell *)cell
        forRowAtIndexPath:(NSIndexPath *) indexPath;

@end
