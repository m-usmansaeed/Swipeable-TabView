//
//  DemoCell.h
//  CMTabbarView_Example
//
//  Created by Moyun on 2017/7/28.
//  Copyright © 2017年 momo605654602@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestTableViewCell.h"

@interface DemoCell : UICollectionViewCell <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *array;


-(void)configureCell;


@end
