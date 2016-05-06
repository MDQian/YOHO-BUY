//
//  UIImage+MDQRender.h
//  YH_Mall_iPhone
//
//  Created by 马马 on 16/4/6.
//  Copyright © 2016年 马殿乾. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (MDQRender)

// 提供一个不要渲染图片方法
+ (UIImage *)imageNameWithOriginal:(NSString *)imageName;

// 生成圆角图片
- (UIImage *)circleImage;

@end
