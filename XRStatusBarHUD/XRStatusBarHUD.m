//
//  XRStatusBarHUD.m
//  XRStatusBarHUD
//
//  Created by Ru on 25/4/16.
//  Copyright © 2016年 Ru. All rights reserved.
//

#import "XRStatusBarHUD.h"


#define XRMessageFont [UIFont systemFontOfSize:12]
#define XRAnimationDuration 0.25


@implementation XRStatusBarHUD

static UIWindow *window_;
static NSTimer *timer_;


+(void)showWindow
{
    CGFloat windowH = 20;
    CGRect windowF = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    
    
    //显示窗口
    window_ = [[UIWindow alloc]init];
    window_.frame = windowF;
    window_.hidden = NO;
    window_.windowLevel = UIWindowLevelAlert;
    
    //动画
    windowF.origin.y = 0;

    [UIView animateWithDuration:XRAnimationDuration animations:^{
        window_.frame = windowF;
    }];
    
    
}



/**
 *  显示普通信息
 *
 *  @param msg   信息内容
 *  @param image 辅助图片
 */

+(void)showMessage:(NSString *)msg image:(UIImage *)image
{
 
    [self showWindow];
    
    [timer_ invalidate];
    
    //显示内容
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = window_.bounds;
    [button setTitle:msg forState:UIControlStateNormal];
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    }
    
    button.titleLabel.font = XRMessageFont;
    
    [window_ addSubview:button];
    
    timer_ = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(hide) userInfo:nil repeats:NO];
    
    
}


/*
 *显示成功信息
 */

+ (void)showSuccess:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"XRStatusBarHUD.bundle/success"]];
  
}
/*
 *显示失败信息
 */

+ (void)showError:(NSString *)msg

{
    [self showMessage:msg image:[UIImage imageNamed:@"XRStatusBarHUD.bundle/error"]];
}
/*
 *显示正在处理的信息
 */

+ (void)showLoading:(NSString *)msg
{
    [timer_ invalidate];
    timer_ = nil;
    
    //显示窗口
    [self showWindow];
    
    //添加标签
    UILabel *label = [[UILabel alloc]init];
    label.font = [UIFont systemFontOfSize:13];
    label.text = @"正在加载";
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    [window_ addSubview:label];

    //添加指示器
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName:XRMessageFont}].width;
    CGFloat indicatorCenterX = (window_.frame.size.width - msgW) * 0.5 - 20;
    CGFloat indicatorCenterY = window_.frame.size.height * 0.5;
    indicator.center = CGPointMake(indicatorCenterX, indicatorCenterY);
    [window_ addSubview:indicator];
    [indicator startAnimating];

}
/**
 *  隐藏
 */

+(void)hide
{
    [UIView animateWithDuration:XRAnimationDuration animations:^{
        CGRect windowF = window_.frame;
        windowF.origin.y = -windowF.size.height;
        window_.frame = windowF;
    } completion:^(BOOL finished) {
        window_ = nil;
    }];
    
    
   
}
@end
