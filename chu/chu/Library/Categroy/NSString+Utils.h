//
//  NSString+Utils.h
//  ZJWR
//
//  Created by myqu on 14-8-31.
//  Copyright (c) 2014年 3TI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/**
 *  字符串NSString扩展类别
 */
@interface NSString (Utils)

/**
 *   根据字体大小获取字体的宽高
 *
 *  @param font 字体大小
 *
 *  @return 字符串的宽高
 */
- (CGSize)sizeForStringWithFont:(UIFont*)font;
+ (CGSize)SizeForString:(NSString*)string Font:(UIFont*)font;
/**
 *  根据字符串的长度和字体大小获取宽高
 *
 *  @param string 获取宽高的字符串
 *  @param width  字符串的长度
 *  @param font   字体大小
 *
 *  @return 字符串的宽度高度
 */
+ (CGSize)SizeForString:(NSString*)string Width:(float)width Font:(UIFont*)font;


@end
