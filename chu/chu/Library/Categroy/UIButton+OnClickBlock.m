//
//  UIButton+OnClickBlock.m
//  aibianli
//
//  Created by 龙恒宇 on 16/7/22.
//  Copyright © 2016年 龙恒宇. All rights reserved.
//

#import "UIButton+OnClickBlock.h"
#import <objc/runtime.h>

@implementation UIButton (OnClickBlock)

static char onClickButtonKey;

- (void)addTargetWithEvents:(UIControlEvents)events WithBlock:(onClickButton)completion {
    
    [self addTarget:self action:@selector(onClickBtn) forControlEvents:events];
    objc_setAssociatedObject(self, &onClickButtonKey, completion, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)onClickBtn {
    
    onClickButton onClick = objc_getAssociatedObject(self, &onClickButtonKey);
    onClick();
    
}

@end
