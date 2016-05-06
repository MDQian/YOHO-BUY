//
//  MDQLeftListViewController.m
//  YH_Mall_iPhone
//
//  Created by 马马 on 16/4/13.
//  Copyright © 2016年 马殿乾. All rights reserved.
//

#import "MDQLeftListViewController.h"
#import <Masonry/Masonry.h>
#import "MDQSideMeneTypeCell.h"

// 可以简写 mas_
// define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
// define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

@interface MDQLeftListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *menuItems1;
@property (nonatomic, strong) NSArray *menuItems2;
// 刚开始以为是 正副标题+图片

// 后来看到素材 才知道是 图片，那么自定义 cell 放一个接口。然后设置对应的图片就好；
@property (nonatomic, strong) NSArray *menuImages1;
@property (nonatomic, strong) NSArray *menuImages2;

@end

@implementation MDQLeftListViewController

static NSString *const CellID1 = @"typeCell";
static NSString *const CellID2 = @"Cell";


- (void)viewDidLoad {
    [super viewDidLoad];
    


    self.view.frame = CGRectMake( - 0.8 *XMScreenW, 0,  0.8 * XMScreenW, XMScreenH);
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    // 显示界面控件
    [self setUpView];
    // 素材所需的数据
    [self materialData];
    // 其他的一些设置
    self.menuTableView.delegate = self;
    self.menuTableView.dataSource = self;
    // 禁止滚动
    self.menuTableView.scrollEnabled = NO;
    
    [self.menuTableView registerNib:[UINib nibWithNibName:@"MDQSideMeneTypeCell" bundle:nil] forCellReuseIdentifier:CellID1];
    
}
#pragma mark - ———— 添加控件 ————

//- (void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//    NSLog(@"gsdfa=>>%f", self.view.xm_x);
//}

- (void)setUpView
{
    // 黑色的导航条
    UIView *stateBarView = [[UIView alloc] init];
    stateBarView.backgroundColor = XMColor(47, 47, 47);
    stateBarView.frame = CGRectMake(0, 0, 0.8 *XMScreenW, 20);
    [self.view addSubview:stateBarView];
    // 侧栏的菜单列表tableview
    UITableView *meanTableV = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    meanTableV.backgroundColor = XMColor(236, 236, 236);
    [self.view addSubview:meanTableV];
    self.menuTableView = meanTableV;
    [meanTableV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(20, 0, 0, 0));
    }];
}
#pragma mark - ———— 界面需要的数据 ————
- (void)materialData
{
    //    self.menuItems1 = @[@"男生",@"女生",@"潮童",@"创意生活",@"折扣专区"];
    self.menuItems2 = @[@"潮流优选",@"明星原创",@"全球购",@"逛"];
    self.menuItems1 = @[@"",@"",@"",@"",@""];
//    self.menuItems2 = @[@"",@"",@"",@""];
    UIImageView *imageV1 = [[UIImageView alloc] init];
    imageV1.image = [UIImage imageNamed:@"home_drawer_level1_boys"];
    imageV1.highlightedImage = [UIImage imageNamed:@"home_drawer_level1_boys_h"];
    
    
    UIImageView *imageV2 = [[UIImageView alloc] init];
    imageV2.image = [UIImage imageNamed:@"home_drawer_level1_girls"];
    imageV2.highlightedImage = [UIImage imageNamed:@"home_drawer_level1_girls_h"];

    UIImageView *imageV3 = [[UIImageView alloc] init];
    imageV3.image = [UIImage imageNamed:@"home_drawer_level1_kids"];
    imageV3.highlightedImage = [UIImage imageNamed:@"home_drawer_level1_kids_h"];

    UIImageView *imageV4 = [[UIImageView alloc] init];
    imageV4.image = [UIImage imageNamed:@"home_drawer_level1_life_style"];
    imageV4.highlightedImage = [UIImage imageNamed:@"home_drawer_level1_life_style_h"];

    UIImageView *imageV5 = [[UIImageView alloc] init];
    imageV5.image = [UIImage imageNamed:@"home_drawer_level1_discount_sale"];
    imageV5.highlightedImage = [UIImage imageNamed:@"home_drawer_level1_discount_sale_h"];
    
    self.menuImages1 = @[imageV1,imageV2,imageV3,imageV4,imageV5];
    
}
#pragma mark - ———— DataSource 数据源————
// 数据源：UITableView会向数据源查询一共有多少行数据以及每一行显示什么数据等
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    return self.menuItems1.count;
    else
    return self.menuItems2.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 自定义 cell
    MDQSideMeneTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID1];
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor =XMColor(47, 47, 47);
//    static NSString *cellID = @"cellID";
    
    UITableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:CellID2]; // 默认存在多余的东西  需要你修改
    if (cell2 == nil )
    {
        cell2 = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellID2];
    }
//    素材数组 存储的 imageView
    UIImageView *imageV = self.menuImages1[indexPath.row];
    switch (indexPath.section) {
        case 0:
//            cell.textLabel.text = self.menuItems1[indexPath.row];
            cell.typeImage.image = imageV.image;
            cell.typeImage.highlightedImage = imageV.highlightedImage;
            return cell;
            break;
        case 1:
            cell2.textLabel.text = self.menuItems2[indexPath.row];
//            cell2.textLabel.text = @"那个姑娘好水灵";
            return cell2;
            break;
//        default:
//            break;
    }
    return cell;
}
#pragma mark - ———— Delegate 代理————

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
        return 70;
    else
        return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"indexPath-----%zd",indexPath);
//    NSLog(@"indexPathsection%zd",indexPath.section);
//    NSLog(@"indexPathRow--%zd",indexPath.row);
    
//    发布通知
//    有些自定义的 cell 也可以传  cell  不是字典哦。这样整个 cell 就传出去了
    NSNotification *note = [NSNotification notificationWithName:@"更改类型"
                                                         object:self
                                                       userInfo:@{@"indexPath":indexPath}];
    [[NSNotificationCenter defaultCenter] postNotification:note];
}




@end
