//
//  DemoCell.m
//  CMTabbarView_Example
//
//  Created by Moyun on 2017/7/28.
//  Copyright © 2017年 momo605654602@gmail.com. All rights reserved.
//

#import "DemoCell.h"


@interface DemoCell ()
@property (strong, nonatomic) UILabel *titleLabel;

@end

@implementation DemoCell

-(void)configureCell {
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView reloadData];
}

//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        self.titleLabel = [UILabel new];
//        self.titleLabel.textAlignment = NSTextAlignmentCenter;
//        [self addSubview:self.titleLabel];
//
//        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false;
//        NSDictionary *views = NSDictionaryOfVariableBindings(_titleLabel);
//        NSString *verticalConstraints = [NSString stringWithFormat:@"V:|-%f-[_titleLabel]-%f-|", .0,.0];
//        NSString *horizontalConstraints = [NSString stringWithFormat:@"H:|-%f-[_titleLabel]-%f-|",.0,.0];
//        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:horizontalConstraints options:0 metrics:nil views:views]];
//        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:verticalConstraints options:0 metrics:nil views:views]];
//
//    }
//    return self;
//}
//
//- (void)prepareForReuse
//{
//    self.title = nil;
//    self.textColor = nil;
//    [super prepareForReuse];
//}
//
//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}
//
//- (void)setTitle:(NSString *)title
//{
//    _title = title;
//    self.titleLabel.text = title;
//}
//
//- (void)setTextFont:(UIFont *)textFont
//{
//    _textFont = textFont;
//    self.titleLabel.font = textFont;
//}
//
//- (void)setTextColor:(UIColor *)textColor
//{
//    _textColor = textColor;
//    self.titleLabel.textColor = textColor;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath; {
    TestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];    
    NSString *data = [self.array objectAtIndex:indexPath.row];
    cell.lblTableNumber.text = data;
    return cell;
}



@end
