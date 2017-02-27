//
//  LHYAlert.m
//  UIAlertViewDemo
//
//  Created by 龙恒宇 on 16/7/28.
//  Copyright © 2016年 龙恒宇. All rights reserved.
//

#import "LHYAlert.h"

@implementation LHYAlert

+ (BOOL)isIosVersionGreaterThan8{
    
    return [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 ;
}

+ (void)showAlertWithTitle:(NSString *)title WithMessage:(NSString *)message WithCancelTitle:(NSString *)cancelTitle {
    
    
    if([LHYAlert isIosVersionGreaterThan8]){
        
        [UIAlertController showAlertControllerWithTitle:title WithMessage:message WithCancelBtn:cancelTitle];
        return ;
    }
    
    [UIAlertView showAlertViewWithTitle:title WithMessage:message WithCancelBtn:cancelTitle];
}
+ (void)showAlertWithTitle:(NSString *)title WithMessage:(NSString *)message WithCancelTitle:(NSString *)cancelTitle WithOtherBtns:(NSArray *)otherBtns WithCancelBlock:(void (^)(void))cancel WithDismissBlock:(void (^)(NSInteger))dismiss {
    
    if([LHYAlert isIosVersionGreaterThan8]){
        
        [UIAlertController showAlertControllerWithTitle:title WithMessage:message WithCancelBtn:cancelTitle WithOtherBtns:otherBtns WithCancelBlock:cancel WithDismissBlock:dismiss];
        return;
    }
    [UIAlertView showAlertViewWithTitle:title WithMessage:message WithCancelBtn:cancelTitle WithOtherBtn:otherBtns WithCancelBlock:cancel WithDismissBlock:dismiss];
}

@end
