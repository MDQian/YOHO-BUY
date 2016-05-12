//
//  强迫症不能当程序员.h
//  真的会累死的！！！！
//
//  Created by 马马 on 16/4/6.
//  Copyright © 2016年 马殿乾. All rights reserved.

/* —————————————————————————— 重构 ———————————————————————————————— */

 架构 搭建的不完美 和 走了一个岔路（自定义tabbar） 代码臃肿  虽然效果一样
 但是趁着 代码少 赶紧改了 重构。。。心爱的项目 要珍惜




2015.4.6  星期三                       <Talk is cheap， show me the code>
————————————————————————————————————————————————————————————————————————
#pragma mark - ———— 2015.4.6  星期三 ————
                        搭建基本的框架，界面
1. 搭建文件的架构
    http://www.bubuko.com/infodetail-491525.html   模块化开发
    http://www.cocoachina.com/ios/20151207/14586.html   架构规范
2. 启动界面的两种方式
    1 > 项目环境部署中， App Icon and launch Images
        点击 launch images souce 在 Assets 中创建出和 AppIcon 一样的集合
        吧图片素材 拖进去 （广告界面 又要重新弄一次新的目录文件，因为无法读到这里的文件）
        注意 Xcode 有时候 要重启一下  才能显示
    2 > 在launchScreen.SB 中 加上一个 imageView ，贴上图片

3.main  （程序的入口）程序启动
 UIApplicationMain
    1>.创建UIApplication对象 (1.打电话发短信,打开网页 2.设置应用程序提醒数字 3.设置联网状态 4.控制状态栏)
    2>.创建UIApplication代理对象(1.监听整个应用程序的生命周期 2.处理内存警告,清空图片缓存)
    3>.开启主运行循环,保证程序一直运行,runloop(重要),每一个线程都有runloop,主线程的runloop自动开启,其他线程需要手动管理
    4>.加载info.plist文件,判断下是否指定了main,如何指定就会去加载

 加载main.storyboard
    1>.创建窗口
    2>.创建窗口的根控制器
    3>.显示窗口

4.架构思想
    MVC  MVVM MVCS VIPER:美团
    自定义类 -> 先看下有没有划分项目结构
    自定义类 -> 谁的事情谁管理 -> 方便以后修改需求,顺序找到对应的类做事情
MVC
MVC 的文件夹划分 ： 好处 ： 便于管理 和寻找相应的代码块 ，加深了对 MVC 的理解：
简单来说就是 model模型; view界面 controller控制器 但是我觉得这样理解 MVC的话没多少意思
首先 提到 理解 MVC 这种设计模式我们可以先回想一下 一个 APP 的运行过程
所有的程序都是有 main 函数开始的 从main函数开始 创建一个APP对象然后创建一个主循环（runloop-->do while ） 使 APP 不会退出
然后 调用代理 由代理处理 APP 的各种事件
代理中的不同方法 对应着各种不同的事件 其实包括所有的 .m文件的不同函数(方法)都对应着不同的事件和功能
然后一般来说  代理的 程序启动完毕APP didFinishLaunchingWithOptions 这个里边又会将控制器引出
告诉我们  是 tabbarcontroller 还是 navgationcontroller
然后我们就去创建 一个 Main的文件夹 专门 去管理这些控制器
然后 多控制器  管理多个不同的 控制器 (界面,因为界面就是搭建在控制器上的嘛)
每个控制器 (界面)有管理不同的界面 比如说一个 APP 的主页 个人 什么的


说道这里我们就很明显的发现 一个程序的设计 为了提高程序的 逻辑性 逻辑严密性 可读性 效率 为了使多人协作开发 提高我们的工作效率
我们把程序分为模块化的开发 分步骤的开发  一个功能模块对应着相应的功能 一步一步的来code一个程序
个人理解 这是一种程序设计的规则吧
比如说 一个控制器对应一个界面 一个程序段对应一个自己的职责 一个文件夹对应着不同的 类目
这样 我们理解 MVC 也就很简单了  M  V   C 分别对硬着不同的功能
他们组合起来 搭建一个完整的功能 他们分开对应自己负责的功能，他们相互影响但是又各司其职
我们可以吧业务逻辑和数据处理分开 这样 一个板块的改动 不会需要改动很多余的没必要改动的地方

所以说 MVC我个人觉得是 一中文件的管理方式 一种符合程序设计规则的设计模式

在进一步说 比如说 MVC 中 的代理呀 协议呀 还有 block 解耦什么的 都是让MVC 的各个功能模块处理自己的事情
不是一直说 低耦合 高内聚吗？

MVC 代理就是 让 控制器 处理的事件 和 view的控件分开
通知有时候也能达到代理的作用，但是通知相比代理更加消耗性能

5.多控制器
=。=注意 多控制器 对 viewcontroller 的管理
多控制器的层次 

6.tabbaritem 图标 （文字）
不被渲染的两种方式
： 代码处理
： 对图标素材 直接设置 不被渲染

7.修改插件
 改插件 -> 查找插件 -> 插件怎么安装 -> 打开插件代码 -> 搜索 plug -> 安装路径
 搭建界面 -> 展示内容 -> 调整细节

8.tabbaritem的图标偏移
两种方式
： ViewController.tabBarItem.imageInsets = UIEdgeInsetsMake(7, 0, -7, 0);
：自定义 tabbar layoutSubviews 布局

9.appearance的使用
http://www.xuebuyuan.com/928192.html



2015.4.7  星期四                       <Talk is cheap， show me the code>
————————————————————————————————————————————————————————————————————————
#pragma mark - ———— 2015.4.7  星期四 ————

失眠 半夜起来撸，也没撸出个什么。。。困死 宝宝了
1.设置导航条
我们发现  可以在各个控制器中 通过颜色的背景图片来设置 导航条的颜色
[self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
但是 ，App有皮肤功能，要换肤。所以吧所有导航条集中管理 ---> 自定义导航条
这里的导航条 皮肤图片在 自定义的导航条的 initialize 中，换肤的话要在这里设置。
*******************
****** 坑 *********
******************

2.加载
load：       当类被加载到内存中就调用 ，只调用一次，但是最早
initialize： 当当前类或者它的子类第一次使用的时候调用.
http://www.cocoachina.com/ios/20150104/10826.html  上边两者区别
http://www.bubuko.com/infodetail-765842.html  导航栏在 initialize 中设置！！

viewDidLoad：界面加载出来的时候，每个 VC 只掉用一次

我们设计方法，添加一些空间的时候，第一个要考虑的就是要加载几次？要使用几次？放在合适的地方。

3.导航条 按钮的设置
点击范围过大？
显示尺寸过大？
sizeToFit 这个导致的问题
http://www.bubuko.com/infodetail-1104977.html  sizeToFit的使用

亲妈爆炸的素材


4.更改状态栏的颜色
提问的帖子
http://www.cocoachina.com/bbs/read.php?tid=325440&fpage=0&toread=0&page=2
别人说的
http://my.oschina.net/shede333/blog/304560
解决的办法：
1). View controller-based status bar appearance  为NO
2). Status bar style 为 Opaque black style
——————>状态栏直接消失了=。=什么鬼？
在环境配置里边（Deployment Info 中 ） 查看 是否勾选了 Hide status bar
变白色：
View controller-based status bar appearance  为NO
Status bar style： UIStatusBarStyleLightContent <=====> Deployment Info 中 设置为 liaght

5.设置导航栏的返回按钮
。。。。。。。还没做界面的跳转
。。。。。。。好吧 先做一个界面的跳转 吧返回按钮的样子改变了

根据观察 锁头跳转的界面之后的返回按钮的样式 都一个样子 ，那么在哪里设置？导航栏的返回啊。。。
非跟控制器 下 才可以返回  要做判断 否则的话 所有控制器都有 ，那么跟控制器界面 再返回就出错啦

再一次用到了 appearance 和 appearanceWhenContainedIn





2015.4.8  星期五                       <Talk is cheap， show me the code>
————————————————————————————————————————————————————————————————————————
#pragma mark - ———— 2015.4.8  星期五 ————

1.关于系统自带的滑动返回。以及设置全屏滑动返回
1> 系统自带滑动返回
遵循<UIGestureRecognizerDelegate>
viewDidLoad中 清空手势代理,恢复滑动返回功能 : self.interactivePopGestureRecognizer.delegate = self;
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch    { // 在根控制器下 不要 触发手势
    return self.childViewControllers.count > 1;}
2>设置全屏滑动返回
系统的 实际就是 一个 拖动的手势，我们给 VC.view添加一个手势  让这个手势来替代
UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
[self.view addGestureRecognizer:pan];

// 控制器手势什么时候触发
pan.delegate = self;
self.interactivePopGestureRecognizer.enabled = NO;

参考资料：
http://www.cocoachina.com/ios/20150804/12897.html   差不多一样的代码
http://www.jianshu.com/p/6b5f8e6a62f5  关于苹果返回的文章  了解一下别的 （产品设计）

反思：
系统 屏幕左侧？  ——————>  避免手势冲突。！！！
突然发现 简书 好多好文章。。。以前还懒得看。。看来是时候追简书了



- (void)viewDidLoad {  [super viewDidLoad];
    // 获取系统自带滑动手势的target对象
    id target = self.interactivePopGestureRecognizer.delegate;
    // 创建全屏滑动手势，调用系统自带滑动手势的target的action方法
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    // 给导航控制器的view添加全屏滑动手势
    [self.view addGestureRecognizer:pan];
    // 设置手势代理，拦截手势触发
    pan.delegate = self;
    // 禁止使用系统自带的滑动手势
    self.interactivePopGestureRecognizer.enabled = NO;
}
// 什么时候调用：每次触发手势之前都会询问下代理，是否触发。 // 作用：拦截手势触发
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{   // 注意：只有非根控制器才有滑动返回功能，根控制器没有。
    // 判断导航控制器是否只有一个子控制器，如果只有一个子控制器，肯定是根控制器
    if (self.childViewControllers.count == 1){
        // 表示用户在根控制器界面，就不需要触发滑动手势，
        return NO;  }
    return YES;}


*按钮选中状态必须手动设置 按钮的高领状态 点击就是*

2.广告界面
    界面搭建 ：
固定界面 XIB 还是比较快滴
BUG 没法复现，神尼玛烦。 注意 拖动 资源进去的时候 放进真是文件夹中 Show in Finder 然后在拖进工程文件
因为图片 放 Assets无法打包，所以直接放在项目中

    cocoapods的使用 ：
安装
http://zhidao.baidu.com/link?url=0KHnxJzXxGq4ENK-75bIltZC16uGdEUz3GE8HWEhqSGDOHNShHNLUB2IXy-EXRzZEasALJF5dGbgD4Y92dnigN8QV-jUUQz5JSLCW__Egk7
笔记也有。。。


 加载广告界面 -> 服务器发送 -> AFN -> cocoapods
 命令行 touch:创建 open:打开 cd:进入到某个文件夹
 --no-repo-update:不要更新仓库,迅速加载第三方框架
 (1).cocoapods 创建podfile文件 , 描述需要导入的第三方框架
创建在工程文件下边，和工程（手机）同级，touch podfile
打开文件 添加框架描述    open podfile ，描述后要 command + s保存
 (2).获取框架描述 pod search 第三方框架
 pod search 第三方框架，复制描述信息
 (3).加载第三方框架 pod install/ pod update
 pod install --no-repo-update
 (4).以后只要使用了cocopods,都是通过BuDeJie.xcworkspace
关闭 Xcode工程 用xcworkspace打开
    广告的网络数据
 查看接口文档: 1.基本URL 2.请求方式 3.请求参数
// http://json.cn/ json在线解析器


使用 cocoapods的时候 导入头文件 没有提醒 或许是因为跨工程 ，所以要用下边的格式写 
#import <SDWebImage/UIImageView+WebCache.h>

 BUG:
 NSLocalizedDescription=Request failed: unacceptable content-type: text/html
 解决
 工程搜索 json 然后找到  下边这个  添加进去 @"text/html"
self.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];

关于生命周期
http://my.oschina.net/u/2340880/blog/524564




2015.4.9  星期六                       <Talk is cheap， show me the code>
————————————————————————————————————————————————————————————————————————
1.有货App的广告界面？
其实观察有货界面的额 APP  他并不是 广告，加载图片之后 ————>  主题图片 ——————> 选择类别（男、女、小孩、生活）
因为有货 APP本身就是一个 垂直电商的 APP 他不需要给别的什么做广告（不同于网易，追书，，，，等，毕竟 APP 定位不同）
所以 怎么做呢？
有两个 控制器  全部是淡入淡出？
第一个主题（就是好看的 应季的穿着） 图片？ 从大到小？完毕之后 动画到 真实的控制器？然后在跳转？
根据动画效果，应该是两个 VC 之间的切换
但是 VC 的切换  时长好像不能控制 。。。。所以  动手才是真理


~~~~~~~~~~~~~~~~~~~~🐟~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    我化尘埃飞扬，追寻赤裸逆翔
　　奔去七月刑场，时间烧灼滚烫
　　回忆撕毁臆想，路上行走匆忙
　　难能可贵世上，散播留香磁场
　　我欲乘风破浪，踏遍黄沙海洋
　　与其误会一场，也要不负勇往
　　我愿你是个谎，从未出现南墙
　　笑是神的伪装，笑是强忍的伤
　　就让我走向你，走向你的床
　　就让我看见你，看见你的伤
　　我想你就站在，站在大漠边疆
　　我想你就站在，站在七月上
　　我化尘埃飞扬，追寻赤裸逆翔
　　奔去七月刑场，时间烧灼滚烫
　　回忆撕毁臆想，路上行走匆忙
　　难能可贵世上，散播留香磁场
　　我欲乘风破浪，踏遍黄沙海洋
　　与其误会一场，也要不负勇往
　　我愿你是个谎，从未出现南墙
　　笑是神的伪装，笑是强忍的伤
　　就让我走向你，走向你的床
　　就让我看见你，看见你的伤
　　我想你就站在，站在大漠边疆
　　我想你就站在，站在七月上
~~~~~~~~~~~~~~~~~~~~🐟~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

2015.4.10  星期日                       <Talk is cheap， show me the code>
————————————————————————————————————————————————————————————————————————
1.UIStackView的使用，
ios 9 产生的新的控件，可以自定义内部控件的约束，对齐方式，间距等等，很方便，很强大。
而且可以嵌套。。。。。。
关于新的控件的学习？
——————> 查资料？————————> 资料说的是什么 JB ，这些人博客 千篇一律，质量极差
——————> 利用 XIB ——> 一般来说 XIB 比较直观，大都可以通过界面工具，看出具体效果。
            根据 XIB 了解这个控件的一些属性，使用。当然也要 command点进去 查看
现在的博客，真的是，ctrl + CV 。唉。
2.UIFont
http://www.2cto.com/kf/201306/217730.html
http://wenku.baidu.com/link?url=57UiqlU6kDeedIfgFML5NMyrvXU0ocXhuVTiZI8rqFi55AqkUVS9oEL6JI3_48Nifyk0JSJqRywwF2rnB7axg_jURFNiokxzGipwCiCQpmW

3.顺传
注意接收 数据 在个方法中。。。
仿写 的这个 APP 的架构 顺传 写在 viewdidload 是不对劲的   传值传的太早了！！！
写在了  viewWillLayoutSubviews中 就对了
生命周期有关的函数
通过断点 我们知道了，在第一个界面中  只要有  VC   alloc init  创建 VC 那么，就会调用 loadView加载到内存中
关于  viewDidLoad： 往view中添加一些子视图、从数据库或者网络加载模型数据装配到子视图中

http://my.oschina.net/u/2340880/blog/524564   （前边已经提到了4.8 最后一个哦）
{
//类的初始化方法
+ (void)initialize;
//对象初始化方法
- (instancetype)init;
//从归档初始化
- (instancetype)initWithCoder:(NSCoder *)coder;
//加载视图
-(void)loadView;
//将要加载视图
- (void)viewDidLoad;
//将要布局子视图
-(void)viewWillLayoutSubviews;
//已经布局子视图
-(void)viewDidLayoutSubviews;
//内存警告
- (void)didReceiveMemoryWarning;
//已经展示
-(void)viewDidAppear:(BOOL)animated;
//将要展示
-(void)viewWillAppear:(BOOL)animated;
//将要消失
-(void)viewWillDisappear:(BOOL)animated;
//已经消失
-(void)viewDidDisappear:(BOOL)animated;
//被释放
-(void)dealloc;
}
调用顺序：
————> 1initialize （类初始化方法）   ————> 2init (对象初始化方法)  ————> 3loadView(加载视图)
————> 4viewDidLoad（将要加载视图） ————>5viewWillAppear（将要展示） ————>6viewWillLayoutSubviews（将要布局子控件）
————> 7viewdidlayoutsubviews（已经布局子控件）————>8viewdidappear（已经展示）————>9viewwilldisappear（将要消失）
————> 10 didDisappear（ 已经消失）————>11dealloc（释放）
加载(装进内存？)  布局  展示  移除 销毁
http://my.oschina.net/wolx/blog/389707   这个写的也挺不错的



2015.4.12  星期二                       <Talk is cheap， show me the code>
————————————————————————————————————————————————————————————————————————

2015.4.13  星期三                       <Talk is cheap， show me the code>
————————————————————————————————————————————————————————————————————————
死在研究 bundle 的路上，浪费时间-。-
左侧侧滑按钮 太难出菜单
以前做过的抽屉效果是  仿照 老版本的 QQ 的 ，实现原理是 三个 view 位置 坐标的变化。
但是这个  是控制器。是一个 uitableviewcontroller



2015.4.14  星期四     YH_Mall_iPhone_04        <Talk is cheap， show me the code>
————————————————————————————————————————————————————————————————————————————————
怎么通过别人的代码（demo）  查看一个功能是怎么实现的
通过修改  demo 的里边的 具体参数 观察变化 界面  效果
通过 结构层次图  观察界面的搭建 沟槽
通过 断点 观察 方法的调用


观察得知：策划功能的实现 是父子控制器
然后就是 主界面现实的时候   设置 左侧菜单 VC.view 的 “X” 坐标为负，宽度 = |X| 这样就不会显示在界面中
但是实际是存在的（通过查看层次图，我们看到）

问题 ：
X 坐标改变  只是 VIEW 向右移动，但是 tabbar标签栏 和 navgation导航栏 不会移动？

这个 demo 不行  去看看框架 研究一下框架怎么弄的
http://www.itnose.net/detail/6264077.html
MMDrawerController
SWRevealViewController


框架好多。
uitableview的一些属性方法 http://www.lxway.com/66156091.html



父子关系范式；Custom Container View Controller
http://www.cocoachina.com/industry/20140523/8528.html
相关：
http://blog.csdn.net/yongyinmg/article/details/40619727

几经波折！！！！
不用添加父子控制器！！！！

2015.4.15  星期五     YH_Mall_iPhone_05        <Talk is cheap， show me the code>
————————————————————————————————————————————————————————————————————————————————
2015.4.16  星期六     YH_Mall_iPhone_05        <Talk is cheap， show me the code>
————————————————————————————————————————————————————————————————————————————————
2015.4.17  星期日     YH_Mall_iPhone_05        <Talk is cheap， show me the code>
————————————————————————————————————————————————————————————————————————————————
完成遗留的两个问题，并进行代码的优化  细节调整
1.bundle 的使用 ，根据不同按钮 选择不同的样式
2.首页界面 和 分类界面中的 侧滑按钮
tableview 不滚动
tableview 颜色  cell 颜色    http://blog.csdn.net/a6472953/article/details/7532212
tableview cell间距
选中颜色
自定义 cell


2015.4.18  星期一     YH_Mall_iPhone_06        <Talk is cheap， show me the code>
————————————————————————————————————————————————————————————————————————————————
代码抽取。。。。继承。。。封装
谁的事，谁来做。父类不能依赖子类
属性，可读可写，谁都可以调用
父类 get 方法  只有子类可以用，  子类要用父类的 get 的一些方法时候，子类会重新使用父类的 get 方法
tableview ：的数据源 和代理
http://blog.csdn.net/crazychickone/article/details/38704503

毫无头绪。。。。还是喜欢许巍
ios @2X @3X的使用
http://www.v2ex.com/t/159881
/ 获取 bundle 文件夹
NSString *strNavIconBundle = [[NSBundle mainBundle] pathForResource:@"navIcon" ofType:@"bundle"];

if 男生 { 路径——>boy、路径转图片、        }
if 女生 { 路径——>girl、路径转图片、        }
if 小孩 { 路径——>kids、路径转图片、        }
if 生活 { 路径——>life、路径转图片、        }
——————> 那么  路径的inDirectory：“boy，girl，kids，life” 传做一个 字符串 参数

根据 上一个 VC 选择的哪一种种类 然后进来 根据 tag（number） 设置对应的不同NSString;
当然这里要注意的是 要在 - (void)viewWillAppear:(BOOL)animated;中
伪代码 真的是好

基本解决 但是还有一个坑，那就是设备！！！@2x  @3x

2015.4.19  星期二     YH_Mall_iPhone_06        <Talk is cheap， show me the code>
————————————————————————————————————————————————————————————————————————————————
设置了  tabbar  然后需要设置导航栏

但是 导航栏 自定义了  tabbar 里边的 导航栏 不起效果，因为调用的是自定义的 navgation
这样，我们需要 给 navgation也传值 设置背景图片，但是需要这样做的吗？
他们是一套图，但是分开处理？
在别的地方 改换 type的时候 还要发通知 重新调用方法，
那么  如果放在两个控制器 就需要发两次通知
通知太多 是否会降低运行效率


等一下，顺着做？
当 tabbar 中昨晚了之后 顺序结构执行 在去设置 nav 那么就在这个时候 调用？
看看 想想 试试咯

猪了啊，类方法 是类 调用 方法，失去不到类中的 属性的 。。。


initialize   和 load 的区别
http://www.cocoachina.com/ios/20150104/10826.html
一些面试题
http://blog.csdn.net/ys410900345/article/details/45057901


2015.4.20  星期三     YH_Mall_iPhone_06        <Talk is cheap， show me the code>
————————————————————————————————————————————————————————————————————————————————
侧滑 通过添加窗口 是行不通的，最好的就是 父子控制器
整个 侧滑  的等级 和 tabbar 的平级的

所以 猜测 在代理 给窗口的跟控制器 那一块添加 父子控制器


通知 来 处理 侧滑 选择type 改变外观
先做着一块吧

2015.4.21  星期四     YH_Mall_iPhone_06        <Talk is cheap， show me the code>
————————————————————————————————————————————————————————————————————————————————

2015.4.22  星期五     YH_Mall_iPhone_07        <Talk is cheap， show me the code>
————————————————————————————————————————————————————————————————————————————————

YH_Mall_iPhone_07  这个 基本OK 了  先修改 父子控制器 然后在看情况


在 MDQtabbarcontroller 中  做修改。。。对对对
因为在 自定义的 navgation 的 initialize （类方法）中 无法取得参数 也无法在别的 运行过程方法中 获得参数
即便是 取得了，那么 在下一步的 侧滑改变设置中 你怎么发通知 ？ 所以 把这些改变的 放在一个 tabbar 中处理
那么 下次的变动 只需要 给 tabbar 发一个 通知进行操作就可以了。
当然 下一步 发通知的具体方法 应该需要 吧 设置样式 的代码 具体的抽出来




2015.4.23  星期六     YH_Mall_iPhone_07        <Talk is cheap， show me the code>
————————————————————————————————————————————————————————————————————————————————
YH_Mall_iPhone_07  这个也被搞坏了。。。
 建立 一个 视图控制器A  当做 TabBarController 和 LeftVC 的父控件

NMB 我简直要爆炸  怎么做啊
//http://blog.csdn.net/yongyinmg/article/details/40619727

解决。。。。但有个  警告，就是说层次混乱
【问题处理】
YH_Mall_iPhone[40385:2266920] Warning: Attempt to present <MDQTabbarController: > on <MDQClassViewController: > whose view is not in the window hierarchy!
也就是：
在controller a的viewDidLoad里面直接跳转controller b，然后导致在显示controller b的时候也调用了controller a来显示，然后发现这个window的层次结构就错乱了。
//http://blog.changyy.org/2014/08/ios-warning-attempt-to-present.html
自定义 容器类ViewController
父子控制器的深入解读。。牛逼啊  好文！！！！！！！！！！！从最低的视图层次讲解  但是好早了-。-
//http://www.cocoachina.com/industry/20140523/8528.html



按钮直接跳转过程中出现这个
【问题处理】Application tried to present modally an active controller
【BUG解决】：
//http://blog.sina.com.cn/s/blog_7b9d64af0101aoiw.html    没能解决 但是 有参考意义
//http://blog.csdn.net/xunyn/article/details/20628021  这个说是好像和导航栏有关系  这个人的博客不错 还有面试题啊
 问题详细描述：
Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: 'Application tried to present modally an active controller <TabbarViewController: 0x1765dbe0>.'
解决方法：
判断controller是不是有presentedViewController，没有的话才可以present
if ([UIApplication sharedApplication].delegate.window.rootViewController.presentedViewController == nil) {
    [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:self.gesturePasswordController animated:YES completion:^{
        
    }];
}
关于【presentedViewController】的一些知识点
http://www.cnblogs.com/linyawen/archive/2012/06/09/2542784.html

居然是 跳转的 控制器写错了  MLGB  应该跳转父控制器  而不是 TabbarViewController 没经验写，坑真多。。


2015.4.23  星期日     YH_Mall_iPhone_08        <Talk is cheap， show me the code>
————————————————————————————————————————————————————————————————————————————————
进入界面选择的 搭建好了。那么 现在应该处理  首页 选中侧滑按钮 更换资源  和 分类洁面的侧滑
还有点击两次菜单 覆盖一个 点击的半透明view 不会消失那个小 BUG

if (self.tapView == nil)  解决 重复  一直 创建遮盖层，
懒加载一样呗，只有当为空的时候创建 （否则直接 return）


通知中心   传递 事件 和 数据
//http://www.cnblogs.com/pengyingh/articles/2367374.html   写的也就那样吧 一般
uidivice 通知  系统单例
键盘通知

NSIndexPath
一般用来对多维结构路径的记录  uitableview对其category 了一个初始化方法，但是最终会被解释成path  比如row：1 section：2 那么path就是2-1  那么你取row应该是path中Position为1的index  你这样 row = [indexpath indexAtPosition:1]  section = [indexpath indexAtPosition:0] 来取

侧滑菜单的点击更改主题
：： 一下午的 BUG  好奇怪的 BUG ：：

点击  调用 移动回到首页界面（解决）
添加分类界面的侧滑按钮（解决）


2015.4.24  星期一     YH_Mall_iPhone_08        <Talk is cheap， show me the code>
————————————————————————————————————————————————————————————————————————————————
2015.4.25  星期二     YH_Mall_iPhone_08        <Talk is cheap， show me the code>
————————————————————————————————————————————————————————————————————————————————
2015.4.26  星期三     YH_Mall_iPhone_08        <Talk is cheap， show me the code>
————————————————————————————————————————————————————————————————————————————————
2015.4.27  星期四     YH_Mall_iPhone_08        <Talk is cheap， show me the code>
————————————————————————————————————————————————————————————————————————————————
2015.4.28  星期五     YH_Mall_iPhone_08        <Talk is cheap， show me the code>
————————————————————————————————————————————————————————————————————————————————
2015.4.29  星期六     YH_Mall_iPhone_08        <Talk is cheap， show me the code>
————————————————————————————————————————————————————————————————————————————————
2015.5.1   星期日     YH_Mall_iPhone_08        <Talk is cheap， show me the code>
————————————————————————————————————————————————————————————————————————————————
BUG ：分类界面 策划出后 可以点击选中首页。侧滑之后 那个 tapview  并没有覆盖全部
      解决方案1：设置覆盖全部   2 ：设置不接选 3：在标签栏上在添加一层
2015.5.2   星期一     YH_Mall_iPhone_09        <Talk is cheap， show me the code>
————————————————————————————————————————————————————————————————————————————————
2015.5.3   星期二     YH_Mall_iPhone_09        <Talk is cheap， show me the code>
————————————————————————————————————————————————————————————————————————————————
2015.5.4   星期三     YH_Mall_iPhone_09        <Talk is cheap， show me the code>
————————————————————————————————————————————————————————————————————————————————
2015.5.5   星期四     YH_Mall_iPhone_09        <Talk is cheap， show me the code>
————————————————————————————————————————————————————————————————————————————————
2015.5.6   星期五     YH_Mall_iPhone_09        <Talk is cheap， show me the code>
————————————————————————————————————————————————————————————————————————————————
2015.5.7   星期六     YH_Mall_iPhone_09        <Talk is cheap， show me the code>
————————————————————————————————————————————————————————————————————————————————
火车上哦
BUG 还没解决。就是分类 页面。点击侧滑，仍然可以选中分类页面的那个点击按钮。
先把侧滑这个功能 抽取一下，让一个 VC 有这个功能，然后  首页 和分类的代码 减少 ，就可以更专注与自己页面所做的事情。
抽取 OK 了 >>>>>
首页 和分类 只需要 关注自己要战士的类容 处理的事情就好了。在侧滑VC 中 处理 左侧侧滑 的菜单 和侧滑 的所有事件

解包 ipa 素材之后发现在一个 bundle 中找到了全部的素材。。。上次为啥不知道呢。。0到1 质变啊。了解真相才能拥有自由
那就更换了，然后发现 别的尺寸不对的素材 从@  拖到 2@ 就OK了
这样的话 界面大概会好看些吧
导航栏的图片选-2的，做死的美工，做的颜色太淡 不美观，做了-2，那你倒是把-1的删了啊。瞎几把乱搞。记得拉伸-2
Show slicing 就好了哦



2015.5.12   星期四             本地仓库做了！！！  <Talk is cheap， show me the code>
————————————————————————————————————————————————————————————————————————————————

就业压力山大啊，感觉自己并没有掌握一些有用的知识，反复学习接口方法而已，
API    API   API  去你妹夫的 API

做个人界面？恩 好吧 那就做个人界面



XIB  自定义控件  和  纯代码自定义控件



















