//
//  TextureViewModel.m
//  ZDOpenSourceOCDemo
//
//  Created by Zero.D.Saber on 2017/10/23.
//  Copyright © 2017年 Zero.D.Saber. All rights reserved.
//

#import "TextureViewModel.h"
#import <YYModel/YYModel.h>

@implementation TextureViewModel

+ (NSArray<TextureModel *> *)textureModels {
    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:resourcePath];
    TextureModelList *list = [TextureModelList yy_modelWithJSON:jsonData]; 
    NSArray<TextureModel *> *textureModels = list.feed; //[NSArray yy_modelArrayWithClass:[TextureModel class] json:list.feed];
    return textureModels;
}

@end
