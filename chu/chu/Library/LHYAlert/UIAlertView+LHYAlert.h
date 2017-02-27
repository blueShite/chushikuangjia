//
//  UIAlertView+LHYAlert.h
//  UIAlertViewDemo
//
//  Created by 龙恒宇 on 16/7/28.
//  Copyright © 2016年 龙恒宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (LHYAlert)<UIAlertViewDelegate>

//点击取消按钮
typedef void(^onClickCancel)();
//点击其他按钮
typedef void(^onClickDismiss)(NSInteger btnIndex);

@property (copy ,nonatomic) onClickCancel cancelBlock;
@property (copy, nonatomic) onClickDismiss dismissBlock;

/**
 *  只有取消按钮的提示框
 *
 *  @param title          提示框名称
 *  @param message        提示的消息
 *  @param cancelBtnTitle 取消按钮名称
 */
+ (UIAlertView *)showAlertViewWithTitle:(NSString *)title WithMessage:(NSString *)message WithCancelBtn:(NSString *)cancelBtnTitle;
/**
 *  提示框
 *
 *  @param title           提示框名称
 *  @param message         提示的消息
 *  @param cancelBtnTitle  取消按钮名称
 *  @param otherBtnTitles  其他的按钮名称(数组)
 *  @param cancel          取消按钮的点击事件
 *  @param dismiss         其他按钮的点击事件
 */
+ (UIAlertView *)showAlertViewWithTitle:(NSString *)title WithMessage:(NSString *)message WithCancelBtn:(NSString *)cancelBtnTitle WithOtherBtn:(NSArray *)otherBtnTitles WithCancelBlock:(onClickCancel)cancel WithDismissBlock:(onClickDismiss)dismiss;


@end
