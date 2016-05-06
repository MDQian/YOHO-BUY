//
//  MDQCateGoriesViewController.m
//  YH_Mall_iPhone
//
//  Created by 马马 on 16/4/6.
//  Copyright © 2016年 马殿乾. All rights reserved.
//

#import "MDQCateGoriesViewController.h"
#import "MDQLeftListViewController.h"

@interface MDQCateGoriesViewController ()

/** 自定义的边栏菜单 */
@property (nonatomic, strong) MDQLeftListViewController *sideMenuVC;
/** 是否隐藏边栏菜单 */
@property(nonatomic , assign) BOOL isShowSideMenu;

@property(nonatomic, strong) UITapGestureRecognizer *tapHideSideMenu;
@property(nonatomic, strong) UIPanGestureRecognizer *panHideSideMenu;
@property(nonatomic, strong) UIView *tapView;


@end



@implementation MDQCateGoriesViewController








- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"分类";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpNavBar];
    
    // 左侧菜单栏
    // 从IOS7开始当 scrollView在导航控制器，会自动调用边距64
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.isShowSideMenu = NO;
    
    MDQLeftListViewController *sideMenuVC = self.parentViewController.parentViewController.parentViewController.childViewControllers[0];
    self.sideMenuVC = sideMenuVC;
    
    //    创建手势
    self.tapHideSideMenu = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideSideMenu)];
    self.panHideSideMenu = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    [self.view addGestureRecognizer:self.panHideSideMenu];
    //  监听通知
    [self note];
    
    
    
}

#pragma mark - ———— 通知 侧滑菜单返回首页 ————
// 监听通知  在哪里监听？一般来说 之间听一次  在控制器加载之前 ——>viewdidload
- (void)note
{
    // object : 谁发出的通知？ nil 的时候就是，不管谁发出的 只要是 name 一致，我就调用方法
    // addobserver : 谁来 监听？
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideSideMenu)
                                                 name:@"更改类型" object:nil];
}
// 移除通知
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - ———— 设置导航栏 ————
// 设置导航条内容
- (void)setUpNavBar
{
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

#pragma mark - ———— 左侧菜单栏 ————
// 状态栏颜色为亮色？
- (UIStatusBarStyle)preferredStatusBarStyle
{
    //    return UIStatusBarStyleLightContent;
    return UIStatusBarStyleDefault;
}
// 滑出左侧菜单栏
- (void)showSideMenu
{
    //    NSLog(@"点击菜单");
    [self.sideMenuVC.menuTableView reloadData];
    self.sideMenuVC.menuTableView.clipsToBounds = NO;
    
    [UIView animateWithDuration:0.3 animations:^{
        // 更改位置
        self.sideMenuVC.view.xm_x = 0;
        self.tabBarController.view.xm_x =  0.8 * XMScreenW;
        
    } completion:^(BOOL finished) {
        
        
        
        [self.view removeGestureRecognizer:self.panHideSideMenu];
        
        if (self.tapView == nil)
        {
            self.tapView = [[UIView alloc] init];
            self.tapView.frame = CGRectMake(0, 0, 0.2 * XMScreenW, XMScreenH);
            self.tapView.backgroundColor = XMColor(163, 163, 163);
            self.tapView.alpha = 0.1;
        }
        
        
        [self.tapView addGestureRecognizer:self.tapHideSideMenu];
        [self.tapView addGestureRecognizer:self.panHideSideMenu];
        [self.view insertSubview:self.tapView belowSubview:self.sideMenuVC.view];
        
        self.isShowSideMenu = YES;
    }];
}
// 隐藏左侧菜单栏
- (void)hideSideMenu
{
    [UIView animateWithDuration:0.3 animations:^{
        self.sideMenuVC.view.xm_x = - 0.8 *XMScreenW;
        self.tabBarController.view.xm_x = 0;
    }
                     completion:^(BOOL finished) {
                         
                         [self.view addGestureRecognizer:self.panHideSideMenu];
                         
                         self.isShowSideMenu = NO;
                     }];
    [self.tapView removeGestureRecognizer:self.tapHideSideMenu];
    [self.tapView removeFromSuperview];
}


- (void)handlePanGesture:(UIPanGestureRecognizer *)recognizer
{
    CGFloat moveX;
    //    弱智语法，还不如加一个滑动手势
    if (self.isShowSideMenu)
        moveX = [recognizer translationInView:self.tapView].x;
    else
        moveX = [recognizer translationInView:self.view].x;
    
    CGFloat truedistance = moveX;
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        if (truedistance <= XMScreenW * 0.6 / 2) {
            [self hideSideMenu];
        } else {
            [self showSideMenu];
        }
    }
}








@end




















