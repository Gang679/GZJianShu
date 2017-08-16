//
//  ViewController.m
//  高仿简书
//
//  Created by xinshijie on 2017/7/15.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import "ViewController.h"
#import "GZImaheView.h"
#import "Masonry.h"
#import "GZTitleView.h"
#import "GZTableView1.h"
#import "GZTableView2.h"
#import "GZTableView3.h"
#import "GZContentScrollView.h"
#import "GZHeaderView.h"
#import "UIView+GZKit.h"

@interface ViewController ()<UIScrollViewDelegate, UITableViewDelegate>

@property(nonatomic , strong)GZImaheView  *GZImage ;
@property (nonatomic, weak) UIView *GZheaderView;
@property (nonatomic, weak) GZContentScrollView *scrollView;
@property (nonatomic, weak) GZTableView1 *GZTableView1;
@property (nonatomic, weak) GZTableView2 *GZTableView2;
@property (nonatomic, weak) GZTableView3 *GZTableView3;
@property (nonatomic, weak) GZTitleView *titleView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self setupContentView];
    [self setupHeaderView];
    
    self.GZImage = [[GZImaheView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
    [self.GZImage reloadSizeWithScrollView:self.GZTableView1];
    self.navigationItem.titleView = self.GZImage;
    
    [self.GZImage handleClickActionWithBlock:^{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"您点击了头像" message:@"" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertView show];
    }];
}

/// 主要内容
- (void)setupContentView {
    GZContentScrollView *scrollView           = [[GZContentScrollView alloc] init];
    scrollView.delaysContentTouches           = NO;
    [self.view addSubview:scrollView];
    self.scrollView                           = scrollView;
    scrollView.pagingEnabled                  = YES;
    scrollView.showsVerticalScrollIndicator   = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate                       = self;
    scrollView.contentSize                    = CGSizeMake([UIScreen mainScreen].bounds.size.width * 3, 0);
    UIView *headView                          = [[UIView alloc] init];
    headView.frame               = CGRectMake(0, 0, 0, GZHeadViewHeight + GZTitleHeight);
    
    GZTableView1 *gzTableView1 = [[GZTableView1 alloc] init];
    gzTableView1.delegate            = self;
    gzTableView1.separatorStyle      = UITableViewCellSeparatorStyleNone;
    self.GZTableView1                = gzTableView1;
    gzTableView1.tableHeaderView     = headView;
    [scrollView addSubview:gzTableView1];
    [gzTableView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    
    GZTableView2 *gzTableView2= [[GZTableView2 alloc] init];
    gzTableView2.delegate            = self;
    gzTableView2.separatorStyle      = UITableViewCellSeparatorStyleNone;
    self.GZTableView2                = gzTableView2;
    gzTableView2.tableHeaderView     = headView;
    [scrollView addSubview:gzTableView2];
    [gzTableView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(scrollView).offset([UIScreen mainScreen].bounds.size.width);
        make.width.equalTo(gzTableView1);
        make.top.bottom.equalTo(gzTableView1);
    }];
    
    GZTableView3 *gzTableView3 = [[GZTableView3 alloc] init];
    gzTableView3.delegate            = self;
    gzTableView3.separatorStyle      = UITableViewCellSeparatorStyleNone;
    self.GZTableView3                = gzTableView3;
    gzTableView3.tableHeaderView     = headView;
    [scrollView addSubview:gzTableView3];
    [gzTableView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(scrollView).offset([UIScreen mainScreen].bounds.size.width * 2);
        make.width.equalTo(gzTableView1);
        make.top.bottom.equalTo(gzTableView1);
    }];
}

/// tableView 的头部视图
- (void)setupHeaderView {
    UIView *headerView    = [[GZHeaderView alloc] init];
    headerView.frame      = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, GZHeadViewHeight + GZTitleHeight);
    [self.view addSubview:headerView];
    self.GZheaderView             = headerView;
    GZTitleView *titleView = [[GZTitleView alloc]init];
    [headerView addSubview:titleView];
    self.titleView                         = titleView;
    titleView.backgroundColor              = [UIColor whiteColor];
    [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(headerView);
        make.bottom.equalTo(headerView.mas_bottom);
        make.height.mas_equalTo(GZTitleHeight);
    }];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.mas_equalTo(headerView.frame.origin.y);
    }];
    
    __weak typeof(self) weakSelf = self;
    titleView.gztitles             = @[@"动态", @"文章", @"更多"];
    titleView.selectedIndex      = 0;
    titleView.buttonSelected     = ^(NSInteger index){
        [weakSelf.scrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width * index, 0) animated:YES];
    };
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.scrollView) {
        CGFloat contentOffsetX       = scrollView.contentOffset.x;
        NSInteger pageNum            = contentOffsetX / [UIScreen mainScreen].bounds.size.width + 0.5;
        self.titleView.selectedIndex = pageNum;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.scrollView || !scrollView.window) {
        return;
    }
    CGFloat offsetY      = scrollView.contentOffset.y;
    CGFloat originY      = 0;
    CGFloat otherOffsetY = 0;
    if (offsetY <= GZHeadViewHeight) {
        originY              = -offsetY;
        if (offsetY < 0) {
            otherOffsetY         = 0;
        } else {
            otherOffsetY         = offsetY;
        }
    } else {
        originY              = -GZHeadViewHeight;
        otherOffsetY         = GZHeadViewHeight;
    }
    self.GZheaderView.frame = CGRectMake(0, originY, [UIScreen mainScreen].bounds.size.width, GZHeadViewHeight + GZTitleHeight);
    for ( int i = 0; i < self.titleView.gztitles.count; i++ ) {
        if (i != self.titleView.selectedIndex) {
            UITableView *contentView = self.scrollView.subviews[i];
            CGPoint offset = CGPointMake(0, otherOffsetY);
            if ([contentView isKindOfClass:[UITableView class]]) {
                if (contentView.contentOffset.y < GZHeadViewHeight || offset.y < GZHeadViewHeight) {
                    [contentView setContentOffset:offset animated:NO];
                    self.scrollView.offset = offset;
                }
            }
        }
    }
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//- (void)dealloc {
//    NSLog(@"控制器已销毁");
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
