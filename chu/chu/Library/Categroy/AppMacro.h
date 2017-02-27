//
//  AppMacro.h
//  iOSCodeProject
//
//  Created by Fox on 14-7-17.
//  Copyright (c) 2014年 翔傲信息科技（上海）有限公司. All rights reserved.
//

/**
 *  项目内公共常用宏定义
 */

#ifndef iOSCodeProject_AppMacro_h
#define iOSCodeProject_AppMacro_h

#pragma mark - Format
/**
 *  生成字符串
 *
 *  @param ... 格式化参数
 *
 *  @return 得到的字符串
 */
#define str(...) [NSString stringWithFormat:__VA_ARGS__]

//不同屏幕尺寸字体适配（414，736是因为效果图为IPHONE6s+ 如果不是则根据实际情况修改）
#define kScreenWidthRatio  (Main_Screen_Width  / 414.0)
#define kScreenHeightRatio (Main_Screen_Height / 736.0)
#define AdaptedWidth(x)  ceilf((x) * kScreenWidthRatio)
#define AdaptedHeight(x) ceilf((x) * kScreenHeightRatio)
#define kFontSize(x)     SYSTEM_FONT(AdaptedWidth(x))
#define kCFontSize(x)     CHINESE_FONT(AdaptedWidth(x))
#define kBFontSize(x)     SBOLD_FONT(AdaptedWidth(x))

/**
 *  根据名字返回对应的图片
 */
#define img(name) [UIImage imageNamed:name]
//初始化控制器
#define ABLViewController(StoryId) [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:StoryId];
//初始化视图
#define ABLUINib(name,owner) [[UINib nibWithNibName:name bundle:nil] instantiateWithOwner:owner options:nil][0]
//正式库请求头
//#define BASE_URL @"http://api.ybl365.com/"

//请求token
#define AccessToken @"AccessToken"
//刷新token
#define RefreshToken @"RefreshToken"
//判断是否是登录界面 1:是 0:不是
#define LoginType @"LoginType"
//写入
#define SetUserDefault(Object,Key) [[NSUserDefaults standardUserDefaults] setObject:Object forKey:Key]
//读取
#define GetUserDefault(Key) [[NSUserDefaults standardUserDefaults] objectForKey:Key]
//设置购物车商品的数量(下标)
#define SetABLShoppingNum(Num) [((ABLCustomTabBarController*)self.tabBarController) reloadShoppingCartNumWithNum:Num]

#define ChangeTabbarWithCommodity @"ChangeTabbarWithCommodity"

//测试库请求头
#define BASE_URL @"http://testybl.zzhenghua.cn"

#pragma mark  宏设单例
// .h文件
#define HDSingletonH(name) + (instancetype)shared##name;

// .m文件
#if __has_feature(objc_arc)

#define HDSingletonM(name) \
static id _instace; \
\
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [super allocWithZone:zone]; \
}); \
return _instace; \
} \
\
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [[self alloc] init]; \
}); \
return _instace; \
} \

#else

#define HDSingletonM(name) \
static id _instace; \
\
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [super allocWithZone:zone]; \
}); \
return _instace; \
} \
\
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [[self alloc] init]; \
}); \
return _instace; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instace; \
} \
\
- (oneway void)release { } \
- (id)retain { return self; } \
- (NSUInteger)retainCount { return 1;} \
- (id)autorelease { return self;}

#endif

#pragma mark - Block

/**
 *  弱引用对象
 *
 *  @param self 当前对象
 *
 *  @return 弱应用对象
 */
#define WEAKSELF typeof(self) __weak weakSelf = self;

/**
 *  强引用对象
 *
 *  @param self 当前对象
 *
 *  @return 强引用对象
 */
#define STRONGSELF typeof(self) __strong strongSelf = self;

#pragma mark - Debug

#ifdef DEBUG

/**
 *  在Debug模式下，输出内容
 */
#define DLOG(...)   NSLog(__VA_ARGS__)

/**
 *  在Debug模式下，输出Point信息
 *
 *  @param p 点
 *
 *  @return 点的x和y
 */
#define DLOGPOINT(p)	NSLog(@"%f,%f", p.x, p.y);

/**
 *  在Debug模式下，输出Size信息
 *
 *  @param size 大小
 *
 *  @return 大小的width和height
 */
#define DLOGSIZE(size)	NSLog(@"%f,%f", size.width, size.height);

/**
 *  在Debug模式下，输出Fame信息
 *
 *  @param  p  位置信息
 *
 *  @return 位置的x、y、width和height
 */
#define DLOGRECT(p)	NSLog(@"%f,%f %f,%f", p.origin.x, p.origin.y, p.size.width, p.size.height);

#else

#define DLOG(...)
#define DLOGPOINT(p)
#define DLOGSIZE(p)
#define DLOGRECT(p)

#endif

#pragma mark - Tools methods
/**
 *  判断一个对象是否为空
 *
 *  @param thing 对象
 *
 *  @return 返回结果
 */
static inline BOOL ICIsObjectEmpty(id thing){
    return thing == nil ||
    ([thing isEqual:[NSNull null]]) ||
    ([thing respondsToSelector:@selector(length)] && [(NSData *)thing length] == 0) ||
    ([thing respondsToSelector:@selector(count)]  && [(NSArray *)thing count] == 0);
}

/**
 *  判断一个字符串是否为空
 *
 *  @param string 字符串
 *
 *  @return 返回结果
 */
static inline BOOL ICIsStringEmpty(NSString *string){
    
    if (string == nil) {
        return YES;
    }
    
    if (string.length == 0) {
        return YES;
    }
    
    if ([string isEqualToString:@"<null>"]) {
        return YES;
    }
    
    if ([string isEqualToString:@"(null)"]) {
        return YES;
    }
    
    return NO;
}

#pragma mark -- 枚举
//区域枚举
typedef enum {
    
    ZhengZhou=0,
    HeBei=3,
    TianJin=9
    
}RegionType;

//程序全局委托
#ifndef APPLICATIONDELEGATE
#define APPLICATIONDELEGATE   (AppDelegate*)[[UIApplication sharedApplication] delegate]
#endif

//安全释放
#ifndef RELEASE
#define RELEASE(x)         if(nil != (x)){ [(x) release]; (x) = nil;}
#endif

#pragma mark - iPhone5 adaptation
//是否为iPhone5
#ifndef iPhone5
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ?  \
CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#endif

//是否为iPhone4
#ifndef iPhone4
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ?  \
CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#endif

//设备屏幕高度
#ifndef UIScreenHeight
#define UIScreenHeight   [UIScreen mainScreen].bounds.size.height
#endif

//设备屏幕宽度
#ifndef UIScreenWidth
#define UIScreenWidth    [UIScreen mainScreen].bounds.size.width
#endif

//是否为ios7
#ifndef IOS7
#define IOS7            ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0?YES:NO)
#endif

//如果为ios7，则返回20的冗余
#ifndef IOS7_PADDING
#define IOS7_PADDING    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0?20:0)
#endif


//定义颜色
#define RGBACOLOR(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
//backgroundColor
#define BACKGROUNDCOLOR [UIColor colorWithRed:249.0/255.0 green:249.0/255.0 blue:249.0/255.0 alpha:1]
//改变根视图为主页
#define ChangeRootWithTabbar @"ChangeRootWithTabbar"


//支付宝
#define PARTNER @"2016082801813713"
#define SELLER @"2029220019@qq.com"
//区分真机和模拟器
//TARGET_OS_IPHONE  是否为真机
//TARGET_IPHONE_SIMULATOR  是否为模拟器
/*
if (TARGET_OS_IPHONE) {
    //真机
}else{
    //非真机
}
 */

//区分是否为ARC
#if __has_feature(objc_arc)
//compiling with ARC
#else
// compiling without ARC
#endif

#endif


