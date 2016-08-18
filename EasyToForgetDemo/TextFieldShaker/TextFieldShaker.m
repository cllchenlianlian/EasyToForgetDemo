//
//  TextFieldShaker.m
//  ManagementTools
//
//  Created by 陈莲莲 on 16/7/13.
//  Copyright © 2016年 cll. All rights reserved.
//

#import "TextFieldShaker.h"

static NSTimeInterval const CLViewShakerDefaultDuration = 0.5;//默认抖动的时间为0.5秒
static NSString * const CLViewShakerAnimationKey = @"CLViewShakerAnimationKey";

@interface TextFieldShaker()

@property (nonatomic, strong) NSArray * views;
@property (nonatomic, assign) NSUInteger completedAnimations;
@property (nonatomic, copy) void (^completionBlock)();

@end

@implementation TextFieldShaker

- (instancetype)initWithView:(UIView *)view {
    return [self initWithViewsArray:@[view]];
}


- (instancetype)initWithViewsArray:(NSArray *)viewsArray {
    self = [super init];
    if ( self ) {
        self.views = viewsArray;
    }
    return self;
}

- (void)shake{
    [self shakeWithDurtion:CLViewShakerDefaultDuration completion:nil];
}

- (void)shakeWithDurtion:(NSTimeInterval)duration completion:(void (^)())completion{
    self.completionBlock = completion;
    for (UIView *view in self.views) {
        [self addShakeAnimationForView:view withDuration:duration];
    }
}

#pragma mark - Shake Animation

- (void)addShakeAnimationForView:(UIView *)view withDuration:(NSTimeInterval)duration {
    //抖动动画
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    CGFloat currentTx = view.transform.tx;
    
    animation.delegate = self;
    animation.duration = duration;
    animation.values = @[ @(currentTx), @(currentTx + 10), @(currentTx-8), @(currentTx + 8), @(currentTx -5), @(currentTx + 5), @(currentTx) ];
    animation.keyTimes = @[ @(0), @(0.225), @(0.425), @(0.6), @(0.75), @(0.875), @(1) ];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [view.layer addAnimation:animation forKey:CLViewShakerAnimationKey];
}

#pragma mark - CAAnimation Delegate

- (void)animationDidStop:(CAAnimation *)animation finished:(BOOL)flag {
    self.completedAnimations += 1;
    if ( self.completedAnimations >= self.views.count ) {
        self.completedAnimations = 0;
        if ( self.completionBlock ) {
            self.completionBlock();
        }
    }
}



@end
