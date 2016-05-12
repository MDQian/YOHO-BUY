//
//  MDQTabbarController.m
//  YH_Mall_iPhone
//
//  Created by 马马 on 16/4/6.
//  Copyright © 2016年 马殿乾. All rights reserved.
//

#import "MDQTabbarController.h"

#import "MDQCateGoriesViewController.h"
#import "MDQHomeViewController.h"
#import "MDQStrollViewController.h"
#import "MDQShopCartViewController.h"
#import "MDQMineViewController.h"



#import "UIImage+MDQRender.h"

#import "MDQNavgationController.h"


@interface MDQTabbarController ()



@end

@implementation MDQTabbarController

#pragma mark - ———— view加载 ————

// 调用一次 最早 当被加载到内存中的时候
- (void)loadView
{
    [super loadView];
//    NSLog(@"第2个控制器—>加载界面 %li",self.number);
//    NSLog(@"%s",__func__);
//    NSLog(@"_______________________________");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // tab  设置标签栏的颜色
    [self setUpTabBar];
    // nav 添加所有子控件
    [self setUpAllChildViewController];
    
    // 监听通知
    [self note];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    NSLog(@"第2个控制器>将要显示界面 %li",self.number);
    switch (self.number)
    {
        case 1: self.typeOfNumber = @"boy";  break;
        case 2: self.typeOfNumber = @"girl";  break;
        case 3: self.typeOfNumber = @"kids";  break;
        case 4: self.typeOfNumber = @"life";  break;
    }
//    NSLog(@"%@",self.typeOfNumber);
    
    // tab 按钮图片
    [self setUpAllTileButton:self.typeOfNumber];
    // nav 设置导航栏背景色
    [self setUpMDQNavgationBackImage:self.typeOfNumber];
}
// 监听通知  在哪里监听？一般来说 之间听一次  在控制器加载之前 ——>viewdidload
- (void)note
{
    // object : 谁发出的通知？ nil 的时候就是，不管谁发出的 只要是 name 一致，我就调用方法
    // addobserver : 谁来 监听？
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeStype:)
                                                 name:@"更改类型" object:nil];    
}
- (void)changeStype:(NSNotification *)note
{
    NSIndexPath *path = [note.userInfo objectForKey:@"indexPath"];
    NSInteger section = [path indexAtPosition:0];
    NSInteger row = [path indexAtPosition:1];
    
//    NSLog(@"我在左侧菜单栏点击了%zd组的 第%zd行",section, row);
    if (section == 0){
        switch (row){
            case 0: self.typeOfNumber = @"boy";  break;
            case 1: self.typeOfNumber = @"girl";  break;
            case 2: self.typeOfNumber = @"kids";  break;
            case 3: self.typeOfNumber = @"life";  break;
            case 4: self.typeOfNumber = @"life";  break;
        }
//        NSLog(@"侧滑点击后的种类%@",self.typeOfNumber);
        // tab 按钮图片
        [self setUpAllTileButton:self.typeOfNumber];
        // nav 设置导航栏背景色
//        [self setUpMDQNavgationBackImage:self.typeOfNumber];
        
        [self.view setNeedsLayout];
        [self.view layoutIfNeeded];
        
        
        for (UINavigationController *navc in self.childViewControllers) {
//            [navc.view setNeedsDisplay];
            if ([self.typeOfNumber isEqualToString: @"boy"])
                [navc.navigationBar setBackgroundImage:[UIImage imageNamed:@"shared_navbar2_boy"] forBarMetrics:UIBarMetricsDefault];
            if ([self.typeOfNumber isEqualToString: @"girl"])
                [navc.navigationBar setBackgroundImage:[UIImage imageNamed:@"shared_navbar2_girl"] forBarMetrics:UIBarMetricsDefault];
            if ([self.typeOfNumber isEqualToString: @"kids"])
                [navc.navigationBar setBackgroundImage:[UIImage imageNamed:@"shared_navbar2_kids"] forBarMetrics:UIBarMetricsDefault];
            if ([self.typeOfNumber isEqualToString: @"life"])
                [navc.navigationBar setBackgroundImage:[UIImage imageNamed:@"shared_navbar2_life"] forBarMetrics:UIBarMetricsDefault];
        }
    }
   
}
// 移除通知
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}





// 调用多次
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    //    NSLog(@"第2个控制器>布局子控件 %li",self.number);
    //    NSLog(@"%s",__func__);
    //    NSLog(@"_______________________________");
    
}
#pragma mark - ———— 添加所有 nav 子控件 ————
- (void)setUpAllChildViewController
{
    // 首页
    MDQHomeViewController *homeVC = [[MDQHomeViewController alloc] init];
    MDQNavgationController *nav = [[MDQNavgationController alloc] initWithRootViewController:homeVC];
    [self addChildViewController:nav];
    
    // 分类
    MDQCateGoriesViewController *cateVC = [[MDQCateGoriesViewController alloc] init];
    MDQNavgationController *nav1 = [[MDQNavgationController alloc] initWithRootViewController:cateVC];
    [self addChildViewController:nav1];
    
    // 逛
    MDQStrollViewController *strollVC = [[MDQStrollViewController alloc] init];
    MDQNavgationController *nav2 = [[MDQNavgationController alloc] initWithRootViewController:strollVC];
    [self addChildViewController:nav2];
    
    // 购物车
    MDQShopCartViewController *shopCartVC = [[MDQShopCartViewController alloc] init];
    MDQNavgationController *nav3 = [[MDQNavgationController alloc] initWithRootViewController:shopCartVC];
    [self addChildViewController:nav3];
    
    // 我
    MDQMineViewController *mineVC = [[MDQMineViewController alloc] init];
    MDQNavgationController *nav4 = [[MDQNavgationController alloc] initWithRootViewController:mineVC];
    [self addChildViewController:nav4];
}
#pragma mark - ———— 设置导航栏 nav 的样式 ————

- (void)setUpMDQNavgationBackImage:(NSString *)type
{
    //    NSLog(@"导航控制器----将要显示界面 %@",self.typeOfTab);
    //    //获取指定类下面的导航条
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[MDQNavgationController class]]];
    //  设置导航栏的边界灰线
    [bar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    bar.shadowImage = [[UIImage alloc] init];
    
//    NSLog(@"---%@",type);
    //    NSLog(@"-----%@",bar);
    // --------------设置导航条----------------
    //    设置背景(设置背影图片时, 必须得要使用)
    if ([type isEqualToString: @"boy"])
        [bar setBackgroundImage:[UIImage imageNamed:@"shared_navbar2_boy"] forBarMetrics:UIBarMetricsDefault];
    if ([type isEqualToString: @"girl"])
        [bar setBackgroundImage:[UIImage imageNamed:@"shared_navbar2_girl"] forBarMetrics:UIBarMetricsDefault];
    if ([type isEqualToString: @"kids"])
        [bar setBackgroundImage:[UIImage imageNamed:@"shared_navbar2_kids"] forBarMetrics:UIBarMetricsDefault];
    if ([type isEqualToString: @"life"])
        [bar setBackgroundImage:[UIImage imageNamed:@"shared_navbar2_life"] forBarMetrics:UIBarMetricsDefault];

}
// 自定义后这个就没被调用。因为 用的都是自定义的
/*
- (void)setUpNavgation
{
    
    // 设置导航条
    // 设置背景(设置背影图片时, 必须得要使用)
    // 但是自定义了。这里的设置会被覆盖掉的
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"shared_navbar_bg-1"] forBarMetrics:UIBarMetricsDefault];
    //设置导航条上的标题颜色
    //设置主题颜色
    //[nav.navigationBar setTintColor:[UIColor whiteColor]];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    dict[NSFontAttributeName] = [UIFont boldSystemFontOfSize:40];
    
    [self.navigationController.navigationBar setTitleTextAttributes:dict];
    
}
 */

#pragma mark - ———— 设置 tabbar 按钮内容  ————
// tab 按钮普通样式
- (void)setUpAllTileButton:(NSString *)type
{
    // _______________________________首页________________________________________
    UINavigationController *nav = self.childViewControllers[0];
    UIViewController *vc0 =  self.childViewControllers[0];
    nav.tabBarItem.image = [UIImage imageNamed:@"nav_home_normal"];
    // _______________________________分类________________________________________
    UINavigationController *nav1 = self.childViewControllers[1];
    UIViewController *vc1 =  self.childViewControllers[1];
    nav1.tabBarItem.image = [UIImage imageNamed:@"nav_cate_normal"];
    // _________________________________逛________________________________________
    UINavigationController *nav2 = self.childViewControllers[2];
    UIViewController *vc2 =  self.childViewControllers[2];
    nav2.tabBarItem.image = [UIImage imageNamed:@"nav_see_normal"];
    // ________________________________购物车______________________________________
    UINavigationController *nav3 = self.childViewControllers[3];
    UIViewController *vc3 =  self.childViewControllers[3];
    nav3.tabBarItem.image = [UIImage imageNamed:@"nav_buy_normal"];
    // _________________________________我_________________________________________
    UINavigationController *nav4 = self.childViewControllers[4];
    UIViewController *vc4 =  self.childViewControllers[4];
    nav4.tabBarItem.image = [UIImage imageNamed:@"nav_mine_normal"];
//  设置选中按钮的 图片
    [self setUpMDQTabbarItemSelectedImagewithType:type];
    
    // 上边网下边 移动 5  下边 继续往下边 否则会压缩
    vc0.tabBarItem.imageInsets = UIEdgeInsetsMake(4, 0, -4, 0);
    vc1.tabBarItem.imageInsets = UIEdgeInsetsMake(4, 0, -4, 0);
    vc2.tabBarItem.imageInsets = UIEdgeInsetsMake(4, 0, -4, 0);
    vc3.tabBarItem.imageInsets = UIEdgeInsetsMake(4, 0, -4, 0);
    vc4.tabBarItem.imageInsets = UIEdgeInsetsMake(4, 0, -4, 0);
    
}
// tab 设置选中按钮的图片
- (void)setUpMDQTabbarItemSelectedImagewithType:(NSString *)type
{
    // 获取 bundle 文件夹
    NSString *strNavIconBundle = [[NSBundle mainBundle] pathForResource:@"navIcon" ofType:@"bundle"];
    //    首页
    NSString *str_home = [[NSBundle bundleWithPath:strNavIconBundle] pathForResource:@"nav_home_highlighted@3x" ofType:@"png" inDirectory:type];
    UIImage *image_home =[[UIImage imageWithContentsOfFile:str_home] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.childViewControllers[0].tabBarItem.selectedImage = image_home;
    //    分类
    NSString *str_cate = [[NSBundle bundleWithPath:strNavIconBundle] pathForResource:@"nav_cate_highlighted@3x" ofType:@"png" inDirectory:type];
    UIImage *image_cate =[[UIImage imageWithContentsOfFile:str_cate] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.childViewControllers[1].tabBarItem.selectedImage = image_cate;
    //    逛
    NSString *str_see = [[NSBundle bundleWithPath:strNavIconBundle] pathForResource:@"nav_see_highlighted@3x" ofType:@"png" inDirectory:type];
    UIImage *image_see =[[UIImage imageWithContentsOfFile:str_see] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.childViewControllers[2].tabBarItem.selectedImage = image_see;
    //    购物车
    NSString *str_buy = [[NSBundle bundleWithPath:strNavIconBundle] pathForResource:@"nav_buy_highlighted@3x" ofType:@"png" inDirectory:type];
    UIImage *image_buy =[[UIImage imageWithContentsOfFile:str_buy] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.childViewControllers[3].tabBarItem.selectedImage = image_buy;
    //    个人
    NSString *str_mine = [[NSBundle bundleWithPath:strNavIconBundle] pathForResource:@"nav_mine_highlighted@3x" ofType:@"png" inDirectory:type];
    UIImage *image_mine =[[UIImage imageWithContentsOfFile:str_mine] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.childViewControllers[4].tabBarItem.selectedImage = image_mine;
    

}
#pragma mark - ———— 设置标签栏颜色 ————
- (void)setUpTabBar
{
    UIImage *tabBarImage = [UIImage imageNamed:@"shared_tabbar_bg"];
    UIImageView *tabBackgroudImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.tabBar.xm_width, self.tabBar.xm_height)];
    tabBackgroudImageV.image = tabBarImage;
    [self.tabBar insertSubview:tabBackgroudImageV atIndex:1];

}

@end



