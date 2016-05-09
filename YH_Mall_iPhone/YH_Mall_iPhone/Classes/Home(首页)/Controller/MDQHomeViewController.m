//
//  MDQHomeViewController.m
//  YH_Mall_iPhone
//
//  Created by 马马 on 16/4/6.
//  Copyright © 2016年 马殿乾. All rights reserved.
//

#import "MDQHomeViewController.h"


@interface MDQHomeViewController () //<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@end
@implementation MDQHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavBar];
    

}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}





#pragma mark - ———— 设置导航栏 ————
// 设置导航条内容
- (void)setUpNavBar
{
    // 标题和背景色
    self.navigationItem.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    // 左1
    UIBarButtonItem *leftItem1 = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"home_drawer_entrance"] highImage:[UIImage imageNamed:@"shared_listbuttom_highlighted"] target:self action:@selector(showSideMenu)];
    // 左2
    UIBarButtonItem *leftItem2 = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"shared_searchbuttom_normal"] highImage:[UIImage imageNamed:@"shared_searchbuttom_highlighted"] target:self action:@selector(searchGoods)];
    
    NSArray *butArr = [[NSArray alloc]initWithObjects:leftItem1, leftItem2, nil];
    self.navigationItem.leftBarButtonItems = butArr;
    
    // 右边
    UIBarButtonItem *rightItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"shared_scanbuttom_normal"] highImage:[UIImage imageNamed:@"shared_scanbuttom_highlighted"] target:self action:@selector(test)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    // 中间 titleView
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40,50 )];
    imageV.image = [UIImage imageNamed:@"shared_logo1"];
    self.navigationItem.titleView = imageV;
}

- (void)searchGoods
{
    NSLog(@"点击搜索");
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




































































