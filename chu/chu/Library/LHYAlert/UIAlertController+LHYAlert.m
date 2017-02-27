//
//  UIAlertController+LHYAlert.m
//  UIAlertViewDemo
//
//  Created by 龙恒宇 on 16/7/28.
//  Copyright © 2016年 龙恒宇. All rights reserved.
//

#import "UIAlertController+LHYAlert.h"
#import <objc/runtime.h>

@implementation UIAlertController (LHYAlert)

+(void)showAlertControllerWithTitle:(NSString *)title WithMessage:(NSString *)message WithCancelBtn:(NSString *)cancelBtnTitle {
    
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertActionStyle style =  UIAlertActionStyleCancel;
    UIAlertAction * action = [UIAlertAction actionWithTitle:cancelBtnTitle style:style handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:action];
    [[UIAlertController getTopViewController] presentViewController:alertController animated:YES completion:nil];
    
}
+(void)showAlertControllerWithTitle:(NSString *)title WithMessage:(NSString *)message WithCancelBtn:(NSString *)cancelBtnTitle WithOtherBtns:(NSArray *)otherBtns WithCancelBlock:(onClickCancel)cancel WithDismissBlock:(onClickDismiss)dismiss {
    
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertActionStyle style =  UIAlertActionStyleCancel;
    UIAlertAction * action = [UIAlertAction actionWithTitle:cancelBtnTitle style:style handler:^(UIAlertAction * _Nonnull action) {
        
        cancel();
    }];
    [alertController addAction:action];
    for (int i=0; i<otherBtns.count; i++) {
        
        UIAlertActionStyle style =  UIAlertActionStyleDefault;
        UIAlertAction * action = [UIAlertAction actionWithTitle:otherBtns[i] style:style handler:^(UIAlertAction * _Nonnull action) {
            dismiss(i);
        }];
        [alertController addAction:action];
        
    }
    [[UIAlertController getTopViewController] presentViewController:alertController animated:YES completion:nil];
    
}

+ (void)showTextFieldAlertControllerWithTitle:(NSString *)title WithMessage:(NSString *)message WithTextStr:(NSString *)textStr WithCancelBtn:(NSString *)cancelBtnTitle WithCancelBlock:(onClickCancel)cancel WithDismissBlock:(onClickDismiss)dismiss {
    
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField){
        textField.placeholder = textStr;
        textField.keyboardType = UIKeyboardTypeNumberPad;
    }];
    
    UIAlertActionStyle style =  UIAlertActionStyleCancel;
    UIAlertAction * action = [UIAlertAction actionWithTitle:cancelBtnTitle style:style handler:^(UIAlertAction * _Nonnull action) {
        
        cancel();
    }];
    [alertController addAction:action];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        UITextField * envField = alertController.textFields.firstObject;
        envField.keyboardType = UIKeyboardTypeNumberPad;
        if ([envField.text isEqualToString:@"0"]||envField.text.length<1)
        {
            [SVProgressHUD showErrorWithStatus:@"输入的数量不能为空或0"];
        }
        else{
            
            dismiss(envField.text.integerValue);
        }
    }]];
    [[UIAlertController getTopViewController] presentViewController:alertController animated:YES completion:nil];
}

+ (UIViewController*)getTopViewController
{
    UIViewController *result = nil;
    
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

@end
