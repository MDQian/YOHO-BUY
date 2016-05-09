//
//  MDQStrollViewController.m
//  YH_Mall_iPhone
//
//  Created by 马马 on 16/4/6.
//  Copyright © 2016年 马殿乾. All rights reserved.
//

#import "MDQStrollViewController.h"

@implementation MDQStrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavBar];
}

#pragma mark - ———— 设置导航栏 ————
// 设置导航条内容
- (void)setUpNavBar
{
    // 标题和背景色
    self.navigationItem.title = @"逛";
    self.view.backgroundColor = [UIColor lightGrayColor];
    // 左1
    UIBarButtonItem *leftItem1 = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"home_drawer_entrance"] highImage:[UIImage imageNamed:@"shared_listbuttom_highlighted"] target:self action:@selector(left)];
    self.navigationItem.leftBarButtonItem = leftItem1;
    
    // 右边
    UIBarButtonItem *rightItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"shared_photobuttom_normal"] highImage:[UIImage imageNamed:@"shared_photobuttom_highlighted"] target:self action:@selector(right)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    // 中间 titleView
    //    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40,50 )];
    //    imageV.image = [UIImage imageNamed:@"shared_logo1"];
    //    self.navigationItem.titleView = imageV;
}
- (void)left{}
- (void)right{}

@end
