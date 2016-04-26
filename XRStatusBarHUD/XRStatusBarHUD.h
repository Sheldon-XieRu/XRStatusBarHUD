//
//  XRStatusBarHUD.h
//  XRStatusBarHUD
//
//  Created by Ru on 25/4/16.
//  Copyright © 2016年 Ru. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XRStatusBarHUD : NSObject

/*
 *显示成功信息
 */

+ (void)showSuccess:(NSString *)msg;

/*
 *显示失败信息
 */

+ (void)showError:(NSString *)msg;


/*
 *显示成功信息
 */

+ (void)showLoading:(NSString *)msg;

/**
 *  隐藏
 */

+(void)hide;

@end
