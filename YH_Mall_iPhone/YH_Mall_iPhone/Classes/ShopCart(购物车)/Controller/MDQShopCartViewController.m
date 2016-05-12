//
//  MDQShopCartViewController.m
//  YH_Mall_iPhone
//
//  Created by 马马 on 16/4/6.
//  Copyright © 2016年 马殿乾. All rights reserved.
//

#import "MDQShopCartViewController.h"

@implementation MDQShopCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavBar];
    
}

// 设置导航条内容
- (void)setUpNavBar
{
    // 标题和背景色
    self.navigationItem.title = @"购物车";
    self.view.backgroundColor = XMColor(77, 215, 193);
    
    
   // 右边
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] init];
    rightItem.title = @"编辑";
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
    
    
    // 中间 titleView
    //    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40,50 )];
    //    imageV.image = [UIImage imageNamed:@"shared_logo1"];
    //    self.navigationItem.titleView = imageV;
}
- (void)right{
}
@end
