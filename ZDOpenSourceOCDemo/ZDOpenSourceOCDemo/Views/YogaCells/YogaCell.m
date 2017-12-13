//
//  YogaCell.m
//  ZDOpenSourceOCDemo
//
//  Created by Zero.D.Saber on 2017/12/8.
//  Copyright © 2017年 Zero.D.Saber. All rights reserved.
//

#import "YogaCell.h"
#import <YogaKit/UIView+Yoga.h>
#import "TextureModel.h"
#import <ZDToolKit/ZDFunction.h>

@interface YogaCell ()
@property (nonatomic, strong) UILabel *titleLabel;    ///< 标题
@property (nonatomic, strong) UILabel *contentLabel;  ///< 内容
@property (nonatomic, strong) UIImageView *aImageView;///< 图片
@property (nonatomic, strong) UILabel *nickNameLabel; ///< 昵称
@property (nonatomic, strong) UILabel *timeLabel;     ///< 时间
@end

@implementation YogaCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setup {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self setupUI];
}

- (void)setupUI {
    self.contentView.backgroundColor = [UIColor redColor];//ZD_RandomColor();
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.aImageView];
    
    UIView *bottomContainerView = [[UIView alloc] init];
    [bottomContainerView addSubview:self.nickNameLabel];
    [bottomContainerView addSubview:self.timeLabel];
    [self.contentView addSubview:bottomContainerView];
    
    
    [self.contentLabel configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.marginTop = YGPointValue(10);
    }];
    
    [self.aImageView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.marginTop = YGPointValue(10);
    }];
    
    [bottomContainerView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionRow;
        layout.justifyContent = YGJustifySpaceBetween;
        layout.alignContent = YGAlignCenter;
        layout.marginTop = YGPointValue(10);
    }];
    
    [self.contentView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionColumn;
        layout.justifyContent = YGJustifyFlexStart;
        layout.paddingHorizontal = YGPointValue(15);
        layout.paddingVertical = YGPointValue(10);
        layout.width = YGPointValue(UIScreen.mainScreen.bounds.size.width);
    }];
}

- (void)setModel:(TextureModel *)model {
    if (!model) return;
    
    self.titleLabel.text = model.title;
    self.contentLabel.text = model.content;
    self.aImageView.image = model.imageName.length > 0 ? [UIImage imageNamed:model.imageName] : nil;
    self.nickNameLabel.text = model.username;
    self.timeLabel.text = model.time;
    
    // 根据数据改变layout
    self.contentLabel.yoga.marginTop = YGPointValue((model.title.length == 0 || model.content.length == 0) ? 0 : 10);
    self.aImageView.yoga.marginTop = YGPointValue(model.imageName.length == 0 ? 0 : 10);
    
    // 子节点置为markDirty状态，否则yoga会使用缓存高度，不会重新计算
    [self.titleLabel.yoga markDirty];
    [self.contentLabel.yoga markDirty];
    [self.aImageView.yoga markDirty];
    [self.nickNameLabel.yoga markDirty];
    [self.timeLabel.yoga markDirty];
    [self.nickNameLabel.superview.yoga markDirty];
    
    // 应用layout
    [self.contentView.yoga applyLayoutPreservingOrigin:NO dimensionFlexibility:YGDimensionFlexibilityFlexibleHeigth];
}

#pragma mark - Property

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        UILabel *node = [[UILabel alloc] init];
        node.font = [UIFont systemFontOfSize:18.0];
        node.textColor = [UIColor yellowColor];
        _titleLabel = node;
    }
    return _titleLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        UILabel *node = [UILabel new];
        node.numberOfLines = 0;
        node.font = [UIFont systemFontOfSize:16.0];
        node.textColor = [UIColor yellowColor];
        _contentLabel = node;
    }
    return _contentLabel;
}

- (UIImageView *)aImageView {
    if (!_aImageView) {
        UIImageView *node = [[UIImageView alloc] init];
        node.contentMode = UIViewContentModeLeft;
        _aImageView = node;
    }
    return _aImageView;
}

- (UILabel *)nickNameLabel {
    if (!_nickNameLabel) {
        UILabel *node = [[UILabel alloc] init];
        node.textColor = ZD_RandomColor();
        node.yoga.isEnabled = YES;
        _nickNameLabel = node;
    }
    return _nickNameLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        UILabel *node = [[UILabel alloc] init];
        node.textColor = ZD_RandomColor();
        node.yoga.isEnabled = YES;
        _timeLabel = node;
    }
    return _timeLabel;
}

@end






