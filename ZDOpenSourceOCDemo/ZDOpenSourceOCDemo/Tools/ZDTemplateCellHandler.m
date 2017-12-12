//
//  ZDTemplateCellHandler.m
//  ZDOpenSourceOCDemo
//
//  Created by Zero.D.Saber on 2017/12/12.
//  Copyright © 2017年 Zero.D.Saber. All rights reserved.
//

#import "ZDTemplateCellHandler.h"
#import <YogaKit/UIView+Yoga.h>

@interface ZDTemplateCellHandler()
@property (nonatomic, strong) NSMutableDictionary<NSString *, UITableViewCell *> *templateCellCache;
@property (nonatomic, strong) NSMutableDictionary<NSIndexPath *, NSNumber *> *cellHeightCache;
@end

@implementation ZDTemplateCellHandler

#pragma mark - Template Cell

- (__kindof UITableViewCell *)templateCellWithTableView:(UITableView *)tableView reuseIdentifier:(NSString *)cellId {
    if (!cellId) return nil;
    
    UITableViewCell *cell = self.templateCellCache[cellId];
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        self.templateCellCache[cellId] = cell;
    }
    [cell prepareForReuse];
    return cell;
}

#pragma mark - Height

- (CGFloat)cellHeightWithTableView:(UITableView *)tableView
                   reuseIdentifier:(NSString *)reuseCellId
                         indexPath:(NSIndexPath *)indexPath
                     configuration:(void(^)(UITableViewCell *))configurationBlock {
    if (!(tableView && reuseCellId && indexPath)) return 0.f;
    
    CGFloat cellHeight = 0.f;
    if (self.cellHeightCache[indexPath]) {
        cellHeight = self.cellHeightCache[indexPath].floatValue;
    } else {
        UITableViewCell *cell = [self templateCellWithTableView:tableView reuseIdentifier:reuseCellId];
        if (configurationBlock) configurationBlock(cell);
        
        CGSize intrinsicSize = [cell.contentView.yoga intrinsicSize];
        //NSLog(@"%s, intrinsicSize = %@", __PRETTY_FUNCTION__, NSStringFromCGSize(intrinsicSize));
        self.cellHeightCache[indexPath] = @(intrinsicSize.height);
        cellHeight = intrinsicSize.height;
    }
    
    return cellHeight;
}

#pragma mark - Property

- (NSMutableDictionary<NSString *, UITableViewCell *> *)templateCellCache {
    if (!_templateCellCache) {
        _templateCellCache = @{}.mutableCopy;
    }
    return _templateCellCache;
}

- (NSMutableDictionary<NSIndexPath *,NSNumber *> *)cellHeightCache {
    if (!_cellHeightCache) {
        _cellHeightCache = @{}.mutableCopy;
    }
    return _cellHeightCache;
}

@end
