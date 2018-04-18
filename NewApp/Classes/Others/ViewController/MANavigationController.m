//
//  MANavigationController.m
//  MyAsthma_test_one
//
//  Created by 韩云鹏 on 16/8/2.
//  Copyright © 2016年 HanYunpeng. All rights reserved.
//

#import "MANavigationController.h"

@implementation MANavigationController

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"navibar_back" forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"back-click"] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
        button.size = CGSizeMake(100, 30);
        [button sizeToFit];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    }
    [super pushViewController:viewController animated:animated];
}

-(void)backClick {
    [self popViewControllerAnimated:YES];
}
@end
