//
//  CMViewController.h
//  CMTabbarView
//
//  Created by momo605654602@gmail.com on 03/07/2017.
//  Copyright (c) 2017 momo605654602@gmail.com. All rights reserved.
//

@import UIKit;
#import "CMTabbarView.h"
#import "DemoCell.h"


@interface CMViewController : UIViewController<CMTabbarViewDelegate,CMTabbarViewDatasouce,UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
