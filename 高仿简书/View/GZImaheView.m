//
//  GZImaheView.m
//  高仿简书
//
//  Created by xinshijie on 2017/7/15.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import "GZImaheView.h"

static NSString *const ContentOffset = @"contentOffset";

@interface GZImaheView ()

@property (nonatomic, strong) UIImageView *yourImages;
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, copy) ClickImageBlock clickImageBlock;

@end

@implementation GZImaheView

- (instancetype)initWithImage:(UIImage *)image {
    self = [super init];
    if (self) {
        [self buildingUI];
        self.YourImage = image;
    }
    return self;
}

- (void)dealloc {
    if (_scrollView) {
        [_scrollView removeObserver:self forKeyPath:ContentOffset context:nil];
    }
}

#pragma mark -
#pragma mark - external calling methods
- (void)reloadSizeWithScrollView:(UIScrollView *)scrollView {
    self.scrollView = scrollView;
    [self.scrollView addObserver:self forKeyPath:ContentOffset options:NSKeyValueObservingOptionNew context:nil];
}

- (void)handleClickActionWithBlock:(ClickImageBlock)block {
    self.clickImageBlock = block;
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tag = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(yourImagesClick:)];
    [self addGestureRecognizer:tag];
}

#pragma mark -
#pragma mark - setter methods
- (void)setYourImage:(UIImage *)YourImage {
    _YourImage = YourImage;
    [self.yourImages setImage:YourImage ];
}

#pragma mark -
#pragma mark - building UI methods
- (void)buildingUI {
    CGFloat kWidth = 60;
    
    self.frame = CGRectMake(0, 0, kWidth, kWidth);
    
    self.yourImages = [[UIImageView alloc]init];
    _yourImages.frame = CGRectMake(0, 0, kWidth, kWidth);
    _yourImages.center = CGPointMake(kWidth / 2, kWidth / 2);
    _yourImages.backgroundColor = [UIColor clearColor];
    _yourImages.layer.borderWidth = 0.5f;
    _yourImages.layer.cornerRadius = kWidth / 2;
    _yourImages.layer.borderColor = [UIColor colorWithWhite:0.5 alpha:0.5].CGColor;
    _yourImages.clipsToBounds = YES;
    [self addSubview:_yourImages];
}

#pragma mark -
#pragma mark - reload image size handle methods
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:ContentOffset] && object == self.scrollView) {
        
        CGFloat offsetY = self.scrollView.contentOffset.y;
        CGFloat scale = 1.0;
        if (offsetY < 0) { // 放大
            scale = MIN(1.5, 1 - offsetY / 300);//简书没有这个功能
        } else if (offsetY > 0) { // 缩小
            scale = MAX(0.40, 1 - offsetY / 300);
        }
        self.yourImages.transform = CGAffineTransformMakeScale(scale, scale);
        
        CGRect frame = self.yourImages.frame;
        frame.origin.y = 15;
        self.yourImages.frame = frame;
    }
}

- (void)yourImagesClick:(UITapGestureRecognizer *)sender {
    if (_clickImageBlock) {
        _clickImageBlock();
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
