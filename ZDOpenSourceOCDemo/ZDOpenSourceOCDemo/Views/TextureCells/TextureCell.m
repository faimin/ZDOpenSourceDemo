//
//  TextureCell.m
//  ZDOpenSourceOCDemo
//
//  Created by Zero.D.Saber on 2017/10/23.
//  Copyright © 2017年 Zero.D.Saber. All rights reserved.
//

#import "TextureCell.h"
#import "TextureModel.h"

@interface TextureCell ()
@property (nonatomic, strong) TextureModel *model;

@property (nonatomic, strong) ASTextNode *titleNode;    ///< 标题
@property (nonatomic, strong) ASTextNode *contentNode;  ///< 内容
@property (nonatomic, strong) ASNetworkImageNode *imageNode;///< 图片
@property (nonatomic, strong) ASTextNode *nickNameNode; ///< 昵称
@property (nonatomic, strong) ASTextNode *timeNode;     ///< 时间
@end

@implementation TextureCell

- (instancetype)initWithModel:(TextureModel *)model {
    if (self = [super init]) {
        _model = model;
        [self setup];
    }
    return self;
}

- (void)didLoad {
    [super didLoad];
    // View创建成功之后的回调方法
}

- (void)setup {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self setupNodes];
}

- (void)setupNodes {
    [self addSubnode:self.titleNode];
    [self addSubnode:self.contentNode];
    [self addSubnode:self.imageNode];
    [self addSubnode:self.nickNameNode];
    [self addSubnode:self.timeNode];
    
    _titleNode.attributedText = [[NSAttributedString alloc] initWithString:_model.title attributes:@{NSForegroundColorAttributeName : [UIColor lightGrayColor], NSFontAttributeName : [UIFont systemFontOfSize:17.0]}];
    _contentNode.attributedText = [[NSAttributedString alloc] initWithString:_model.content attributes:@{NSForegroundColorAttributeName : [UIColor lightGrayColor], NSFontAttributeName : [UIFont systemFontOfSize:14.0]}];
    _imageNode.image = _model.imageName.length > 0 ? [UIImage imageNamed:_model.imageName] : nil;
    _nickNameNode.attributedText = [[NSAttributedString alloc] initWithString:_model.username attributes:@{NSForegroundColorAttributeName : [UIColor lightGrayColor], NSFontAttributeName : [UIFont systemFontOfSize:14.0]}];
    _timeNode.attributedText = [[NSAttributedString alloc] initWithString:_model.time attributes:@{NSForegroundColorAttributeName : [UIColor lightGrayColor], NSFontAttributeName : [UIFont systemFontOfSize:14.0]}];
}

#pragma mark - Layout

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    //[ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:50.0 justifyContent:ASStackLayoutJustifyContentSpaceAround alignItems:ASStackLayoutAlignItemsStretch children:@[_nickNameNode, _timeNode]];
    ASStackLayoutSpec *horBottomContentStackLayout = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:100 justifyContent:ASStackLayoutJustifyContentSpaceAround alignItems:ASStackLayoutAlignItemsStretch flexWrap:ASStackLayoutFlexWrapNoWrap alignContent:ASStackLayoutAlignContentStart children:@[_nickNameNode, _timeNode]];
    
    ASStackLayoutSpec *verContentStackLayout = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:10.0 justifyContent:ASStackLayoutJustifyContentSpaceAround alignItems:ASStackLayoutAlignItemsStart flexWrap:ASStackLayoutFlexWrapNoWrap alignContent:ASStackLayoutAlignContentStart lineSpacing:0 children:({
        NSMutableArray<id<ASLayoutElement>> *childNodes = @[].mutableCopy;
        _model.title.length > 0 ? [childNodes addObject:_titleNode] : nil;
        _model.content.length > 0 ? [childNodes addObject:_contentNode] : nil;
        _model.imageName.length > 0 ? [childNodes addObject:_imageNode] : nil;
        [childNodes addObject:horBottomContentStackLayout];
        childNodes;
    })];
    
    ASInsetLayoutSpec *insetLayout = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 15, 10, 15) child:verContentStackLayout];
    
    return insetLayout;
}

- (void)layout {
    [super layout];
    // 单独调整个别node的位置
    _timeNode.frame = (CGRect){CGRectGetWidth(self.bounds) - CGRectGetWidth(_timeNode.bounds) - 15, CGRectGetMinY(_timeNode.frame), _timeNode.bounds.size};
}

#pragma mark - Property

- (ASTextNode *)titleNode {
    if (!_titleNode) {
        ASTextNode *node = [[ASTextNode alloc] init];
        node.placeholderEnabled = YES;
        node.placeholderColor = [UIColor lightGrayColor];
        node.layerBacked = YES;
        node.maximumNumberOfLines = 1;
        
        _titleNode = node;
    }
    return _titleNode;
}

- (ASTextNode *)contentNode {
    if (!_contentNode) {
        ASTextNode *node = [ASTextNode new];
        node.placeholderEnabled = YES;
        node.placeholderColor = [UIColor grayColor];
        node.layerBacked = YES;
        node.maximumNumberOfLines = 0;
        
        _contentNode = node;
    }
    return _contentNode;
}

- (ASNetworkImageNode *)imageNode {
    if (!_imageNode) {
        ASNetworkImageNode *node = [[ASNetworkImageNode alloc] init];
        node.placeholderEnabled = YES;
        node.placeholderColor = [UIColor yellowColor];
        node.layerBacked = YES;
        node.defaultImage = [UIImage imageNamed:@"hami03"];
        
        _imageNode = node;
    }
    return _imageNode;
}

- (ASTextNode *)nickNameNode {
    if (!_nickNameNode) {
        ASTextNode *node = [[ASTextNode alloc] init];
        node.placeholderEnabled = YES;
        node.placeholderColor = [UIColor lightGrayColor];
        node.layerBacked = YES;
        node.maximumNumberOfLines = 1;
        
        _nickNameNode = node;
    }
    return _nickNameNode;
}

- (ASTextNode *)timeNode {
    if (!_timeNode) {
        ASTextNode *node = [[ASTextNode alloc] init];
        node.placeholderEnabled = YES;
        node.placeholderColor = [UIColor lightGrayColor];
        node.layerBacked = YES;
        node.maximumNumberOfLines = 1;
        
        _timeNode = node;
    }
    return _timeNode;
}












@end
