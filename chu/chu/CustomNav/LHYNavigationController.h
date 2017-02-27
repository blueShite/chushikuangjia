//
//  LHYNavigationController.h
//  chu
//
//  Created by 龙恒宇 on 2017/2/25.
//  Copyright © 2017年 龙恒宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LHYNavigationController : UINavigationController

//导航条的颜色
@property (nonatomic,copy) NSString * navColorStr;
//导航条字体颜色
@property (nonatomic,strong) UIColor * titleColor;
//导航条的字体的大小
@property (nonatomic,strong) UIFont * titleFont;

@end
