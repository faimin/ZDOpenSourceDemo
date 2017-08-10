//
//  YogaViewController.m
//  ZDOpenSourceOCDemo
//
//  Created by Zero.D.Saber on 2017/8/8.
//  Copyright © 2017年 Zero.D.Saber. All rights reserved.
//
//  http://www.ruanyifeng.com/blog/2015/07/flex-grammar.html

#import "YogaKitViewController.h"
#import <YogaKit/UIView+Yoga.h>
#import <KZPlayground/KZPPlayground.h>

@interface YogaKitViewController ()

@end

@implementation YogaKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
        
        layout.paddingBottom = YGPointValue(50 + 64); // 调整self.view与其子视图之间的间距
    }];
    
    UIView *containerView1 = [UIView new];
    containerView1.backgroundColor = [UIColor cyanColor];
    [containerView1 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(CGRectGetWidth(self.view.bounds));
        layout.height = layout.width;
        layout.direction = YGDirectionLTR;
        layout.flexDirection = YGFlexDirectionRow;  // 主轴方向
        layout.flexWrap = YGWrapWrap;   // 是否换行
        layout.justifyContent = YGJustifySpaceAround; // 主轴上的两端对齐方式
        layout.alignItems = YGAlignCenter;  // 交叉轴(跟主轴相对的轴)上的对齐方式,此属性只是针对一条主轴的情况
        layout.alignContent = YGAlignSpaceBetween;  // 此属性跟上面的一样,只是这个针对的是多根主轴的情况,所以只有一根主轴时,此属性不起作用
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
        layout.marginRight = YGPointValue(20);
        layout.marginBottom = YGPointValue(10);
    }];
    [child1 addSubview:leaf];

    
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
    
    //[containerView1.yoga applyLayoutPreservingOrigin:NO dimensionFlexibility:YGDimensionFlexibilityFlexibleHeigth];
    
    CGSize size = [containerView1.yoga calculateLayoutWithSize:CGSizeMake(CGRectGetWidth(self.view.bounds), CGRectGetWidth(self.view.bounds))];
    CGSize intrinsicSize = containerView1.yoga.intrinsicSize;
    NSLog(@"size = %@, intrinsicSize = %@", NSStringFromCGSize(size), NSStringFromCGSize(intrinsicSize));
    
    //--------------------------------------------------------
    
    UIView *containerView2 = [UIView new];
    containerView2.backgroundColor = [UIColor yellowColor];
    [containerView2 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(100);
        layout.height = YGPointValue(100);
        // margin是相对于其他视图的,下面的代码代表他与其父视图之间的间距.
        // 等价于其父视图设置padding属性
        layout.marginRight = YGPointValue(-50); // 向右移50pt
        layout.marginBottom = YGPointValue(30 + 64);    // 上移30pt
    }];
    [self.view addSubview:containerView2];

    [self.view.yoga applyLayoutPreservingOrigin:NO];
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
