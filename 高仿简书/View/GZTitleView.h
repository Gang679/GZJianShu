//
//  GZTitleView.h
//  高仿简书
//
//  Created by xinshijie on 2017/7/16.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GZTitleView : UIView

@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, strong) NSArray *gztitles;
@property (nonatomic, copy) void (^buttonSelected)(NSInteger index);


@end
