//
//  MDQClassViewController.m
//  YH_Mall_iPhone
//
//  Created by 马马 on 16/4/9.
//  Copyright © 2016年 马殿乾. All rights reserved.
//

#import "MDQClassViewController.h"
#import <Masonry/Masonry.h>
#import "MDQTabbarController.h"

#import "MDQLeftListViewController.h"
// 可以简写 mas_
// define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
// define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS


@interface MDQClassViewController ()

/** 按钮 */
@property (nonatomic ,weak) UIButton  *boyBtn;

@property (nonatomic, weak) NSTimer *timer;

/** 定时时间 time */
@property(nonatomic , assign) int time;
@end

@implementation MDQClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
//
    [self setUpView];
    // 创建定时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange:) userInfo:nil repeats:YES];
}

- (void)setUpView
{
    
    
    UIStackView *chooseBtnView = [[UIStackView alloc] init];
//    chooseBtnView.frame = CGRectMake(50,100 ,260 ,500 );
    // 对齐方式
    [chooseBtnView setAxis:UILayoutConstraintAxisVertical];
    [self.view addSubview:chooseBtnView];
    [chooseBtnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(280, 300));
        make.center.mas_equalTo(self.view);
    }];

    
    
    // 设置控件间距
    chooseBtnView.spacing = 30;
    // 空间大小一致
    chooseBtnView.distribution = UIStackViewDistributionFillEqually;
    chooseBtnView.backgroundColor = [UIColor blackColor];
    
    //——————————————3.1——————————黑条中的btn设置
    // uibutton
    UIButton *btn1 = [[UIButton alloc] init];
    self.boyBtn = btn1;
    btn1.tag = 1;
    [btn1 setTitle:@"男生    BOY" forState:UIControlStateNormal];
//    [btn1.titleLabel setTintAdjustmentMode:]
    [btn1.titleLabel setFont:[UIFont fontWithName: @"ArialRoundedMTBold" size :22]];
    [btn1.layer setBorderWidth:3];
    [btn1.layer setBorderColor:[UIColor whiteColor].CGColor];
    btn1.backgroundColor = [UIColor blackColor];
    [chooseBtnView addArrangedSubview:btn1];
    [btn1 addTarget:self action:@selector(gotoHomeAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *btn2 = [[UIButton alloc] init];
    btn2.tag = 2;
    [btn2 setTitle:@"女生   GIRL" forState:UIControlStateNormal];
//    ArialRoundedMTBold   Courier-Bold"   Georgia-Bold   Helvetica
    [btn2.titleLabel setFont:[UIFont fontWithName: @"ArialRoundedMTBold" size :22]];
    [btn2.layer setBorderWidth:3];
    [btn2.layer setBorderColor:[UIColor whiteColor].CGColor];
    btn2.backgroundColor = [UIColor blackColor];
    [chooseBtnView addArrangedSubview:btn2];
    [btn2 addTarget:self action:@selector(gotoHomeAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *btn3 = [[UIButton alloc] init];
    btn3.tag = 3;
    [btn3 setTitle:@"潮童   KIDS" forState:UIControlStateNormal];
    [btn3.titleLabel setFont:[UIFont fontWithName: @"ArialRoundedMTBold" size :22]];
    [btn3.layer setBorderWidth:3];
    [btn3.layer setBorderColor:[UIColor whiteColor].CGColor];
    btn3.backgroundColor = [UIColor blackColor];
    [chooseBtnView addArrangedSubview:btn3];
    [btn3 addTarget:self action:@selector(gotoHomeAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *btn4 = [[UIButton alloc] init];
    btn4.tag = 4;
    [btn4 setTitle:@"创意生活    LIFE STYLE" forState:UIControlStateNormal];
    [btn4.titleLabel setFont:[UIFont fontWithName: @"ArialRoundedMTBold" size :22]];
    [btn4.layer setBorderWidth:3];
    [btn4.layer setBorderColor:[UIColor whiteColor].CGColor];
    btn4.backgroundColor = [UIColor blackColor];
    [chooseBtnView addArrangedSubview:btn4];
    [btn4 addTarget:self action:@selector(gotoHomeAction:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - ———— 按钮跳转 ————
- (void)gotoHomeAction:(UIButton*)btn
{
//    [_timer invalidate];
    
    MDQTabbarController *appVC = [[MDQTabbarController alloc] init];
    [appVC setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];

    
    MDQLeftListViewController *sideVC = [[MDQLeftListViewController alloc] init];
    UIViewController *parentVC = [[UIViewController alloc] init];
    
    [parentVC addChildViewController:sideVC];
    [parentVC addChildViewController:appVC];
    
    [parentVC.view addSubview:sideVC.view];
    [parentVC.view addSubview:appVC.view];
    sideVC.view.backgroundColor = [UIColor yellowColor];
    parentVC.view.backgroundColor = [UIColor redColor];
    
    [sideVC didMoveToParentViewController:parentVC];
    [appVC didMoveToParentViewController:parentVC];
    
    [self presentViewController:parentVC animated:YES completion:nil];
    appVC.number = btn.tag;
    [_timer invalidate];

}

#pragma mark - ———— 定时器自动跳转 ————
- (void)timeChange:(UIButton*)btn
{
    static int i = 3;
    if (i <= 1) { // 计时完成
        MDQTabbarController *tabVC = [[MDQTabbarController alloc] init];
        [tabVC setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
        
        
        MDQLeftListViewController *sideVC = [[MDQLeftListViewController alloc] init];
        UIViewController *parentVC = [[UIViewController alloc] init];
        
        [parentVC addChildViewController:sideVC];
        [parentVC addChildViewController:tabVC];
        
        [parentVC.view addSubview:sideVC.view];
        [parentVC.view addSubview:tabVC.view];
        sideVC.view.backgroundColor = [UIColor yellowColor];
        parentVC.view.backgroundColor = [UIColor redColor];
        
        [sideVC didMoveToParentViewController:parentVC];
        [tabVC didMoveToParentViewController:parentVC];
        
        [self presentViewController:parentVC animated:YES completion:nil];
        
        // 定时器 自动跳转 设置一个默认的状态 
        tabVC.number = 1;
        [self gotoHomeAction:self.boyBtn];
    }
    i--;
}


#pragma mark - ———— 创建父子控制器 ————

- (void)presentParentAndChildVC
{
}




@end
