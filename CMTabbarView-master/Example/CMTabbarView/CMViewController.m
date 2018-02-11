//
//  CMViewController.m
//  CMTabbarView
//
//  Created by momo605654602@gmail.com on 03/07/2017.
//  Copyright (c) 2017 momo605654602@gmail.com. All rights reserved.
//

#import "CMViewController.h"

static NSUInteger const kCMDefaultSelected = 0;

@interface CMViewController ()

//@property (strong, nonatomic) UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet CMTabbarView *tabbarView;

@property (strong, nonatomic) NSArray *datas;
@property (strong, nonatomic) NSArray *data;

@end

@implementation CMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //    self.datas = @[@"Objective-C",@"Swift",@"Ruby"];
    //    [self.view insertSubview:self.collectionView belowSubview:self.tabbarView];
    //    [self.view addSubview:self.tabbarView];
    
    _tabbarView.delegate = (id)self;
    _tabbarView.dataSource = (id)self;
    _tabbarView.defaultSelectedIndex = kCMDefaultSelected;
    _tabbarView.indicatorScrollType = CMTabbarIndicatorScrollTypeSpring;
    _tabbarView.tabPadding = 5.0f;
    
    
    //    if (!_collectionView) {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height);
    layout.sectionInset = UIEdgeInsetsZero;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    [self.collectionView setCollectionViewLayout:layout];
    
    
    //        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    
    
//    [_collectionView registerClass:[DemoCell class] forCellWithReuseIdentifier:NSStringFromClass([DemoCell class])];
//    _collectionView.dataSource = self;
//    _collectionView.delegate = self;
//    _collectionView.showsHorizontalScrollIndicator = NO;
//    _collectionView.pagingEnabled = YES;
    
    _collectionView.contentOffset = CGPointMake(self.view.bounds.size.width*kCMDefaultSelected, 0);
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    self.datas = @[@"Objective-C",@"Swift",@"Ruby",@"C++",@"JAVA",@"C",@"Apple",@"iPhone",@"iOS",@"Orange",@"Moyun",@"Penny",@"Module-Class-Class",@"Class"];
    
    self.data = @[@[@"1", @"Objective-C",@"Swift"],@[@"2", @"Ruby",@"C++"],@[@"3", @"JAVA",@"C"],@[@"4", @"Apple",@"iPhone"],@[@"5", @"iOS",@"Orange"],@[@"6", @"Moyun",@"Penny"],@[@"7", @"Module-Class-Class",@"Class"],@[@"8", @"Objective-C",@"Swift"],@[@"9", @"Ruby",@"C++"],@[@"10", @"JAVA",@"C"],@[@"11", @"Apple",@"iPhone"],@[@"12", @"iOS",@"Orange"],@[@"13", @"Moyun",@"Penny"],@[@"14", @"Module-Class-Class",@"Class"]];

    [self.collectionView reloadData];
    [self.tabbarView reloadData];
    
//    self.collectionView.contentOffset = CGPointMake(self.view.bounds.size.width*kCMDefaultSelected, 0);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tabbarView setTabIndex:5 animated:YES];
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:5
                                                                        inSection:0]
                                    atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    });
    
    
}

//- (CMTabbarView *)tabbarView
//{
//    if (!_tabbarView) {
////        _tabbarView = [[CMTabbarView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 40)];
//        _tabbarView.delegate = self;
//        _tabbarView.dataSource = self;
//        _tabbarView.defaultSelectedIndex = kCMDefaultSelected;
//        _tabbarView.indicatorScrollType = CMTabbarIndicatorScrollTypeSpring;
//        _tabbarView.tabPadding = 5.0f;
////        _tabbarView.selectionType = CMTabbarSelectionBox;
////        _tabbarView.indicatorAttributes = @{CMTabIndicatorColor:[UIColor orangeColor]};
////        _tabbarView.normalAttributes = @{NSForegroundColorAttributeName:[UIColor blackColor]};
////        _tabbarView.selectedAttributes = @{NSForegroundColorAttributeName:[UIColor orangeColor]};
//        //_tabbarView.needTextGradient = false;
//    }
//    return _tabbarView;
//}

//- (UICollectionView *)collectionView
//{
//    if (!_collectionView) {
//        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//        layout.itemSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height);
//
//        layout.sectionInset = UIEdgeInsetsZero;
//        layout.minimumLineSpacing = 0;
//        layout.minimumInteritemSpacing = 0;
////        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
//
//
//        [_collectionView registerClass:[DemoCell class] forCellWithReuseIdentifier:NSStringFromClass([DemoCell class])];
//        _collectionView.dataSource = self;
//        _collectionView.delegate = self;
//        _collectionView.showsHorizontalScrollIndicator = false;
//        _collectionView.pagingEnabled = true;
//        _collectionView.contentOffset = CGPointMake(self.view.bounds.size.width*kCMDefaultSelected, 0);
//        _collectionView.backgroundColor = [UIColor whiteColor];
//    }
//    return _collectionView;
//}

- (NSArray<NSString *> *)tabbarTitlesForTabbarView:(CMTabbarView *)tabbarView
{
    return self.datas;
}

- (void)tabbarView:(CMTabbarView *)tabbarView didSelectedAtIndex:(NSInteger)index
{
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]
                                atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                           cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DemoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell"
                                                               forIndexPath:indexPath];
    NSArray *array = [self.data objectAtIndex:indexPath.row];
    cell.array = array;
    [cell configureCell];

    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_tabbarView setTabbarOffsetX:(scrollView.contentOffset.x)/self.view.bounds.size.width];
}

@end
