//
//  GZHeaderView.m
//  高仿简书
//
//  Created by xinshijie on 2017/7/16.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import "GZHeaderView.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface GZHeaderView ()
@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *infoLabel;

@property (nonatomic, strong) UIButton *editInfoButton;

@property (nonatomic, strong) UIButton *Address;

@end

@implementation GZHeaderView
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    if ([view isKindOfClass:[UIButton class]]) {
        return view;
    }
    return nil;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self addSubview:self.nameLabel];
    [self addSubview:self.Address];
    [self addSubview:self.infoLabel];
    [self addSubview:self.editInfoButton];
}
- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
        _nameLabel.center = CGPointMake(kScreenWidth / 2, 60);
        _nameLabel.text = @"轻斟浅醉17";
        _nameLabel.textAlignment = 1;
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.font = [UIFont boldSystemFontOfSize:18];
    }
    return _nameLabel;
}

- (UIButton *)Address {
    if (!_Address) {
        _Address = [UIButton buttonWithType:UIButtonTypeCustom];
        _Address.frame = CGRectMake(0, 0, 46, 20);
        _Address.center = CGPointMake(kScreenWidth / 2, 85);
        [_Address setTitle:@"陕西" forState:UIControlStateNormal];
        _Address.titleLabel.font = [UIFont boldSystemFontOfSize:11];
        [_Address setTitleColor:HEXCOLOR(0x000000) forState:UIControlStateNormal];
        [_Address addTarget:self action:@selector(handleEditAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _Address;
}

- (UILabel *)infoLabel {
    if (!_infoLabel) {
        _infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 100)];
        _infoLabel.center = CGPointMake(kScreenWidth / 2, 140);
        _infoLabel.text = @"GitHub:https://github.com/Gang679\n\n新浪微博 : 轻斟浅醉17\n\n博客园 : http://www.cnblogs.com/Gang679/\n\n写了74074字，获得446个喜欢";
        _infoLabel.textAlignment = 1;
        _infoLabel.backgroundColor = [UIColor clearColor];
        _infoLabel.textColor = [UIColor darkTextColor];
        _infoLabel.numberOfLines = 0;
        _infoLabel.font = [UIFont systemFontOfSize:11];
    }
    return _infoLabel;
}

- (UIButton *)editInfoButton {
    if (!_editInfoButton) {
        _editInfoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _editInfoButton.frame = CGRectMake(0, 0, 86, 27);
        _editInfoButton.center = CGPointMake(kScreenWidth / 2, 205);
        [_editInfoButton setTitle:@"编辑个人资料" forState:UIControlStateNormal];
        _editInfoButton.titleLabel.font = [UIFont boldSystemFontOfSize:11];
        [_editInfoButton setTitleColor:HEXCOLOR(0x88e47a) forState:UIControlStateNormal];
        _editInfoButton.layer.borderColor = HEXCOLOR(0x88e47a).CGColor;
        _editInfoButton.layer.cornerRadius = 2;
        _editInfoButton.layer.borderWidth = 0.5f;
        [_editInfoButton addTarget:self action:@selector(handleEditAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _editInfoButton;
}

- (void)handleEditAction:(UIButton *)sender {
    
}
@end
