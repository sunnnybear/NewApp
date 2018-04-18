//
//  MATabBarViewController.m
//  MyAsthma_test_one
//
//  Created by 韩云鹏 on 16/8/1.
//  Copyright © 2016年 HanYunpeng. All rights reserved.
//

#import "MATabBarViewController.h"
#import "MANavigationController.h"

@interface MATabBarViewController ()

@end

@implementation MATabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 更换tabbar，使用kvc的方式
    //[self setValue:[[MATabbar alloc]init] forKey:@"tabBar"];
    // 通过apperance统一设置tabbaritem字体
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // 初始化子视图控制器
    [self setupChildViewControllerwithVC:[[UIViewController alloc]init] title:@"tabbar_home" image:@"homeIcon" selectImage:@"homeIcon-selected"];
    [self setupChildViewControllerwithVC:[[UIViewController alloc]init] title:@"tabbar_history" image:@"history" selectImage:@"history-selected"];
    [self setupChildViewControllerwithVC:[[UIViewController alloc]init] title:@"tabbar_contact" image:@"contactus" selectImage:@"contactus-selected"];
}

// 创建子视图控制器
- (void)setupChildViewControllerwithVC:(UIViewController *)vc title:(NSString*)title image:(NSString*)image selectImage:(NSString *)selectImage{
    
    //vc.navigationItem.title = title;
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectImage];
    //vc.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(100)/100.0 green:arc4random_uniform(100)/100.0 blue:arc4random_uniform(100)/100.0 alpha:1.0];
    // 导航栏
    MANavigationController *nv = [[MANavigationController alloc] initWithRootViewController:vc];
    nv.navigationBar.barStyle = UIBarStyleDefault;
    //[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:<#(nonnull NSString *)#>] forBarMetrics:UIBarMetricsDefault];
    [self addChildViewController:nv];
    //MALog(@"%s",__func__);
}
@end
