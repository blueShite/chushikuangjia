//
//  AppDelegate.m
//  chu
//
//  Created by 龙恒宇 on 2017/2/25.
//  Copyright © 2017年 龙恒宇. All rights reserved.
//

#import "AppDelegate.h"
#import "IQKeyboardManager.h"
#import "AFNetworking.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    self.isNetwork = YES;
    //开启键盘管理
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    //设置提示框
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD setMinimumDismissTimeInterval:2];
    [self judgeNetWorkState];
    ViewController * vc = ABLViewController(@"ViewController");
    self.window.rootViewController = vc;
    return YES;
}

//判断网络状态
- (void)judgeNetWorkState{
    AFNetworkReachabilityManager * manage = [AFNetworkReachabilityManager sharedManager];
    [manage startMonitoring];
    [manage setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
                
                self.isNetwork = YES;
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                
                self.isNetwork = YES;
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                
                self.isNetwork = NO;
                break;
                
            default:
                
                self.isNetwork = NO;
                break;
        }
    }];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    self.isNetwork = YES;
    [self judgeNetWorkState];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
