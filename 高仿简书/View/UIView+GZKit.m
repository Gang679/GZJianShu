
//
//  UIView+BAKit.m
//  MeiChou
//
//  Created by xinshijie on 16/5/10.
//  Copyright © 2016年 Mr.quan. All rights reserved.
//


#import "UIView+GZKit.h"

@implementation UIView (GZKit)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (UIView * (^)(CGFloat x))setX {
    return ^(CGFloat x) {
        self.x = x;
        return self;
    };
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (UIView *(^)(UIColor *color)) setColor
{
    return ^ (UIColor *color) {
        self.backgroundColor = color;
        return self;
    };
}

- (UIView *(^)(CGRect frame)) setFrame
{
    return ^ (CGRect frame) {
        self.frame = frame;
        return self;
    };
}

- (UIView *(^)(CGSize size)) setSize
{
    return ^ (CGSize size) {
        self.bounds = CGRectMake(0, 0, size.width, size.height);
        return self;
    };
}

- (UIView *(^)(CGPoint point)) setCenter
{
    return ^ (CGPoint point) {
        self.center = point;
        return self;
    };
}

- (UIView *(^)(NSInteger tag)) setTag
{
    return ^ (NSInteger tag) {
        self.tag = tag;
        return self;
    };
}

/* 1.给UIView添加点击事件*/
- (void)addTarget:(id)target
           action:(SEL)action;
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:target
                                                                         action:action];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
}

/* 2.UIView初始化 */
+ (UIView *)viewWithFrame:(CGRect)frame
          backgroundColor:(UIColor *)backgroundColor
{
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = backgroundColor;
    return view;
}

/* 3.创建边框 */
- (void)setBordersWithColor:(UIColor *)color
            andCornerRadius:(CGFloat)radius
                   andWidth:(CGFloat)width
{
    // 设置边框宽度
    self.layer.borderWidth = width;
    // 设置圆角半径
    self.layer.cornerRadius = radius;
    // 设置是否栅格化
    self.layer.shouldRasterize = NO;
    // 设置栅格化规模
    self.layer.rasterizationScale = 2;
    // 设置边缘抗锯齿遮盖
    self.layer.edgeAntialiasingMask = kCALayerLeftEdge | kCALayerRightEdge | kCALayerBottomEdge | kCALayerTopEdge;
    // 设置边界剪切
    self.clipsToBounds = YES;
    // 设置边界是否遮盖
    self.layer.masksToBounds = YES;
    
    // 创建颜色空间
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    CGColorRef cgColor = [color CGColor];
    self.layer.borderColor = cgColor;
    CGColorSpaceRelease(space);
}


- (void)addBorderColor:(UIColor *)color{
    
        
}
/* 4.删除边框 */
- (void)removeBorders
{
    self.layer.borderWidth = 0;
    self.layer.cornerRadius = 0;
    self.layer.borderColor = nil;
}


/* 5.删除阴影 */
- (void)removeShadow
{
    [self.layer setShadowColor:[[UIColor clearColor] CGColor]];
    [self.layer setShadowOpacity:0.0f];
    [self.layer setShadowOffset:CGSizeMake(0.0f, 0.0f)];
}

/* 6.设置圆角半径 */
- (void)setCornerRadius:(CGFloat)radius
{
    CALayer *roundedlayer = [self layer];
    roundedlayer.cornerRadius = radius;
    [roundedlayer setMasksToBounds:YES];
}

/* 7.创建阴影 */
- (void)setRectShadowWithOffset:(CGSize)offset
                        opacity:(CGFloat)opacity
                         radius:(CGFloat)radius
{
    // 设置阴影的颜色
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    // 设置阴影的透明度
    self.layer.shadowOpacity = opacity;
    // 设置阴影的偏移量
    self.layer.shadowOffset = offset;
    // 设置阴影的模糊程度
    self.layer.shadowRadius = radius;
    // 设置边界是否遮盖
    self.layer.masksToBounds = NO;
}

/* 8.创建圆角半径阴影 */
- (void)setCornerRadiusShadowWithCornerRadius:(CGFloat)cornerRadius
                                       offset:(CGSize)offset
                                      opacity:(CGFloat)opacity
                                       radius:(CGFloat)radius
{
    // 设置阴影的颜色
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    // 设置阴影的透明度
    self.layer.shadowOpacity = opacity;
    // 设置阴影的偏移量
    self.layer.shadowOffset = offset;
    // 设置阴影的模糊程度
    self.layer.shadowRadius = radius;
    // 设置是否栅格化
    self.layer.shouldRasterize = YES;
    // 设置圆角半径
    self.layer.cornerRadius = cornerRadius;
    // 设置阴影的路径
    self.layer.shadowPath = [[UIBezierPath bezierPathWithRoundedRect:[self bounds]
                                                        cornerRadius:cornerRadius] CGPath];
    // 设置边界是否遮盖
    self.layer.masksToBounds = NO;
}

/* 9.摇摆动画 */
- (void)shakeView
{
    // 创建关键帧动画类
    CAKeyframeAnimation *shake = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    // 设置每个关键帧的值对象的数组
    shake.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeTranslation(-5.0f, 0.0f, 0.0f)],
                     [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(5.0f, 0.0f, 0.0f)]];
    // 设置是否自动翻转
    shake.autoreverses = YES;
    // 设置重复次数
    shake.repeatCount = 2.0f;
    // 设置间隔时间
    shake.duration = 0.07f;
    // 添加动画
    [self.layer addAnimation:shake
                      forKey:@"Shake"];
}

/* 10.脉冲动画 */
- (void)pulseViewWithTime:(CGFloat)seconds
{
    [self pulseViewWithDuration:seconds];
}


- (void)createGradientWithColors:(NSArray *)colors direction:(UIViewLinearGradientDirection)direction
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.bounds;
    
    NSMutableArray *mutableColors = colors.mutableCopy;
    for(int i = 0; i < colors.count; i++)
    {
        UIColor *currentColor = colors[i];
        [mutableColors replaceObjectAtIndex:i withObject:(id)currentColor.CGColor];
    }
    gradient.colors = mutableColors;
    
    switch (direction)
    {
        case UIViewLinearGradientDirectionVertical:
        {
            gradient.startPoint = CGPointMake(0.5f, 0.0f);
            gradient.endPoint = CGPointMake(0.5f, 1.0f);
            break;
        }
        case UIViewLinearGradientDirectionHorizontal:
        {
            gradient.startPoint = CGPointMake(0.0f, 0.5f);
            gradient.endPoint = CGPointMake(1.0f, 0.5f);
            break;
        }
        case UIViewLinearGradientDirectionDiagonalFromLeftToRightAndTopToDown:
        {
            gradient.startPoint = CGPointMake(0.0f, 0.0f);
            gradient.endPoint = CGPointMake(1.0f, 1.0f);
            break;
        }
        case UIViewLinearGradientDirectionDiagonalFromLeftToRightAndDownToTop:
        {
            gradient.startPoint = CGPointMake(0.0f, 1.0f);
            gradient.endPoint = CGPointMake(1.0f, 0.0f);
            break;
        }
        case UIViewLinearGradientDirectionDiagonalFromRightToLeftAndTopToDown:
        {
            gradient.startPoint = CGPointMake(1.0f, 0.0f);
            gradient.endPoint = CGPointMake(0.0f, 1.0f);
            break;
        }
        case UIViewLinearGradientDirectionDiagonalFromRightToLeftAndDownToTop:
        {
            gradient.startPoint = CGPointMake(1.0f, 1.0f);
            gradient.endPoint = CGPointMake(0.0f, 0.0f);
            break;
        }
        default:
        {
            break;
        }
    }
    [self.layer insertSublayer:gradient atIndex:0];
}


- (void)pulseViewWithDuration:(CGFloat)duration
{
    [UIView animateWithDuration:duration / 6 animations:^{
        [self setTransform:CGAffineTransformMakeScale(1.1, 1.1)];
    } completion:^(BOOL finished) {
        if(finished)
        {
            [UIView animateWithDuration:duration / 6 animations:^{
                [self setTransform:CGAffineTransformMakeScale(0.96, 0.96)];
            } completion:^(BOOL finished) {
                if(finished)
                {
                    [UIView animateWithDuration:duration / 6 animations:^{
                        [self setTransform:CGAffineTransformMakeScale(1.03, 1.03)];
                    } completion:^(BOOL finished) {
                        if(finished)
                        {
                            [UIView animateWithDuration:duration / 6 animations:^{
                                [self setTransform:CGAffineTransformMakeScale(0.985, 0.985)];
                            } completion:^(BOOL finished) {
                                if(finished)
                                {
                                    [UIView animateWithDuration:duration / 6 animations:^{
                                        [self setTransform:CGAffineTransformMakeScale(1.007, 1.007)];
                                    } completion:^(BOOL finished) {
                                        if(finished)
                                        {
                                            [UIView animateWithDuration:duration / 6 animations:^{
                                                [self setTransform:CGAffineTransformMakeScale(1, 1)];
                                            } completion:nil];
                                        }
                                    }];
                                }
                            }];
                        }
                    }];
                }
            }];
        }
    }];
}



- (void)heartbeatViewWithDuration:(CGFloat)duration
{
    float maxSize = 1.4f, durationPerBeat = 0.5f;
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    CATransform3D scale1 = CATransform3DMakeScale(0.8, 0.8, 1);
    CATransform3D scale2 = CATransform3DMakeScale(maxSize, maxSize, 1);
    CATransform3D scale3 = CATransform3DMakeScale(maxSize - 0.3f, maxSize - 0.3f, 1);
    CATransform3D scale4 = CATransform3DMakeScale(1.0, 1.0, 1);
    
    NSArray *frameValues = [NSArray arrayWithObjects:[NSValue valueWithCATransform3D:scale1], [NSValue valueWithCATransform3D:scale2], [NSValue valueWithCATransform3D:scale3], [NSValue valueWithCATransform3D:scale4], nil];
    
    [animation setValues:frameValues];
    
    NSArray *frameTimes = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.05], [NSNumber numberWithFloat:0.2], [NSNumber numberWithFloat:0.6], [NSNumber numberWithFloat:1.0], nil];
    [animation setKeyTimes:frameTimes];
    
    animation.fillMode = kCAFillModeForwards;
    animation.duration = durationPerBeat;
    animation.repeatCount = duration / durationPerBeat;
    
    [self.layer addAnimation:animation forKey:@"heartbeat"];
}

- (void)applyMotionEffects
{
    UIInterpolatingMotionEffect *horizontalEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    horizontalEffect.minimumRelativeValue = @(-10.0f);
    horizontalEffect.maximumRelativeValue = @(10.0f);
    UIInterpolatingMotionEffect *verticalEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    verticalEffect.minimumRelativeValue = @(-10.0f);
    verticalEffect.maximumRelativeValue = @(10.0f);
    UIMotionEffectGroup *motionEffectGroup = [[UIMotionEffectGroup alloc] init];
    motionEffectGroup.motionEffects = @[horizontalEffect, verticalEffect];
    
    [self addMotionEffect:motionEffectGroup];
}

- (void)flipWithDuration:(NSTimeInterval)duration direction:(UIViewAnimationFlipDirection)direction
{
    NSString *subtype = nil;
    
    switch(direction)
    {
        case UIViewAnimationFlipDirectionFromTop:
            subtype = @"fromTop";
            break;
        case UIViewAnimationFlipDirectionFromLeft:
            subtype = @"fromLeft";
            break;
        case UIViewAnimationFlipDirectionFromBottom:
            subtype = @"fromBottom";
            break;
        case UIViewAnimationFlipDirectionFromRight:
        default:
            subtype = @"fromRight";
            break;
    }
    
    CATransition *transition = [CATransition animation];
    
    transition.startProgress = 0;
    transition.endProgress = 1.0;
    transition.type = @"flip";
    transition.subtype = subtype;
    transition.duration = duration;
    transition.repeatCount = 1;
    transition.autoreverses = 1;
    
    [self.layer addAnimation:transition forKey:@"flip"];
}

- (void)translateAroundTheView:(UIView *)topView duration:(CGFloat)duration direction:(UIViewAnimationTranslationDirection)direction repeat:(BOOL)repeat startFromEdge:(BOOL)startFromEdge
{
    CGFloat startPosition = self.center.x, endPosition;
    switch(direction)
    {
        case UIViewAnimationTranslationDirectionFromLeftToRight:
        {
            startPosition = self.frame.size.width / 2;
            endPosition = -(self.frame.size.width / 2) + topView.frame.size.width;
            break;
        }
        case UIViewAnimationTranslationDirectionFromRightToLeft:
        default:
        {
            startPosition = -(self.frame.size.width / 2) + topView.frame.size.width;
            endPosition = self.frame.size.width / 2;
            break;
        }
    }
    
    if(startFromEdge)
    {
        [self setCenter:CGPointMake(startPosition, self.center.y)];
    }
    
    [UIView animateWithDuration:duration / 2 delay:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self setCenter:CGPointMake(endPosition, self.center.y)];
    } completion:^(BOOL finished) {
        if(finished)
        {
            [UIView animateWithDuration:duration / 2 delay:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                [self setCenter:CGPointMake(startPosition, self.center.y)];
            } completion:^(BOOL finished) {
                if(finished)
                {
                    if(repeat)
                    {
                        [self translateAroundTheView:topView duration:duration direction:direction repeat:repeat startFromEdge:startFromEdge];
                    }
                }
            }];
        }
    }];
}

- (UIImage *)screenshot
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *imageData = UIImagePNGRepresentation(image);
    image = [UIImage imageWithData:imageData];
    
    return image;
}

- (UIImage *)saveScreenshot
{
    UIImage *image = [self screenshot];
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    
    return image;
}

/**
 *  添加子View
 *
 *  @param array 添加子的ViewArray
 */
- (void)GZ_AddSubViewsWithArray:(NSArray *)array
{
    if (array)
    {
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self addSubview:obj];
        }];
    }
    else
    {
//        NSLog(@"数组 %@ 为空！", array);
    }
}

/**
 *  获取当前View的VC
 *
 *  @return 获取当前View的VC
 */
- (UIViewController *)getCurrentViewController
{
    for (UIView *view = self; view; view = view.superview)
    {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

- (void)gz_showAlertView:(NSString *)title message:(NSString *)message
{
    [[[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil] show];
}
//
//-(void)gz_showHUD:(NSString *)labelText hide:(NSInteger)num{
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
//    hud.mode = MBProgressHUDModeText;
//    //设置显示文本
//    hud.labelText = labelText;
//    //设置显示时间
//    [hud hide: YES afterDelay: num];
//
//}
@end
