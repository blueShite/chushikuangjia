//
//  UIView+Utils.m
//  Borrowed from Three20
//
//  Created by zym on 14-7-18.
//  Copyright (c) 2014年 翔傲信息科技（上海）有限公司. All rights reserved.
//

#import "UIView+Utils.h"
#import <objc/runtime.h>

static char kDTActionHandlerTapBlockKey;
static char kDTActionHandlerTapGestureKey;
static char kDTActionHandlerLongPressBlockKey;
static char kDTActionHandlerLongPressGestureKey;

@implementation UIView (Utils)


- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint) point {
    self.frame = CGRectMake(point.x, point.y, self.frame.size.width, self.frame.size.height);
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize) size {
    self.frame = CGRectMake(self.x, self.y, size.width, size.height);
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x {
    self.frame = CGRectMake(x, self.y, self.width, self.height);
}

- (CGFloat)y {
    return self.frame.origin.y;
}
- (void)setY:(CGFloat)y {
    self.frame = CGRectMake(self.x, y, self.width, self.height);
}

- (CGFloat)height {
    return self.frame.size.height;
}
- (void)setHeight:(CGFloat)height {
    self.frame = CGRectMake(self.x, self.y, self.width, height);
}

- (CGFloat)width {
    return self.frame.size.width;
}
- (void)setWidth:(CGFloat)width {
    self.frame = CGRectMake(self.x, self.y, width, self.height);
}

- (CGFloat)tail {
    return self.y + self.height;
}

- (void)setTail:(CGFloat)tail {
    self.frame = CGRectMake(self.x, tail - self.height, self.width, self.height);
}

- (CGFloat)bottom {
    return self.tail;
}

- (void)setBottom:(CGFloat)bottom {
    [self setTail:bottom];
}

- (CGFloat)right {
    return self.x + self.width;
}

- (void)setRight:(CGFloat)right {
    self.frame = CGRectMake(right - self.width, self.y, self.width, self.height);
}




- (CGFloat)orientationWidth {
    return UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)
    ? self.height : self.width;
}



- (CGFloat)orientationHeight {
    return UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)
    ? self.width : self.height;
}



- (UIView*)descendantOrSelfWithClass:(Class)cls {
    if ([self isKindOfClass:cls])
        return self;
    
    for (UIView* child in self.subviews) {
        UIView* it = [child descendantOrSelfWithClass:cls];
        if (it)
            return it;
    }
    
    return nil;
}



- (UIView*)ancestorOrSelfWithClass:(Class)cls {
    if ([self isKindOfClass:cls]) {
        return self;
        
    } else if (self.superview) {
        return [self.superview ancestorOrSelfWithClass:cls];
        
    } else {
        return nil;
    }
}



- (void)removeAllSubviews {
    while (self.subviews.count) {
        UIView* child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}

- (void)setTapActionWithBlock:(void (^)(void))block
{
	UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &kDTActionHandlerTapGestureKey);
    
	if (!gesture)
	{
		gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(__handleActionForTapGesture:)];
		[self addGestureRecognizer:gesture];
		objc_setAssociatedObject(self, &kDTActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
	}
    
	objc_setAssociatedObject(self, &kDTActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)__handleActionForTapGesture:(UITapGestureRecognizer *)gesture
{
	if (gesture.state == UIGestureRecognizerStateRecognized)
	{
		void(^action)(void) = objc_getAssociatedObject(self, &kDTActionHandlerTapBlockKey);
        
		if (action)
		{
			action();
		}
	}
}

- (void)setLongPressActionWithBlock:(void (^)(void))block
{
	UILongPressGestureRecognizer *gesture = objc_getAssociatedObject(self, &kDTActionHandlerLongPressGestureKey);
    
	if (!gesture)
	{
		gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(__handleActionForLongPressGesture:)];
		[self addGestureRecognizer:gesture];
		objc_setAssociatedObject(self, &kDTActionHandlerLongPressGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
	}
    
	objc_setAssociatedObject(self, &kDTActionHandlerLongPressBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)__handleActionForLongPressGesture:(UITapGestureRecognizer *)gesture
{
	if (gesture.state == UIGestureRecognizerStateBegan)
	{
		void(^action)(void) = objc_getAssociatedObject(self, &kDTActionHandlerLongPressBlockKey);
        
		if (action)
		{
			action();
		}
	}
}
- (void)fadeIn{
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.alpha = 1;
        
    }];
}
- (void)fadeOut{
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.alpha = 0;
        
    }];
}

@end
