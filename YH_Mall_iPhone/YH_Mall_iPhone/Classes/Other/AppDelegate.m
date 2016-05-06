//
//  AppDelegate.m
//  YH_Mall_iPhone
//
//  Created by 马马 on 16/4/6.
//  Copyright © 2016年 MDQian. All rights reserved.
//

#import "AppDelegate.h"
#import "MDQTabbarController.h"
#import "MDQADViewController.h"
#import "MDQLeftListViewController.h"

@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // 1.创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor brownColor];
    
    // 2.创建窗口的根控制器 => 一开始想显示什么效果
    // UITabBarController:会把第0个子控制器的view添加上去
    // UITabBarController点击下面的按钮,就会把对应子控制器view添加上去,移除上一个子控制器view
//    -----------直接进入 APP 开发 调试使用！！--------------
//    MDQTabbarController *tabBarVc = [[MDQTabbarController alloc] init];
//    self.window.rootViewController = tabBarVc;
    
    
//    ----------- 广告界面进入 APP ----------
    MDQADViewController *adVC = [[MDQADViewController alloc] init];
    self.window.rootViewController = adVC;
    self.window.backgroundColor = [UIColor grayColor];
    

    
    
    
//    父子控制器
//    MDQLeftListViewController *sideVC = [[MDQLeftListViewController alloc] init];
//    [self.window.rootViewController addChildViewController:sideVC];
//    [self.window addSubview:sideVC.view];
//    [sideVC didMoveToParentViewController:self.window.rootViewController];
    
    
    
    
    
    // 3.显示窗口 makeKey:UIApplication主窗口
    // 窗口会把根控制器的view添加到窗口
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
