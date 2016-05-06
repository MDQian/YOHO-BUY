//
//  UITextField+Placeholder.m
//  YH_Mall_iPhone
//
//  Created by 马马 on 16/4/6.
//  Copyright © 2016年 马殿乾. All rights reserved.
//


#import "UITextField+Placeholder.h"

#import <objc/message.h>

@implementation UITextField (Placeholder)
// runtime 交换方法  
+ (void)load
{
    Method setPlaceholderMethod = class_getInstanceMethod(self, @selector(setPlaceholder:));
    
    Method setXmgPlaceholderMethod = class_getInstanceMethod(self, @selector(setXmg_Placeholder:));
    
    method_exchangeImplementations(setPlaceholderMethod, setXmgPlaceholderMethod);
}
// setPlaceholder : setXmg_Placeholder
// 设置占位文字,并且设置占位文字颜色
- (void)setXmg_Placeholder:(NSString *)placeholder
{
    // 设置占位文字
    [self setXmg_Placeholder:placeholder];

    // 设置占位文字颜色
    [self setPlaceholderColor:self.placeholderColor];
    
}

// 设置占位文字颜色
- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    // 1.把占位文字颜色先保存
    objc_setAssociatedObject(self, @"placeholderColor", placeholderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // 2.等真正设置占位文字的时候,在去设置占位文字颜色
    
    // 获取占位文字控件
    UILabel *placeholderLabel = [self valueForKey:@"placeholderLabel"];
    
    // 拿到控件去设置颜色
    placeholderLabel.textColor = placeholderColor;

}

// 返回占位文字颜色
- (UIColor *)placeholderColor
{
    return objc_getAssociatedObject(self, @"placeholderColor");
}
@end
