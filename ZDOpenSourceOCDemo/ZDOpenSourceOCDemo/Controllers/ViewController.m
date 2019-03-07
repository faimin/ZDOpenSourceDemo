//
//  ViewController.m
//  ZDOpenSourceOCDemo
//
//  Created by Zero.D.Saber on 2017/8/4.
//  Copyright © 2017年 Zero.D.Saber. All rights reserved.
//
//  3D Touch实践讲解 --解决开发中的困惑点: https://www.tuicool.com/articles/VjEZniY
//  3D Touch功能实现: https://www.tuicool.com/articles/qQZjuqF
//  3Dtouch 的实际应用详解(tableView中的应用): https://www.tuicool.com/articles/baEnqef

#import "ViewController.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import <ReactiveObjC/ReactiveObjC.h>
#if __has_include(<KZPlayground/KZPPlayground.h>)
#import <KZPlayground/KZPPlayground.h>
#endif
#import <ZDToolKit/ZDToolKit.h>
#import <JLRoutes/JLRoutes.h>
#import <ZIKRouter/ZIKViewRouter.h>

@interface ViewController () <UITableViewDataSource, UITableViewDelegate
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_9_0
, UIViewControllerPreviewingDelegate
#endif
>
@property (nonatomic, weak  ) IBOutlet UIBarButtonItem *rightItem;
@property (nonatomic, weak  ) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray<NSString *> *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setup];
}

- (void)setup {
    [self setupData];
    [self setupUI];
}

- (void)setupData {
    NSArray<NSString *> *data = @[
      @"YogaKit",
      @"YogaKitList",
      @"IGListKit",
      @"Texture",
      @"JLRoute",
      @"Lottie",
    ];
    self.dataSource = data;
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}

#pragma mark - UITableViewDatasource && UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.dataSource[indexPath.row];
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        [self registerForPreviewingWithDelegate:self sourceView:cell];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *text = self.dataSource[indexPath.row];
    
    BOOL useZIKRouter = YES;
    if (useZIKRouter) {
        NSString *routerName = [text stringByAppendingString:@"ViewRouter"];
        Class aClass = objc_getClass(routerName.UTF8String);
        [aClass performPath:ZIKViewRoutePath.pushFrom(self)];
    }
    else {
        NSString *vcName = [text stringByAppendingString:@"ViewController"];
        NSString *url = [NSString stringWithFormat:@"ZDRoute://push/%@?arg1=hello&arg2=world", vcName];// @"ZDRoute://push?viewController=%@arg1=hello&arg2=world"
#if 1
        [[JLRoutes routesForScheme:@"ZDRoute"] routeURL:[NSURL URLWithString:url]];
#else
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url] options:@{UIApplicationOpenURLOptionUniversalLinksOnly : @NO} completionHandler:^(BOOL success) {
        //
        }];
#endif
    }
}

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_9_0
#pragma mark - UIViewControllerPreviewingDelegate
// peek
- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    NSString *text = ((UITableViewCell *)previewingContext.sourceView).textLabel.text;
    Class aClass = objc_getClass([text stringByAppendingString:@"ViewController"].UTF8String);
    return [aClass new];
}

// pop
- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    viewControllerToCommit.hidesBottomBarWhenPushed = YES;
    [self showViewController:viewControllerToCommit sender:self];
}
#endif

#pragma mark -

- (IBAction)present:(UIBarButtonItem *)sender {
#if __has_include(<KZPlayground/KZPPlayground.h>)
    [self.navigationController showViewController:[KZPPlaygroundViewController playgroundViewController] sender:sender];
#endif
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

