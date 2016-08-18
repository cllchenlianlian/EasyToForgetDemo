//
//  OneViewController.m
//  EasyToForgetDemo
//
//  Created by 陈莲莲 on 16/8/17.
//  Copyright © 2016年 cll. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor                   = [UIColor whiteColor];
    [self initString];
}

- (void)initString{

    NSString *string = @"自从宝宝披绿以后，局长出差就提高警惕，晚上给他老婆打电话。\n聊了几句他老婆说：『早点睡吧，今天我太累了……』局长：『我怎么听屋里还有别人动静呢？』老婆：『你出差我一个人，有点怕，叫闺蜜雨晴过来陪我，怎么了？还不相信我呀？要不，我叫雨晴跟你说两句！』局长：『不用了，我相信你，早点睡吧！』放下电话后， 局长看着身边熟睡的雨晴，抽了一宿的烟，然后就病倒了……这个故事告诉我们：\n吸烟有害健康。";
   
    //初始化富文本字符串
    NSMutableAttributedString *attributeString  = [[NSMutableAttributedString alloc]initWithString:string];
    //设置段落样式
    NSMutableParagraphStyle *paragraphStyle     = [[NSMutableParagraphStyle alloc]init];
    //行间距
    paragraphStyle.lineSpacing                  = 3.0f;
    //段落间距
    paragraphStyle.paragraphSpacing             = 10.0f;
    //首行缩进
    paragraphStyle.firstLineHeadIndent          = 20.0f;
    //除首行外其他行进行缩进
//    paragraphStyle.headIndent                   = 10.0f;
    
    [attributeString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, string.length)];
    [attributeString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 1)];//文字颜色
    [attributeString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:25.0f] range:NSMakeRange(0, 1)];//文字字体
    
    NSRange range                               = [string rangeOfString:@"吸烟有害健康。"];
    [attributeString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:range];//文字颜色
    
    UILabel *label                              = [[UILabel alloc]initWithFrame:CGRectMake(20, 100, self.view.frame.size.width - 40, 100)];
   //设置段落样式的时候必须设置numberOfLines为0
    label.numberOfLines                         = 0;
    label.textColor                             = [UIColor blackColor];
    label.attributedText                        = attributeString;
    [label sizeToFit];
    [self.view addSubview:label];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
