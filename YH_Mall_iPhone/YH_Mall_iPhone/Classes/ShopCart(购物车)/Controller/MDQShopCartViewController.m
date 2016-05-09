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
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    
    //    // 右边
    //    UIBarButtonItem *rightItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"callphone"] highImage:[UIImage imageNamed:@"callphone"] target:self action:@selector(right)];
    //    self.navigationItem.rightBarButtonItem = rightItem;
    //    UIBarButtonItem *rightItem = [UIBarButtonItem  initWithTitle:@"编辑" style:UIBarButtonItemStylePlain  target:self action:@selector(right)];
    
    
    
    // 中间 titleView
    //    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40,50 )];
    //    imageV.image = [UIImage imageNamed:@"shared_logo1"];
    //    self.navigationItem.titleView = imageV;
}
- (void)right{
}
@end
