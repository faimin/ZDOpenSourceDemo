//
//  YogaKitListViewController.m
//  ZDOpenSourceOCDemo
//
//  Created by Zero.D.Saber on 2017/12/8.
//  Copyright © 2017年 Zero.D.Saber. All rights reserved.
//

#import "YogaKitListViewController.h"
#import "TextureViewModel.h"
#import "YogaCell.h"

@interface YogaKitListViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) NSMutableDictionary *mutDict;
@end

@implementation YogaKitListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setup];
}

- (void)setup {
    [self setupUI];
    [self setupData];
}

- (void)setupUI {
    self.navigationItem.title = @"YogaKitListDemo";
    self.view.backgroundColor = [UIColor whiteColor];
    
    /*
    YogaCell *cell = [[YogaCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.frame = CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 100);
    cell.contentView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:cell];
    cell.model = [TextureViewModel textureModels].firstObject;
    */
    [self.view addSubview:self.tableView];
}

- (void)setupData {
    self.dataSource = [TextureViewModel textureModels];
    [_tableView reloadData];
}

#pragma mark - UITableViewDatasource && UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YogaCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YogaCell class]) forIndexPath:indexPath];
    TextureModel *model = self.dataSource[indexPath.row];
    cell.model = model;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    YogaCell *cell = [self templateCellWithId:NSStringFromClass([YogaCell class])];
    //[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YogaCell class]) forIndexPath:indexPath];
    TextureModel *model = self.dataSource[indexPath.row];
    return [cell cellHeightWithModel:model];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Template Cell

- (__kindof UITableViewCell *)templateCellWithId:(NSString *)cellId {
    if (!cellId) return nil;
    
    UITableViewCell *cell = self.mutDict[cellId];
    if (!cell) {
        cell = [self.tableView dequeueReusableCellWithIdentifier:cellId];
        self.mutDict[cellId] = cell;
    }
    [cell prepareForReuse];
    return cell;
}

#pragma mark - Property

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.backgroundColor = [UIColor whiteColor];
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.tableFooterView = [UIView new];
        [tableView registerClass:[YogaCell class] forCellReuseIdentifier:NSStringFromClass([YogaCell class])];
        _tableView = tableView;
    }
    return _tableView;
}

- (NSMutableDictionary *)mutDict {
    if (!_mutDict) {
        _mutDict = @{}.mutableCopy;
    }
    return _mutDict;
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
