//
//  BarItemView.h
//  RuiTai
//
//  Created by 润泰－技术部 on 15/9/17.
//  Copyright (c) 2015年 ruitaiLong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BarItemView : UIView
/**
 *  图片按钮
 */
@property (nonatomic,strong)UIButton    *itemBtn;
/**
 *  是否被选中
 */
@property (nonatomic,assign)BOOL        selectd;

@property (nonatomic,strong)NSString    *tabType;

- (NSString*)addTarget:(id)target action:(SEL)action;

@end
