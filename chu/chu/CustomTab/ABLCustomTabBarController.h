//
//  ABLCustomTabBarController.h
//  aibianli
//
//  Created by 龙恒宇 on 16/7/11.
//  Copyright © 2016年 龙恒宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ABLCustomTabBarController : UITabBarController

@property (nonatomic,strong)UIView *tabBarView;

@property (nonatomic, strong) NSMutableArray *itemNorIcons;

@property (nonatomic,strong) NSArray * viewControllClassArray;;

/**
 *  显示购物车数量的按钮
 */
@property (nonatomic,strong)UIButton * countImageView;

/**
 *  刷新购物车数量
 *
 *  @param num 购物车里商品的数量
 */
- (void)reloadShoppingCartNumWithNum:(NSString *)num;

- (void)changeTabbarWithCut:(NSInteger)cut;

@end
