//
//  UIAlertView+LHYAlert.m
//  UIAlertViewDemo
//
//  Created by 龙恒宇 on 16/7/28.
//  Copyright © 2016年 龙恒宇. All rights reserved.
//

#import "UIAlertView+LHYAlert.h"
#import <objc/runtime.h>

static char cancelBlockName;
static char dismissBlockName;

@implementation UIAlertView (LHYAlert)

@dynamic cancelBlock;
@dynamic dismissBlock;

- (void)setCancelBlock:(onClickCancel)cancelBlock {
    
    objc_setAssociatedObject(self, &cancelBlockName, cancelBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (onClickCancel)cancelBlock {
    
    return objc_getAssociatedObject(self, &cancelBlockName);
}

- (void)setDismissBlock:(onClickDismiss)dismissBlock {
    
    objc_setAssociatedObject(self, &dismissBlockName, dismissBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (onClickDismiss)dismissBlock {
    
    return objc_getAssociatedObject(self, &dismissBlockName);
}


+ (UIAlertView *)showAlertViewWithTitle:(NSString *)title WithMessage:(NSString *)message WithCancelBtn:(NSString *)cancelBtnTitle {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelBtnTitle otherButtonTitles:nil];
    
    [alert show];
    return alert;
}
+ (UIAlertView *)showAlertViewWithTitle:(NSString *)title WithMessage:(NSString *)message WithCancelBtn:(NSString *)cancelBtnTitle WithOtherBtn:(NSArray *)otherBtnTitles WithCancelBlock:(onClickCancel)cancel WithDismissBlock:(onClickDismiss)dismiss {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:[self class] cancelButtonTitle:cancelBtnTitle otherButtonTitles:nil];
    [alert setDismissBlock:dismiss];
    [alert setCancelBlock:cancel];
    for(NSString *buttonTitle in otherBtnTitles)
        [alert addButtonWithTitle:buttonTitle];
    
    [alert show];
    return alert;
    
}
+ (void)alertView:(UIAlertView*) alertView didDismissWithButtonIndex:(NSInteger) buttonIndex {
    
    if(buttonIndex == [alertView cancelButtonIndex])
    {
        if (alertView.cancelBlock) {
            alertView.cancelBlock();
        }
    }
    else
    {
        if (alertView.dismissBlock) {
            alertView.dismissBlock(buttonIndex - 1); // cancel button is button 0
        }
    }
}

@end
