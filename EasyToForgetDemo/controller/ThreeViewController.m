//
//  ThreeViewController.m
//  EasyToForgetDemo
//
//  Created by 陈莲莲 on 16/8/17.
//  Copyright © 2016年 cll. All rights reserved.
//

#import "ThreeViewController.h"
#import "PlaceHolderTextField.h"

@interface ThreeViewController ()

@property (strong, nonatomic) PlaceHolderTextField *textField;

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.textField                              = [[PlaceHolderTextField alloc]initWithFrame:CGRectMake(80, 200, self.view.frame.size.width - 160, 40)];
    self.textField.borderStyle                  = UITextBorderStyleNone;
    self.textField.placeholder                  = @"doudong";
    self.textField.layer.borderColor            = [UIColor blueColor].CGColor;
    self.textField.layer.borderWidth            = 1.0f;
    self.textField.layer.cornerRadius           = 3.0f;
    self.textField.textColor                    = [UIColor grayColor];
    self.textField.textAlignment                = NSTextAlignmentCenter;
    [self.view addSubview:self.textField];

    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.textField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
