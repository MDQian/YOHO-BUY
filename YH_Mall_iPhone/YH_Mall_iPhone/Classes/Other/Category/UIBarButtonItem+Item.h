//
//  UIBarButtonItem+Item.h
//  YH_Mall_iPhone
//
//  Created by 马马 on 16/4/7.
//  Copyright © 2016年 马殿乾. All rights reserved.//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Item)
+ (UIBarButtonItem *)itemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)itemWithImage:(UIImage *)image selImage:(UIImage *)selImage target:(id)target action:(SEL)action;

@end
