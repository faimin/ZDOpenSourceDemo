//
//  ViewController.m
//  ZDOpenSourceOCDemo
//
//  Created by Zero.D.Saber on 2017/8/4.
//  Copyright © 2017年 Zero.D.Saber. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import <KZPlayground/KZPPlayground.h>

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray<NSString *> *data;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setup {
    [self setupData];
    [self setupUI];
}

- (void)setupData {
    NSArray<NSString *> *data = @[@"YogaKit", @"IGListKit", @"Texture", @"JLRoute", @"Lottie"];
    self.data = data;
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor yellowColor];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}

#pragma mark - UITableViewDatasource && UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = self.data[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *text = self.data[indexPath.row];
    Class aClass = objc_getClass([text stringByAppendingString:@"ViewController"].UTF8String);
    if (!aClass) return;

    [self.navigationController showViewController:[aClass new] sender:tableView];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (IBAction)present:(UIBarButtonItem *)sender {
    [self.navigationController showViewController:[KZPPlaygroundViewController playgroundViewController] sender:sender];
}

@end













