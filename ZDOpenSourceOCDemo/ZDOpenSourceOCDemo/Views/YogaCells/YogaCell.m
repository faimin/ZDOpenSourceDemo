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
    [self setupUI];
}

- (void)setupUI {
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.aImageView];
    
    UIView *bottomContainerView = [[UIView alloc] init];
    [bottomContainerView addSubview:self.nickNameLabel];
    [bottomContainerView addSubview:self.timeLabel];
    [self.contentView addSubview:bottomContainerView];
    
    [self.nickNameLabel configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
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
        layout.marginTop = YGPointValue(10);
    }];
    
    [self.contentView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionColumn;
        layout.justifyContent = YGJustifyFlexStart;
        layout.paddingHorizontal = YGPointValue(15);
        layout.paddingVertical = YGPointValue(10);
    }];
}

- (void)setModel:(TextureModel *)model {
    if (!model) return;
    
    self.titleLabel.text = model.title;
    self.contentLabel.text = model.content;
    self.aImageView.image = model.imageName.length > 0 ? [UIImage imageNamed:model.imageName] : nil;
    self.nickNameLabel.text = model.username;
    self.timeLabel.text = model.time;
}

#pragma mark -

- (CGFloat)cellHeightWithModel:(TextureModel *)model {
    self.model = model;
    //[self.contentView.yoga applyLayoutPreservingOrigin:NO];
    CGSize size = [self.contentView.yoga calculateLayoutWithSize:CGSizeMake(CGRectGetWidth(self.contentView.frame), CGFLOAT_MAX)];
    NSLog(@"%s, size = %@", __PRETTY_FUNCTION__, NSStringFromCGSize(size));
    return size.height;
}

#pragma mark - Property

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        UILabel *node = [[UILabel alloc] init];
        _titleLabel = node;
    }
    return _titleLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        UILabel *node = [UILabel new];
        node.numberOfLines = 0;
        _contentLabel = node;
    }
    return _contentLabel;
}

- (UIImageView *)aImageView {
    if (!_aImageView) {
        UIImageView *node = [[UIImageView alloc] init];
        //node.defaultImage = [UIImage imageNamed:@"hami03"];
        _aImageView = node;
    }
    return _aImageView;
}

- (UILabel *)nickNameLabel {
    if (!_nickNameLabel) {
        UILabel *node = [[UILabel alloc] init];
        _nickNameLabel = node;
    }
    return _nickNameLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        UILabel *node = [[UILabel alloc] init];
        _timeLabel = node;
    }
    return _timeLabel;
}

@end






