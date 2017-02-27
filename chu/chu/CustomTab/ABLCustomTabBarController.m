//
//  ABLCustomTabBarController.m
//  aibianli
//
//  Created by 龙恒宇 on 16/7/11.
//  Copyright © 2016年 龙恒宇. All rights reserved.
//

#import "ABLCustomTabBarController.h"
#import "BarItemView.h"
#import "LHYNavigationController.h"
#import "UIView+AnimationUtils.h"

@interface ABLCustomTabBarController ()

@end

@implementation ABLCustomTabBarController
{
    NSMutableArray        *tabBars;
    NSMutableDictionary   *tabBarNavDic;
}

@synthesize tabBarView;
@synthesize itemNorIcons;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBar.hidden = YES;
    //默认显示的是首页
    tabBars = [NSMutableArray arrayWithCapacity:0];
    tabBarNavDic = [NSMutableDictionary dictionaryWithCapacity:0];
    itemNorIcons = [[NSMutableArray alloc] init];
    [self initTabbar];
    [self createRootViewControllers];
}
//释放
- (void)dealloc {
    
}
//初始化Tabbar
- (void)initTabbar {
    
    tabBarView = [[UIView alloc] initWithFrame:CGRectMake(0, UIScreenHeight-49, UIScreenWidth, 49)];
    tabBarView.backgroundColor = [UIColor colorForHex:@"F7F7F7"];
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, UIScreenWidth, 0.5)];
    lineView.backgroundColor = RGBACOLOR(212, 212, 212, 1);
    [tabBarView addSubview:lineView];
    [self.view addSubview:tabBarView];
    for (int i=0; i<4; i++) {
        
        float width = UIScreenWidth/4;
        BarItemView*barItemView = [[BarItemView alloc] initWithFrame:CGRectMake(i*width,0, width, 50)];
        barItemView.tag = i;
        barItemView.itemBtn.tag = i;
        [barItemView addTarget:self action:@selector(selectTab:)];
        barItemView.itemBtn.userInteractionEnabled = NO;
        [barItemView.itemBtn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tabbar_%d",i+1]] forState:UIControlStateNormal];
        [barItemView.itemBtn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tabbar_%dselect",i+1]] forState:UIControlStateSelected];
        if(i==2){
            self.countImageView = [UIButton buttonWithType:UIButtonTypeCustom];
            self.countImageView.frame = CGRectMake(barItemView.itemBtn.frame.origin.x+barItemView.itemBtn.frame.size.width-8, 3, 16, 16);
            self.countImageView.layer.cornerRadius = 8.0;
            self.countImageView.layer.masksToBounds = YES;
            [self.countImageView setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.countImageView.titleLabel.font = [UIFont systemFontOfSize:7];
            self.countImageView.backgroundColor = [UIColor colorForHex:@"FF4081"];
            self.countImageView.userInteractionEnabled = NO;
            self.countImageView.hidden = YES;
            [barItemView addSubview:self.countImageView];
        }
        [tabBarView addSubview:barItemView];
        [itemNorIcons addObject:barItemView];
        if (i == 0) {
            
            BarItemView *itemView = [itemNorIcons objectAtIndex:i];
            itemView.itemBtn.selected = YES;
            self.selectedIndex = i;
            
        }else{
            
            BarItemView *itemView = [itemNorIcons objectAtIndex:i];
            itemView.itemBtn.selected = NO;
        }
    }
    self.selectedIndex = 0;
}
/**
 *  tabbar的点击事件
 *
 *  @param tap 点击事件
 */
- (void)selectTab:(UIGestureRecognizer*)tap {
    
    for (int i = 0; i < itemNorIcons.count; i ++) {
        if (i == tap.view.tag) {
            
            BarItemView *itemView = [itemNorIcons objectAtIndex:i];
            itemView.itemBtn.selected = YES;
            self.selectedIndex = i;
            
        }else{
            
            BarItemView *itemView = [itemNorIcons objectAtIndex:i];
            itemView.itemBtn.selected = NO;
        }
    }
}
/**
 *  刷新购物车数量
 *
 *  @param num 购物车里商品的数量
 */
- (void)reloadShoppingCartNumWithNum:(NSString *)num {
    
    self.countImageView.hidden = NO;
    if(num.intValue>99){
        
        [self.countImageView setTitle:@"99+" forState:UIControlStateNormal];
        
    }else{
        
        [self.countImageView setTitle:num forState:UIControlStateNormal];
    }
    if(num.integerValue==0||num==nil||[num isKindOfClass:[NSNull class]]){
        
        self.countImageView.hidden = YES;
    }
}
//创建视图控制器
- (void)createRootViewControllers {
    
    
    UIStoryboard * mainStory = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    for (NSString * classVC in self.viewControllClassArray) {
        UIViewController *vc = [mainStory instantiateViewControllerWithIdentifier:classVC];
        LHYNavigationController *nav = [[LHYNavigationController alloc] initWithRootViewController:vc];
        [self addChildViewController:nav];
    }
    
}

- (void)changeTabbarWithCut:(NSInteger)cut {
    
    for (int i = 0; i < itemNorIcons.count; i ++) {
        if (i == cut) {
            
            BarItemView *itemView = [itemNorIcons objectAtIndex:i];
            itemView.itemBtn.selected = YES;
            self.selectedIndex = i;
            
        }else{
            
            BarItemView *itemView = [itemNorIcons objectAtIndex:i];
            itemView.itemBtn.selected = NO;
        }
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
