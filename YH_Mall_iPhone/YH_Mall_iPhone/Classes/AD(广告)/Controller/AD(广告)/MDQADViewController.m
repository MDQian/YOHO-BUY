//
//  MDQADViewController.m
//  YH_Mall_iPhone
//
//  Created by 马马 on 16/4/8.
//  Copyright © 2016年 马殿乾. All rights reserved.
//

#import "MDQADViewController.h"
#import "MDQClassViewController.h"

#import <AFNetworking/AFNetworking.h>
#import <SDWebImage/UIImageView+WebCache.h>




@interface MDQADViewController ()
@property (weak, nonatomic)  UIImageView *lauchImageView;
@property (weak, nonatomic)  UIView *adView;
@property (weak, nonatomic)  UIButton *btn;

// 展示广告图片控件
@property (weak, nonatomic) UIImageView *adImageView;
@property (nonatomic, weak) NSTimer *timer;

@end
/*
 占位视图实现:当一个界面,层次结构已经清晰,但是中间某一层位置,或者尺寸不确定,可以采用占位视图
 */
@implementation MDQADViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // 加载控件
    [self setUpView];
    // 适配屏幕
    [self setUpLaunchImage];
    // 创建定时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
}
// 每隔1秒就会调用
- (void)timeChange
{
    static int i = 3;
    if (i <= 0) { // 计时完成
        [self btnClickAction:nil];
    }
    i--;
    // 设置按钮标题
    NSString *str = [NSString stringWithFormat:@"跳过 (%d)",i];
    [self.btn setTitle:str forState:UIControlStateNormal];
}


#pragma mark - ————  点击广告图片 ————
- (UIImageView *)imageView
{
    if (_adImageView == nil) {
        UIImageView *imageView = [[UIImageView alloc] init];
        _adImageView = imageView;
        [self.adView addSubview:imageView];
    }
    return _adImageView;
}

#pragma mark - ———— 加载控件 ————
- (void)setUpView
{
    UIView *adView = [[UIView alloc] init];
    adView.frame = CGRectMake(0, 0, XMScreenW, XMScreenH);
    adView.backgroundColor = [UIColor clearColor];
    _adView = adView;
    [self.view addSubview:adView];
    
    UIImageView *lauchImageView = [[UIImageView alloc] init];
    lauchImageView.frame = CGRectMake(0, 0, XMScreenW, XMScreenH);
    _lauchImageView = lauchImageView;
    [self.view insertSubview:lauchImageView belowSubview:adView];
    
    UIButton * btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(340, 600, 70, 30);
    btn.backgroundColor = [UIColor blackColor];
    [btn setTitle:@"跳过 (3)" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClickAction:) forControlEvents:UIControlEventTouchUpInside];
    _btn = btn;
    [adView addSubview:btn];
}

#pragma mark - ———— 适配屏幕 ————
- (void)setUpLaunchImage
{
    // 根据不同屏幕高度 加载不同图片
    UIImage *image = nil;
    if (iphone6P) { // 6P
        image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x.png"];
    } else if (iphone6) {
        image = [UIImage imageNamed:@"LaunchImage-800-667h"];
    } else if (iphone5) {
        image = [UIImage imageNamed:@"LaunchImage-700-568h"];
    } else if (iphone4) {
        image = [UIImage imageNamed:@"LaunchImage-700"];
    }
    _lauchImageView.image = image;

}

#pragma mark - ———— 跳转事件 ————
- (void)btnClickAction:(id)sender
{
    // 跳转到主框架界面：push，modal ,更改窗口跟控制器
    // 销毁定时器
    MDQClassViewController *chooseClassVC = [[MDQClassViewController alloc] init];
    
    //UIModalTransitionStyleCoverVertical //上推出现下滑消失
    //UIModalTransitionStyleCrossDissolve // 载入效果淡入淡出
    //UIModalTransitionStylePartialCurl // 书面翻页
    //UIModalPresentationFormSheet // 设备限制  只能在ipad中使用
    //UIModalPresentationPageSheet
    // animation 时间
    //    [UIView setAnimationDuration:1.0];

    [UIView setAnimationDuration:2.0];
    [chooseClassVC setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    
    [self presentViewController:chooseClassVC animated:YES completion:nil];
   

    [_timer invalidate];
}
#pragma mark - ———— 加载广告数据 ————
// 加载广告数据
- (void)loadData
{
    // 请求数据 -> 查看接口文档 -> 测试接口有没有问题 -> 解析数据(w_picurl,ori_curl:广告界面跳转地址,w,h) arr = dict[@"ad"]
    
    // 1.创建请求会话管理者
    // content-type:数据格式
    // unacceptable content-type: text/html" 响应头
    // 响应出问题:
    // 2.创建请求参数:字典
    // 3.发送请求(get,post)
    
}




@end
