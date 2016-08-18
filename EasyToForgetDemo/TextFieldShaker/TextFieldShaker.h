//
//  TextFieldShaker.h
//  ManagementTools
//
//  Created by 陈莲莲 on 16/7/13.
//  Copyright © 2016年 cll. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TextFieldShaker : NSObject

- (instancetype)initWithView:(UIView *)view;//设置单个视图抖动
- (instancetype)initWithViewsArray:(NSArray *)viewsArray;//多个视图抖动

- (void)shake;
- (void)shakeWithDurtion:(NSTimeInterval)duration completion:(void(^)())completion;

@end
