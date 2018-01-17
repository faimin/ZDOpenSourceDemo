//
//  ZDBaseViewController.m
//  ZDOpenSourceOCDemo
//
//  Created by Zero.D.Saber on 2018/1/17.
//  Copyright © 2018年 Zero.D.Saber. All rights reserved.
//

#import "ZDBaseViewController.h"

@interface ZDBaseViewController ()

@end

@implementation ZDBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - 3D Touch
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_9_0
// 预览时的底部菜单(此方法需要在peekpop出的控制器中实现)
- (NSArray <id <UIPreviewActionItem>> *)previewActionItems {
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"标题1" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"选中标题1");
    }];
    
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"标题2" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"选中标题2");
    }];
    
    UIPreviewAction *action3 = [UIPreviewAction actionWithTitle:@"标题3" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"选中标题3");
    }];
    
    return @[action1, action2, action3];
}
#endif

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
