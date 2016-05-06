//
//  UIImage+Antialias.h
//  BuDeJie
//
//  Created by yz on 15/10/31.
//  Copyright © 2015年 yz. All rights reserved.
//  抗锯齿

#import <UIKit/UIKit.h>

@interface UIImage (Antialias)

// 返回一张抗锯齿图片
// 本质：在图片生成一个透明为1的像素边框
- (UIImage *)imageAntialias;

@end
