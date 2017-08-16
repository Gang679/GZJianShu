//
//  GZTableView3.m
//  高仿简书
//
//  Created by xinshijie on 2017/7/16.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import "GZTableView3.h"
@interface GZTableView3 ()<UITableViewDataSource>

@end

@implementation GZTableView3
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
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cell3 = @"TableView3";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cell3];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cell3];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"    更多:%ld", indexPath.row];
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

