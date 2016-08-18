//
//  TwoViewController.m
//  EasyToForgetDemo
//
//  Created by 陈莲莲 on 16/8/17.
//  Copyright © 2016年 cll. All rights reserved.
//

#import "TwoViewController.h"
#import "TextFieldShaker.h"

@interface TwoViewController ()

@property (strong, nonatomic) UITextField *textField;
@property (strong,nonatomic) TextFieldShaker *shakeNumber;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    _shakeNumber = [[TextFieldShaker alloc] initWithView:_textField];

}

- (void)initUI{
    self.view.backgroundColor                   = [UIColor whiteColor];
    
    self.textField                              = [[UITextField alloc]initWithFrame:CGRectMake(80, 200, self.view.frame.size.width - 160, 40)];
    self.textField.borderStyle                  = UITextBorderStyleNone;
    self.textField.placeholder                  = @"doudong";
    self.textField.layer.borderColor            = [UIColor blueColor].CGColor;
    self.textField.layer.borderWidth            = 1.0f;
    self.textField.layer.cornerRadius           = 3.0f;
    self.textField.textColor                    = [UIColor grayColor];
    [self.view addSubview:self.textField];
    //添加左边间隙
    UIView *leftView                            = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 15, 10)];
    leftView.backgroundColor                    = [UIColor clearColor];
    self.textField.leftView                     = leftView;
    self.textField.leftViewMode                 = UITextFieldViewModeAlways;

    UIButton *btn                               = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame                                   = CGRectMake(120, 280, self.view.frame.size.width - 240, 30);
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btnClick{
    [_shakeNumber shake];
    
//    [_shakeNumber shakeWithDurtion:1 completion:^{
//        
//    }];
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
