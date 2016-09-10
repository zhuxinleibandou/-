//
//  CusView.m
//  TestImage
//
//  Created by 朱信磊 on 16/7/20.
//  Copyright © 2016年 朱信磊. All rights reserved.
//

#import "CusView.h"

@implementation CusView


-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}




//使用蒙版进行绘制。
- (void)drawRect:(CGRect)rect {
    
    CGContextRef cxt = UIGraphicsGetCurrentContext();
    CGContextSaveGState(cxt);
    //获取蒙版
    UIImage *mask =  [UIImage imageNamed:@"mask2"];
    if (mask == nil) {
        CGContextRestoreGState(cxt);
        return;
    } //使用蒙版进行裁剪
  
    CGContextClipToMask(cxt, CGRectMake(0, 0, self.frame.size.width, self.frame.size.height), mask.CGImage);
    
   
    //绘制图像
    UIImage *image = [UIImage imageNamed:@"test"];
    [image drawInRect:rect];
    CGContextRestoreGState(cxt);
}


@end
