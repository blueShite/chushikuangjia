//
//  BarItemView.m
//  RuiTai
//
//  Created by 润泰－技术部 on 15/9/17.
//  Copyright (c) 2015年 ruitaiLong. All rights reserved.
//

#import "BarItemView.h"

@implementation BarItemView
@synthesize selectd;
@synthesize itemBtn;

- (id)initWithFrame:(CGRect)frame 
{
    self = [super initWithFrame:frame];
    if (self) {
        
        itemBtn = [[UIButton alloc] init];
        itemBtn.frame = CGRectMake(frame.size.width/2-18, 8, 36, 35);
        itemBtn.backgroundColor = [UIColor clearColor];
        [self addSubview:itemBtn];
        
    }
    return self;
}
- (NSString*)addTarget:(id)target action:(SEL)action
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [self addGestureRecognizer:tap];
    return self.tabType;
}

@end
