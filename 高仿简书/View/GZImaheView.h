//
//  GZImaheView.h
//  高仿简书
//
//  Created by xinshijie on 2017/7/15.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClickImageBlock) (void);

@interface GZImaheView : UIView

/**
 * @property image: 头像图片
 */
@property (nonatomic, strong) UIImage *YourImage;

/** 初始化方法
 * 头像图片
 */
- (instancetype)initWithImage:(UIImage *)image;

/** 更新头像大小
 * 滚动视图
 */
- (void)reloadSizeWithScrollView:(UIScrollView *)scrollView;

/**
 * 点击头像回调
 */
- (void)handleClickActionWithBlock:(ClickImageBlock)block;

@end
