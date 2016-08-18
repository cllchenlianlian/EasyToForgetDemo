//
//  PlaceHolderTextField.m
//  ManagementTools
//
//  Created by 陈莲莲 on 16/7/6.
//  Copyright © 2016年 cll. All rights reserved.
//

#import "PlaceHolderTextField.h"

@implementation PlaceHolderTextField

- (void)drawRect:(CGRect)rect {
    
    self.tintColor = [UIColor redColor];
//    [self setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
//    [self setValue:[UIFont systemFontOfSize:12.0f] forKeyPath:@"_placeholderLabel.font"];

}

- (BOOL)resignFirstResponder{
    
    [self setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    return [super resignFirstResponder];
    
}

- (void)drawPlaceholderInRect:(CGRect)rect{
    UIColor *placeholderColor       = [UIColor greenColor];
    [placeholderColor setFill];
    
    CGRect placeholderRect          = CGRectMake(rect.origin.x, (rect.size.height- self.font.pointSize)/2, rect.size.width, self.font.pointSize + 2);
    NSMutableParagraphStyle *style  = [[NSMutableParagraphStyle alloc] init];
    style.lineBreakMode             = NSLineBreakByTruncatingTail;
    style.alignment                 = self.textAlignment;
    NSDictionary *attr              = [NSDictionary dictionaryWithObjectsAndKeys:style,NSParagraphStyleAttributeName, [UIFont systemFontOfSize:12.0f], NSFontAttributeName, placeholderColor, NSForegroundColorAttributeName, nil];
    [self.placeholder drawInRect:placeholderRect withAttributes:attr];
}

@end
