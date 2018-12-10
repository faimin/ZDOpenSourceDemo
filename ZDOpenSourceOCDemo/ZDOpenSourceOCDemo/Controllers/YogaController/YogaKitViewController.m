//
//  YogaViewController.m
//  ZDOpenSourceOCDemo
//
//  Created by Zero.D.Saber on 2017/8/8.
//  Copyright © 2017年 Zero.D.Saber. All rights reserved.
//
//  布局说明:
//  http://www.ruanyifeng.com/blog/2015/07/flex-grammar.html
//  https://github.com/jakemarsh/core-layout
//  Yoga 教程: 使用跨平台布局引擎:https://archimboldi.me/posts/%E7%BF%BB%E8%AF%91-yoga-%E6%95%99%E7%A8%8B-%E4%BD%BF%E7%94%A8%E8%B7%A8%E5%B9%B3%E5%8F%B0%E5%B8%83%E5%B1%80%E5%BC%95%E6%93%8E.html

#import "YogaKitViewController.h"
#import <YogaKit/UIView+Yoga.h>

@interface YogaKitViewController ()

@end

@implementation YogaKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setup];
}

//  Safe Area Layout Guides: https://github.com/facebook/yoga/issues/774
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self.view.yoga applyLayoutPreservingOrigin:YES];
}

#pragma mark -

- (void)setup {
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self setupUI];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor grayColor];
    
    [self.view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.justifyContent = YGJustifySpaceBetween;
        layout.flexDirection = YGFlexDirectionColumn;
        layout.flexWrap = YGWrapWrap;
        layout.alignItems = YGAlignCenter;
        
        //layout.paddingLeft = layout.paddingRight = YGPointValue(20); // self.view的左右内边距
        layout.paddingBottom = YGPointValue(50 + 64); // 调整self.view与其子视图之间的间距(这个64是导航栏的高度)
    }];
    
    
    UIView *containerView1 = [UIView new];
    containerView1.backgroundColor = [UIColor cyanColor];
    [containerView1 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = layout.height = YGPointValue(CGRectGetWidth(self.view.bounds));
        layout.direction = YGDirectionLTR;
        layout.flexDirection = YGFlexDirectionRow;      // 主轴方向(默认为Column类型)
        layout.flexWrap = YGWrapWrap;                   // 是否换行
        layout.justifyContent = YGJustifySpaceAround;   // 主轴上的两端对齐方式
        layout.alignItems = YGAlignCenter;              // 交叉轴(跟主轴相对的轴)上的对齐方式,此属性只是针对一条主轴的情况
        layout.alignContent = YGAlignSpaceBetween;      // 此属性跟上面的一样,只是这个针对的是多根主轴的情况,所以只有一根主轴时,此属性不起作用
    }];
    
    
    UIView *child1 = [UIView new];
    child1.backgroundColor = [UIColor redColor];
    [child1 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(200);
        layout.height = YGPointValue(200);
        //layout.alignSelf = YGAlignFlexEnd; // 单独指定自己的align,有点通过子类覆写父类的方法来达到修改的目的
        
        layout.justifyContent = YGJustifyFlexEnd;
        layout.alignItems = YGAlignFlexEnd;
    }];
    
    UIView *leaf = [UIView new];
    leaf.backgroundColor = [UIColor yellowColor];
    [leaf configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(50);
        layout.height = YGPointValue(50);
        /* 这几个属性的设置影响其子视图的显示
        layout.marginRight = YGPointValue(20);
        layout.marginBottom = YGPointValue(10);
        layout.borderWidth = 50; // 扩大视图的大小,此时视图的size将会变成{100, 100},负数不起作用
        */
        
        layout.flexDirection = YGFlexDirectionRow;
        layout.alignContent = YGAlignStretch;   // 针对多个主轴
        layout.alignItems = YGAlignStretch;     // 让子视图达到填充效果
    }];
    [child1 addSubview:leaf];

    UIView *leafleaf = [UIView new];
    leafleaf.backgroundColor = [UIColor purpleColor];
    [leafleaf configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        // flex-grow的默认值为0,如果没有显示定义该属性,是不会拥有分配剩余空间权利的.
        // 如果要视图填充父视图,需要设置flexGrow (默认为0).
        // 这个属性是谁要拉伸,就谁自己设置,而不是其父视图设置.
        layout.flexGrow = 1;
        layout.margin = YGPointValue(10);
        // layout.borderWidth = 20;
    }];
    [leaf addSubview:leafleaf];
    
    
    UIView *child2 = [UIView new];
    child2.backgroundColor = [UIColor greenColor];
    [child2 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(100);
        layout.height = YGPointValue(300);
    }];
    
    UIView *child3 = [UIView new];
    child3.backgroundColor = [UIColor blueColor];
    [child3 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(100);
        layout.height = YGPointValue(200);
    }];
    
    [containerView1 addSubview:child1];
    [containerView1 addSubview:child2];
    [containerView1 addSubview:child3];
    [self.view addSubview:containerView1];
    
    
    CGSize size = [containerView1.yoga calculateLayoutWithSize:CGSizeMake(CGRectGetWidth(self.view.bounds), CGRectGetWidth(self.view.bounds))];
    CGSize intrinsicSize = containerView1.yoga.intrinsicSize;
    NSLog(@"size = %@, intrinsicSize = %@", NSStringFromCGSize(size), NSStringFromCGSize(intrinsicSize));
    
    //--------------------------------------------------------
    
    UIView *containerView2 = [[UIView alloc] initWithFrame:(CGRect){CGPointZero, 100, 100}];
    containerView2.backgroundColor = [UIColor yellowColor];
    [containerView2 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        // margin是相对于其他视图的,下面的代码代表他与其父视图之间的间距.
        // 等价于其父视图设置padding属性
        // layout.marginRight = YGPointValue(-50); // 向右移50pt, 设置stretch之后此属性失效了
        layout.marginBottom = YGPointValue(30 + 64);    // 上移30pt
        layout.margin = YGPointValue(10);
        layout.alignSelf = YGAlignStretch;
    }];
    [self.view addSubview:containerView2];

    [self.view.yoga applyLayoutPreservingOrigin:NO];
}

#pragma mark -

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
