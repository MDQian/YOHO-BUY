//
//  MDQNavgationController.m
//  YH_Mall_iPhone
//
//  Created by 马马 on 16/4/7.
//  Copyright © 2016年 马殿乾. All rights reserved.
//

#import "MDQNavgationController.h"

@interface MDQNavgationController ()<UIGestureRecognizerDelegate>

@end

@implementation MDQNavgationController

//-(void)test
//{
//        NSLog(@"导航控制器----将要显示界面 %@",self.typeOfTab);
//        不在这里考虑了，这里设置是错误的，或者即便可以做到，也没啥好处
//      获取指定类下面的导航条
//        UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[MDQNavgationController class]]];
//        // --------------设置导航条----------------
//        //设置背景(设置背影图片时, 必须得要使用)
//        if ([self.typeOfTab isEqualToString: @"boy"])
//            [bar setBackgroundImage:[UIImage imageNamed:@"shared_navbar_bg"] forBarMetrics:UIBarMetricsDefault];
//        
//        if ([self.typeOfTab isEqualToString: @"girl"])
//            [bar setBackgroundImage:[UIImage imageNamed:@"shared_navbargirl_bg"] forBarMetrics:UIBarMetricsDefault];
//        
//        if ([self.typeOfTab isEqualToString: @"kids"])
//            [bar setBackgroundImage:[UIImage imageNamed:@"shared_navbar_bg-1"] forBarMetrics:UIBarMetricsDefault];
//        
//        if ([self.typeOfTab isEqualToString: @"life"])
//            
//            [bar setBackgroundImage:[UIImage imageNamed:@"shared_navbar_bg"] forBarMetrics:UIBarMetricsDefault];
//}



// 界面加载完成之后调用
- (void)viewDidLoad {
    [super viewDidLoad];
//    添加手势 滑动功能
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    [self.view addGestureRecognizer:pan];

    // 控制器手势什么时候触发
    pan.delegate = self;
    self.interactivePopGestureRecognizer.enabled = NO;

    // Bug:假死状态:程序一直在跑,但是界面死了
    // 在根控制器下,滑动返回, 不应该在跟控制器的view上滑动返回
    // 清空手势代理,恢复滑动返回功能
    
//    系统滑动功能
//    self.interactivePopGestureRecognizer.delegate = self;

// NSLog(@"%s",__func__);
    
}
// 当类被加载内存当中就会被调用
+ (void)load {
//    NSLog(@"%s",__func__);
}

#pragma mark - ———— 设置导航栏 背景 （标题） ————

// 当当前类或者它的子类第一次使用的时候调用.
+ (void)initialize {
//    NSLog(@"%s",__func__);
    
    //获取整个应用程序下所有的导航条.
    //UINavigationBar *bar = [UINavigationBar appearance];
    
    //获取指定类下面的导航条
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[MDQNavgationController class]]];
    // --------------设置导航条----------------
    //设置背景(设置背影图片时, 必须得要使用)
//   shared_navbargirl_bg    shared_navbar_bg-1
//    [bar setBackgroundImage:[UIImage imageNamed:@"shared_navbar_bg-1"] forBarMetrics:UIBarMetricsDefault];
    
    
    
    // ------------- 设置导航条上的标题颜色 ---------------
    // 这里不许要设置 APP 没这个需求 APP 全是自定义的 view
    // 设置主题颜色
//     [nav.navigationBar setTintColor:[UIColor whiteColor]];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    dict[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    [bar setTitleTextAttributes:dict];
    

}


#pragma mark - ———— 设置导航栏  返回按钮 ————
// ------------------- 设置导航栏的返回按钮 -------------------------
// 切换控制器的时候 设置 返回按钮的样子
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 判断非跟控制器 才设置返回按钮
    if (self.childViewControllers.count > 0)
    {
//        样式
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//      [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//      [backBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
//      [backBtn setTitle:@"返回" forState:UIControlStateNormal];
        [backBtn setImage:[UIImage imageNamed:@"shared_back_icon"] forState:UIControlStateHighlighted];
        [backBtn setImage:[UIImage imageNamed:@"shared_back_icon"] forState:UIControlStateNormal];
        
//        事件
        [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        [backBtn sizeToFit];
        // 注意:一定要在按钮内容有尺寸的时候,设置才有效果
        backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 0);
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    }

    // 这个方法才是真正执行跳转
    [super pushViewController:viewController animated:animated];
}
- (void)back
{
    [self popViewControllerAnimated:YES];
}

#pragma mark - ———— 设置滑动返回 UIGestureRecognizerDelegate————
// 是否触发手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    // 在根控制器下 不要 触发手势
    return self.childViewControllers.count > 1;
}



@end
