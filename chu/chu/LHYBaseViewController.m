//
//  LHYBaseViewController.m
//  chu
//
//  Created by 龙恒宇 on 2017/2/25.
//  Copyright © 2017年 龙恒宇. All rights reserved.
//

#import "LHYBaseViewController.h"

@interface LHYBaseViewController ()

@end

@implementation LHYBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    if (self.navigationController.viewControllers.count >1) {
        
        UIButton * backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        [backBtn setImage:[UIImage imageNamed:@"Nav_back"] forState:UIControlStateNormal];
        [backBtn addTarget:self action:@selector(onClickBack) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:backBtn];
    }
}

//点击返回按钮
- (void)onClickBack {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    
    if (self.navigationController.viewControllers.count >1) {
        ((ABLCustomTabBarController*)self.tabBarController).tabBarView.hidden = YES;
    }else {
        ((ABLCustomTabBarController*)self.tabBarController).tabBarView.hidden = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
