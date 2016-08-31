//
//  FourViewController.m
//  EasyToForgetDemo
//
//  Created by 陈莲莲 on 16/8/22.
//  Copyright © 2016年 cll. All rights reserved.
//

#import "FourViewController.h"

@interface FourViewController ()

/** 是否锁定屏幕方向 */
@property (nonatomic, assign)BOOL isLocked;


@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI{
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 100, 100, 30);
    [button setTitle:@"点击" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(fullScreenAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)fullScreenAction{
  
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请选择屏幕方式" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"横屏" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self interfaceOrientation:UIInterfaceOrientationLandscapeLeft];

        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 200, 100, 30);
        [button setTitle:@"返回" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.view addSubview:button];
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"竖屏" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self interfaceOrientation:UIInterfaceOrientationPortrait];
    }];
    
    [alert addAction:action];
    [alert addAction:action2];
    [[[[UIApplication sharedApplication] keyWindow] rootViewController] presentViewController:alert animated:YES completion:^{
    }];

    //检测设备方向
    [self listeningRotation];
}

- (void)back{
    
    [self interfaceOrientation:UIInterfaceOrientationPortrait];

    [self.navigationController dismissViewControllerAnimated:YES completion:^{
    }];
}

/**
 *  强制屏幕旋转
 *
 *  @param orientation 屏幕方向
 */
- (void)interfaceOrientation:(UIInterfaceOrientation)orientation
{
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        
        int val = orientation;
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
    if (orientation == UIInterfaceOrientationLandscapeRight || orientation == UIInterfaceOrientationLandscapeLeft) {
        // 设置横屏
        [self setOrientationLandscape];
        
    }else if (orientation == UIInterfaceOrientationPortrait) {
        // 设置竖屏
        [self setOrientationPortrait];
        
    }
}

/**
 *  检测设备方向
 */
- (void)listeningRotation{
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onDeviceOrientationChange) name:UIDeviceOrientationDidChangeNotification object:nil];
}

/**
 *  设备方向发生变化
 */
- (void)onDeviceOrientationChange{
    
    UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
    UIInterfaceOrientation interfaceOrientation = (UIInterfaceOrientation)orientation;
    switch (interfaceOrientation) {
        case UIInterfaceOrientationPortraitUpsideDown:{
        
        }
            break;
            
        case UIInterfaceOrientationPortrait:{

        }
            break;
        case UIInterfaceOrientationLandscapeLeft:{
            
        }
            break;
        case UIInterfaceOrientationLandscapeRight:{
            
        }
            break;
        default:
            break;
    }
    
}
/**
 *  设置横屏
 */
- (void)setOrientationLandscape{

    
}

/**
 *  设置竖屏
 */
- (void)setOrientationPortrait{

    
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
