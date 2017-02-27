//
//  LHYAlert.h
//  UIAlertViewDemo
//
//  Created by 龙恒宇 on 16/7/28.
//  Copyright © 2016年 龙恒宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIAlertView+LHYAlert.h"
#import "UIAlertController+LHYAlert.h"

@interface LHYAlert : NSObject
/**
 *  显示提示框(只有取消)
 *
 *  @param title       提示框名称
 *  @param message     提示消息
 *  @param cancelTitle 取消按钮名称
 */
+ (void)showAlertWithTitle:(NSString *)title WithMessage:(NSString *)message WithCancelTitle:(NSString *)cancelTitle;
/**
 *  显示提示框
 *
 *  @param title       提示框名称
 *  @param message     提示消息
 *  @param cancelTitle 取消按钮名称
 *  @param otherBtns   其他按钮名称(数据)
 *  @param cancel      点击取消
 *  @param dismiss     点击其他
 */
+ (void)showAlertWithTitle:(NSString *)title WithMessage:(NSString *)message WithCancelTitle:(NSString *)cancelTitle WithOtherBtns:(NSArray *)otherBtns WithCancelBlock:(void(^)(void))cancel WithDismissBlock:(void(^)(NSInteger i))dismiss;

@end
