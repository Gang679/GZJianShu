//
//  GZContentScrollView.m
//  高仿简书
//
//  Created by xinshijie on 2017/7/16.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import "GZContentScrollView.h"

@implementation GZContentScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.clipsToBounds = NO;
    }
    return self;
}

- (void)setOffset:(CGPoint)offset {
    _offset = offset;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view       = [super hitTest:point withEvent:event];
    BOOL hitHead       = point.y < (GZHeadViewHeight - self.offset.y);
    if (hitHead || !view) {
        self.scrollEnabled = NO;
        if (!view) {
            for (UIView* subView in self.subviews) {
                if (subView.frame.origin.x == self.contentOffset.x) {
                    view = subView;
                }
            }
        }
        return view;
    } else {
        self.scrollEnabled = YES;
        return view;
    }
}
@end
