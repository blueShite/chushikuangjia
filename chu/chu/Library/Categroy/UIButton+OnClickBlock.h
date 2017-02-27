//
//  UIButton+OnClickBlock.h
//  aibianli
//
//  Created by 龙恒宇 on 16/7/22.
//  Copyright © 2016年 龙恒宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (OnClickBlock)

typedef void(^onClickButton)(void);
/**
 *  点击了按钮
 *
 *  @param events     点击的手势
 *  @param completion 触发的事件
 */
- (void)addTargetWithEvents:(UIControlEvents)events WithBlock:(onClickButton)completion;

@end
