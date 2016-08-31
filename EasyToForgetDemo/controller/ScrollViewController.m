//
//  ScrollViewController.m
//  EasyToForgetDemo
//
//  Created by 陈莲莲 on 16/8/31.
//  Copyright © 2016年 cll. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()
@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic , assign) CGPoint      startTouchPosition;
@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect rect = [UIScreen mainScreen].bounds;
    self.tableView = [[UITableView alloc] init];
    self.tableView.frame = CGRectMake(0, 100, rect.size.width, rect.size.height - 100);
    self.tableView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.tableView];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.view addGestureRecognizer:pan];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)handlePan:(UIPanGestureRecognizer *)sender {
    CGPoint touchPosition = [sender locationInView:self.view];
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:{
            [self.view endEditing:YES];
            self.startTouchPosition = CGPointMake(touchPosition.x, _tableView.frame.origin.x);
        }
            break;
        case UIGestureRecognizerStateChanged:{
            double dx = touchPosition.x - self.startTouchPosition.x;
            if (fabs(dx) > 10 && _tableView) {
                CGFloat percent = MIN(MAX(0, self.startTouchPosition.y + dx)/self.view.frame.size.width,1);
                [self updateMsgControllerConstraintsHiddenPercent:percent animation:NO];
            }
        }
            break;
        case UIGestureRecognizerStateEnded:{
            double dx = touchPosition.x - self.startTouchPosition.x;
            if (fabs(dx)>(self.view.frame.size.width/3.)) {
                [self updateMsgControllerConstraintsHiddenPercent:dx>0?1:0 animation:YES];
            } else {
                [self updateMsgControllerConstraintsHiddenPercent:self.startTouchPosition.y>0?1:0 animation:YES];
            }
        }
            break;
            
        default:
            break;
    }
}

- (void)updateMsgControllerConstraintsHiddenPercent:(CGFloat )percent animation:(BOOL)animation {
    CGRect frame = _tableView.frame;
    frame.origin.x = frame.size.width * percent;
    if (animation) {
        [UIView animateWithDuration:0.25 animations:^{
            _tableView.frame = frame;
        }];
    }else {
        _tableView.frame = frame;
    }
}



@end
