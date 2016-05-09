//
//  MDQCateGoriesViewController.m
//  YH_Mall_iPhone
//
//  Created by 马马 on 16/4/6.
//  Copyright © 2016年 马殿乾. All rights reserved.
//

#import "MDQCateGoriesViewController.h"

@interface MDQCateGoriesViewController ()


@end




@implementation MDQCateGoriesViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavBar];
}

#pragma mark - ———— 设置导航栏 ————
// 设置导航条内容
- (void)setUpNavBar
{
    // 标题和背景色
    self.navigationItem.title = @"分类";
    self.view.backgroundColor = [UIColor whiteColor];
    // 左1
    UIBarButtonItem *leftItem1 = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine_setting_icon_n"] highImage:nil target:self action:@selector(showSideMenu)];
    self.navigationItem.leftBarButtonItem = leftItem1;
    
    // 右边
    UIBarButtonItem *rightItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine_setting_icon_n"] highImage:[UIImage imageNamed:@"mine_setting_icon_n"] target:self action:@selector(test)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    // 中间 titleView
//    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40,50 )];
//    imageV.image = [UIImage imageNamed:@"shared_logo1"];
//    self.navigationItem.titleView = imageV;
}
- (void)test
{
    UIViewController *testVC = [[UIViewController alloc]init];
    testVC.view.backgroundColor = XMColor(30, 59, 78);
    // 一定要注意:在Push之前去设置这个属性
    testVC.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:testVC animated:YES];
}
@end




















