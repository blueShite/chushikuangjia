//
//  UIAlertController+LHYAlert.h
//  UIAlertViewDemo
//
//  Created by 龙恒宇 on 16/7/28.
//  Copyright © 2016年 龙恒宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (LHYAlert)

//点击取消按钮
typedef void(^onClickCancel)();
//点击其他按钮
typedef void(^onClickDismiss)(NSInteger btnIndex);

/**
 *  显示提示框(只有取消按钮)
 *
 *  @param title          提示框名称
 *  @param message        提示消息
 *  @param cancelBtnTitle 取消按钮名称
 */
+ (void)showAlertControllerWithTitle:(NSString *)title WithMessage:(NSString *)message WithCancelBtn:(NSString *)cancelBtnTitle;
/**
 *  显示提示框
 *
 *  @param title          提示框名称
 *  @param message        提示消息
 *  @param cancelBtnTitle 取消按钮名称
 *  @param otherBtns      其他按钮名称(数组)
 *  @param cancel         取消按钮
 *  @param dismiss        点击其他按钮
 */
+ (void)showAlertControllerWithTitle:(NSString *)title WithMessage:(NSString *)message WithCancelBtn:(NSString *)cancelBtnTitle WithOtherBtns:(NSArray *)otherBtns WithCancelBlock:(onClickCancel)cancel WithDismissBlock:(onClickDismiss)dismiss;

+ (void)showTextFieldAlertControllerWithTitle:(NSString *)title WithMessage:(NSString *)message WithTextStr:(NSString *)textStr WithCancelBtn:(NSString *)cancelBtnTitle WithCancelBlock:(onClickCancel)cancel WithDismissBlock:(onClickDismiss)dismiss;

@end
