//
//  TextureViewController.m
//  ZDOpenSourceOCDemo
//
//  Created by Zero.D.Saber on 2017/8/15.
//  Copyright © 2017年 Zero.D.Saber. All rights reserved.
//
//  Texture布局--快速开始：https://archimboldi.me/posts/%E7%BF%BB%E8%AF%91-texture-%E5%B8%83%E5%B1%80-%E5%BF%AB%E9%80%9F%E5%BC%80%E5%A7%8B-quickstart.html
//  Texture布局--布局样例：https://archimboldi.me/posts/%E7%BF%BB%E8%AF%91-texture-%E5%B8%83%E5%B1%80-%E5%B8%83%E5%B1%80%E6%A0%B7%E4%BE%8B-layout-examples.html
//  Texture布局--布局规格：https://archimboldi.me/posts/%E7%BF%BB%E8%AF%91-texture-%E5%B8%83%E5%B1%80-%E5%B8%83%E5%B1%80%E8%A7%84%E6%A0%BC-layout-specs.html

#import "TextureViewController.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "TextureCell.h"
#import "TextureViewModel.h"

@interface TextureViewController () <ASTableDelegate, ASTableDataSource>
@property (nonatomic, strong) ASTableNode *tableNode;
@property (nonatomic, strong) NSArray *dataSource;
@end

@implementation TextureViewController

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
    [self setupUI];
    [self setupData];
}

- (void)setupUI {
    self.navigationItem.title = @"TextureDemo";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubnode:self.tableNode];
}

- (void)setupData {
    self.dataSource = [TextureViewModel textureModels];
    [_tableNode reloadData];
}

#pragma mark - ASTableViewDatasource

- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath {
    TextureModel *model = self.dataSource[indexPath.row];
    ASCellNode *(^cellNodeBlock)(void) = ^ASCellNode *(){
        TextureCell *cellNode = [[TextureCell alloc] initWithModel:model];
        return cellNode;
    };
    return cellNodeBlock;
}

#pragma mark - ASTableViewDelegate

- (void)tableNode:(ASTableNode *)tableNode didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - Property

- (ASTableNode *)tableNode {
    if (!_tableNode) {
        ASTableNode *node = [[ASTableNode alloc] initWithStyle:UITableViewStylePlain];
        node.frame = self.view.bounds;
        node.backgroundColor = [UIColor whiteColor];
        node.delegate = self;
        node.dataSource = self;
        
        _tableNode = node;
    }
    return _tableNode;
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
