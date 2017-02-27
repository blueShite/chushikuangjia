//
//  LHYNavigationController.m
//  chu
//
//  Created by 龙恒宇 on 2017/2/25.
//  Copyright © 2017年 龙恒宇. All rights reserved.
//

#import "LHYNavigationController.h"

@interface LHYNavigationController ()

@end

@implementation LHYNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBar.barTintColor=[UIColor colorForHex:@"02B8D4"];
    self.navigationBar.tintColor=[UIColor whiteColor];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:17.0]}];
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
