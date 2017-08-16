//
//  GZTableView2.m
//  高仿简书
//
//  Created by xinshijie on 2017/7/16.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import "GZTableView2.h"
@interface GZTableView2 ()<UITableViewDataSource>

@end

@implementation GZTableView2
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.dataSource = self;
    }
    return self;
}

- (void)didMoveToWindow {
    [super didMoveToWindow];
}

- (void)setContentOffset:(CGPoint)contentOffset {
    if (self.window) {
        [super setContentOffset:contentOffset];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cell2 = @"TableView2";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cell2];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cell2];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"    消息:%ld", indexPath.row];
    return cell;
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end

