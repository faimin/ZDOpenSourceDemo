//
//  ZDPlayground.m
//  ZDOpenSourceOCDemo
//
//  Created by Zero.D.Saber on 2017/8/8.
//  Copyright © 2017年 Zero.D.Saber. All rights reserved.
//

#if __has_include(<KZPlayground/KZPPlayground.h>)

#import "ZDPlayground.h"
#import <YogaKit/UIView+Yoga.h>

@implementation ZDPlayground

- (void)setup {
    KZPShow(@"playground start");
}

- (void)run {
    [self yogaKitExample];
}

- (void)yogaKitExample {
    self.worksheetView.backgroundColor = [UIColor grayColor];
    self.worksheetView.yoga.isEnabled = YES;
    
    UIView *containerView = [UIView new];
    containerView.backgroundColor = [UIColor cyanColor];
    [containerView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(CGRectGetWidth(self.worksheetView.bounds));
        layout.height = layout.width;
        layout.direction = YGDirectionLTR;
        layout.flexDirection = YGFlexDirectionRow;  // 主轴方向
        layout.flexWrap = YGWrapWrap;   // 是否换行
        layout.justifyContent = YGJustifySpaceAround; // 主轴上的两端对齐方式
        layout.alignItems = YGAlignCenter;  // 交叉轴(跟主轴相对的轴)上的对齐方式,此属性只是针对一条主轴的情况
        layout.alignContent = YGAlignSpaceBetween;  // 此属性跟上面的一样,只是这个针对的是多根主轴的情况,所以只有一根主轴时,此属性不起作用
    }];
    KZPShow(containerView);
    
    UIView *child1 = [UIView new];
    child1.backgroundColor = [UIColor redColor];
    [child1 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(200);
        layout.height = YGPointValue(100);
        //layout.alignSelf = YGAlignFlexEnd; // 单独指定自己的align,有点通过子类覆写父类的方法来达到修改的目的
    }];
    KZPShow(child1);
    
    UIView *child2 = [UIView new];
    child2.backgroundColor = [UIColor greenColor];
    [child2 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(100);
        layout.height = YGPointValue(300);
    }];
    KZPShow(child2);
    
    UIView *child3 = [UIView new];
    child3.backgroundColor = [UIColor blueColor];
    [child3 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(100);
        layout.height = YGPointValue(200);
    }];
    KZPShow(child3);
    
    [containerView addSubview:child1];
    [containerView addSubview:child2];
    [containerView addSubview:child3];
    [self.worksheetView addSubview:containerView];
    
    [containerView.yoga applyLayoutPreservingOrigin:NO dimensionFlexibility:YGDimensionFlexibilityFlexibleHeigth];
    
    CGSize size = [containerView.yoga calculateLayoutWithSize:CGSizeMake(CGRectGetWidth(self.worksheetView.bounds), CGRectGetWidth(self.worksheetView.bounds))];
    CGSize intrinsicSize = containerView.yoga.intrinsicSize;
    NSLog(@"size = %@, intrinsicSize = %@", NSStringFromCGSize(size), NSStringFromCGSize(intrinsicSize));
}

@end

#endif
