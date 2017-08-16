//
//  UIView+GZKit.h
//  MeiChou
//
//  Created by xinshijie on 16/5/10.
//  Copyright © 2016年 Mr.quan. All rights reserved.
//



#import <UIKit/UIKit.h>


/**
 *  Direction of flip animation
 */
typedef NS_ENUM(NSInteger, UIViewAnimationFlipDirection)
{
    /**
     *  Flip animation from top
     */
    UIViewAnimationFlipDirectionFromTop = 0,
    /**
     *  Flip animation from left
     */
    UIViewAnimationFlipDirectionFromLeft,
    /**
     *  Flip animation from right
     */
    UIViewAnimationFlipDirectionFromRight,
    /**
     *  Flip animation from bottom
     */
    UIViewAnimationFlipDirectionFromBottom
};

/**
 *  Direction of the translation
 */
typedef NS_ENUM(NSInteger, UIViewAnimationTranslationDirection)
{
    /**
     *  Translation from left to right
     */
    UIViewAnimationTranslationDirectionFromLeftToRight = 0,
    /**
     *  Translation from right to left
     */
    UIViewAnimationTranslationDirectionFromRightToLeft
};

/**
 *  Direction of the linear gradient
 */
typedef NS_ENUM(NSInteger, UIViewLinearGradientDirection)
{
    /**
     *  Linear gradient vertical
     */
    UIViewLinearGradientDirectionVertical = 0,
    /**
     *  Linear gradient horizontal
     */
    UIViewLinearGradientDirectionHorizontal,
    /**
     *  Linear gradient from left to right and top to down
     */
    UIViewLinearGradientDirectionDiagonalFromLeftToRightAndTopToDown,
    /**
     *  Linear gradient from left to right and down to top
     */
    UIViewLinearGradientDirectionDiagonalFromLeftToRightAndDownToTop,
    /**
     *  Linear gradient from right to left and top to down
     */
    UIViewLinearGradientDirectionDiagonalFromRightToLeftAndTopToDown,
    /**
     *  Linear gradient from right to left and down to top
     */
    UIViewLinearGradientDirectionDiagonalFromRightToLeftAndDownToTop
};



@interface UIView (GZKit)

/**
 *  1.间隔X值
 */
@property (nonatomic, assign) CGFloat x;

/**
 *  2.间隔Y值
 */
@property (nonatomic, assign) CGFloat y;

/**
 *  3.宽度
 */
@property (nonatomic, assign) CGFloat width;

/**
 *  4.高度
 */
@property (nonatomic, assign) CGFloat height;

/**
 *  5.中心点X值
 */
@property (nonatomic, assign) CGFloat centerX;

/**
 *  6.中心点Y值
 */
@property (nonatomic, assign) CGFloat centerY;

/**
 *  7.尺寸大小
 */
@property (nonatomic, assign) CGSize size;

/**
 *  8.起始点
 */
@property (nonatomic, assign) CGPoint origin;

@property (nonatomic) CGFloat right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat bottom;      ///< Shortcut for frame.origin.y + frame.size.height

/**
 *  1.设置颜色
 */
- (UIView *(^)(UIColor *color)) setColor;

/**
 *  2.设置框架
 */
- (UIView *(^)(CGRect frame)) setFrame;

/**
 *  3.设置尺寸
 */
- (UIView *(^)(CGSize size)) setSize;

/**
 *  4.设置中心点
 */
- (UIView *(^)(CGPoint point)) setCenter;

/**
 *  5.设置标签值
 */
- (UIView *(^)(NSInteger tag)) setTag;

/**
 *  6.添加边框
 *
 *  @param color <#color description#>
 */
- (void)addBorderColor:(UIColor *)color;

/**
 *  1.给UIView添加点击事件
 */
- (void)addTarget:(id)target
           action:(SEL)action;

/**
 *  2.UIView的类初始化
 */
+ (UIView *)viewWithFrame:(CGRect)frame
          backgroundColor:(UIColor *)backgroundColor;

/**
 *  3.创建边框
 */
- (void)setBordersWithColor:(UIColor *)color
            andCornerRadius:(CGFloat)radius
                   andWidth:(CGFloat)width;

/**
 *  4.删除边框
 */
- (void)removeBorders;

/**
 *  5.创建阴影
 */
- (void)setRectShadowWithOffset:(CGSize)offset
                        opacity:(CGFloat)opacity
                         radius:(CGFloat)radius;

/**
 *  6.删除阴影
 */
- (void)removeShadow;

/**
 *  7.创建圆角半径阴影
 */
- (void)setCornerRadiusShadowWithCornerRadius:(CGFloat)cornerRadius
                                       offset:(CGSize)offset
                                      opacity:(CGFloat)opacity
                                       radius:(CGFloat)radius;



/**
 *  8.设置圆角半径
 */
- (void)setCornerRadius:(CGFloat)radius;

/**
 *  9.摇摆动画
 */
- (void)shakeView;

/**
 *  10.脉冲动画
 */
- (void)pulseViewWithTime:(CGFloat)seconds;

/**
 *  添加子View
 *
 *  @param array 添加子的ViewArray
 */
- (void)GZ_AddSubViewsWithArray:(NSArray *)array;

/**
 *  获取当前View的VC
 *
 *  @return 获取当前View的VC
 */
- (UIViewController *)getCurrentViewController;

/*!
 *  显示警告框
 *
 *  @param title   title description
 *  @param message message description
 */
- (void)gz_showAlertView:(NSString *)title message:(NSString *)message;

////提示框
//
//-(void)gz_showHUD:(NSString *)labelText hide:(NSInteger)num;   


@end
