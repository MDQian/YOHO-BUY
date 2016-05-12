//
//  MDQMineViewController.m
//  YH_Mall_iPhone
//
//  Created by 马马 on 16/4/6.
//  Copyright © 2016年 马殿乾. All rights reserved.
//

#import "MDQMineViewController.h"

@implementation MDQMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpNavBar];
}

// 设置导航条内容
- (void)setUpNavBar
{
    // 标题和背景色
    self.navigationItem.title = @"我的";
    self.view.backgroundColor = XMColor(77, 215, 193);
    // 左1
    UIBarButtonItem *leftItem1 = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine_setting_icon_n"] highImage:[UIImage imageNamed:@"mine_setting_icon_p"] target:self action:@selector(left)];
    self.navigationItem.leftBarButtonItem = leftItem1;
    
    // 右边
    UIBarButtonItem *rightItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine_msg_icon_n"] highImage:[UIImage imageNamed:@"mine_msg_icon_p"] target:self action:@selector(right)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    // 中间 titleView
    //    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40,50 )];
    //    imageV.image = [UIImage imageNamed:@"shared_logo1"];
    //    self.navigationItem.titleView = imageV;
}
- (void)left{}
- (void)right{}
@end
