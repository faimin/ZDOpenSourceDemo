//
//  ViewController.m
//  ZDOpenSourceOCDemo
//
//  Created by Zero.D.Saber on 2017/8/8.
//  Copyright © 2017年 Zero.D.Saber. All rights reserved.
//
//  Lottie资源：http://www.lottiefiles.com/

#import "LottieViewController.h"
#import <Lottie/Lottie.h>

UIKIT_STATIC_INLINE CGSize ZD_ScreenSize() {
    return [UIScreen mainScreen].bounds.size;
}

@interface PresentViewController : UIViewController

@end

@interface LottieViewController () <UIViewControllerTransitioningDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIButton *pushButton;
@end

@implementation LottieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.delegate = self;
    
    [self.view addSubview:self.button];
    [self.view addSubview:self.pushButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIButton *)button {
    if (!_button) {
        _button = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.backgroundColor = [UIColor yellowColor];
            button.frame = (CGRect){50, 50, ZD_ScreenSize().width - 50*2, 200};
            [button setTitle:@"Present" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:25];
            button.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            [button addTarget:self action:@selector(present) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _button;
}

- (UIButton *)pushButton {
    if (!_pushButton) {
        _pushButton = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.backgroundColor = [UIColor yellowColor];
            button.frame = (CGRect){50, 300, ZD_ScreenSize().width - 50*2, 200};
            [button setTitle:@"Push" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:25];
            button.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            [button addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _pushButton;
}

- (void)present {
    PresentViewController *vc = [PresentViewController new];
    vc.transitioningDelegate = self;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)push {
    PresentViewController *vc = [PresentViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UINavigationControllerDelegate

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController*)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController*)fromVC
                                                  toViewController:(UIViewController*)toVC {
    
    LOTAnimationTransitionController *animationController;
    if (fromVC == self) {
        animationController = [[LOTAnimationTransitionController alloc] initWithAnimationNamed:@"play_and_like_it" fromLayerNamed:@"Morphing" toLayerNamed:@"background" applyAnimationTransform:YES];
    }
    else {
        animationController = [[LOTAnimationTransitionController alloc] initWithAnimationNamed:@"progress_success" fromLayerNamed:@"Camera 1" toLayerNamed:@"Layer 5 Outlines" applyAnimationTransform:YES];
    }
    return animationController;
}

#pragma mark - UIViewControllerTransitioningDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    LOTAnimationTransitionController *animationController = [[LOTAnimationTransitionController alloc] initWithAnimationNamed:@"play_and_like_it" fromLayerNamed:@"Morphing" toLayerNamed:@"background" applyAnimationTransform:YES];
    //LOTAnimationTransitionController *animationController = [[LOTAnimationTransitionController alloc] initWithAnimationNamed:@"vcTransition1" fromLayerNamed:@"outLayer" toLayerNamed:@"inLayer"];
    return animationController;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    LOTAnimationTransitionController *animationController = [[LOTAnimationTransitionController alloc] initWithAnimationNamed:@"progress_success" fromLayerNamed:@"Camera 1" toLayerNamed:@"Layer 5 Outlines" applyAnimationTransform:YES];
    //LOTAnimationTransitionController *animationController = [[LOTAnimationTransitionController alloc] initWithAnimationNamed:@"vcTransition2" fromLayerNamed:@"outLayer" toLayerNamed:@"inLayer"];
    return animationController;
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


@implementation PresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor purpleColor];
    
    [self setupView];
}

- (void)setupView {
    UIButton *button = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor yellowColor];
        button.frame = (CGRect){50, 50, ZD_ScreenSize().width - 50*2, 200};
        [button setTitle:@"dismiss" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:25];
        button.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [button addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        button;
    });
    
    UIButton *popButton = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor yellowColor];
        button.frame = (CGRect){50, 300, ZD_ScreenSize().width - 50*2, 200};
        [button setTitle:@"pop" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:25];
        button.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [button addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
        button;
    });
    
    [self.view addSubview:button];
    [self.view addSubview:popButton];
}

- (void)dismiss {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)pop {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
