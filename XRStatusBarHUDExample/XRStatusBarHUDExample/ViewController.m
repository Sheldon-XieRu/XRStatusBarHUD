//
//  ViewController.m
//  XRStatusBarHUDExample
//
//  Created by Ru on 26/4/16.
//  Copyright © 2016年 Ru. All rights reserved.
//

#import "ViewController.h"
#import "XRStatusBarHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showSuccess {
    
    [XRStatusBarHUD showSuccess:@"成功加载"];
    
    
}


- (IBAction)showError {
    [XRStatusBarHUD showError:@"加载失败"];
}
- (IBAction)hide {
    [XRStatusBarHUD hide];
}

- (IBAction)showLoading {
    
    [XRStatusBarHUD showLoading:@"正在加载"];
}




@end
