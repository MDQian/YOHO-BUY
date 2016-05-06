//
//  UIBarButtonItem+Item.m
//  YH_Mall_iPhone
//
//  Created by 马马 on 16/4/7.
//  Copyright © 2016年 马殿乾. All rights reserved.//

#import "UIBarButtonItem+Item.h"

@implementation UIBarButtonItem (Item)

+ (UIBarButtonItem *)itemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highImage forState:UIControlStateHighlighted];
    [btn sizeToFit];
    // 监听按钮点击
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 解决导航条按钮 点击范围过大的问题
    UIView *btnView = [[UIView alloc] initWithFrame:btn.bounds];
    [btnView addSubview:btn];
    [btnView sizeToFit];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btnView];

}

+ (UIBarButtonItem *)itemWithImage:(UIImage *)image selImage:(UIImage *)selImage target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:selImage forState:UIControlStateSelected];
    [btn sizeToFit];
    // 监听按钮点击
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    // 解决导航条按钮 点击范围过大的问题
    UIView *btnView = [[UIView alloc] initWithFrame:btn.bounds];
    [btnView addSubview:btn];
    
    
    return [[UIBarButtonItem alloc] initWithCustomView:btnView];
}
@end
