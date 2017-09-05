//
//  BaseViewController.m
//  912
//
//  Created by Seacity on 2017/8/31.
//  Copyright © 2017年 Seacity. All rights reserved.
//

#import "BaseViewController.h"



@interface BaseViewController ()<UIGestureRecognizerDelegate>{
    UIImageView *navBarHairlineImageView;
}

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //默认值为UIRectEdgeAll。当你的容器是navigation controller时，默认的布局将从navigation bar的顶部开始。这就是为什么所有的UI元素都往上漂移了44pt。有时会加上顶部tool bar的高度 20, 20+44 = 64
    //解决table底部空白
    self.edgesForExtendedLayout = NO;
    
    //这句话很关键 如果根是UITabBarController，嵌套的viewcontroller中含有UIScrollView（GDScrollBanner控件中有UIScrollView）
    //会往下偏移状态栏高度（20个点） why? 加上这句话就OK了
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor grayColor];
    
    navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillDisappear:animated];
    navBarHairlineImageView.hidden = YES;
    
    //解决iOS10的适配问题 手势返回，导航栏标题和返回按钮神奇的透明了位置也异常了
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //解决iOS10的适配问题 手势返回，导航栏标题和返回按钮神奇的透明了位置也异常了
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
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
