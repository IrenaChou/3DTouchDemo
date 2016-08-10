//
//  IrenaForce.m
//  3D Touch Demo
//
//  Created by zhongdai on 16/4/12.
//  Copyright © 2016年 irena. All rights reserved.
//

#import "IrenaForce.h"

@interface IrenaForce ()
@property(nonatomic, strong) UIBezierPath *path;
@end

@implementation IrenaForce
- (void)drawRect:(CGRect)rect {
  [[UIColor orangeColor] set];
  [self.path fill];
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  //获取触摸对象
  UITouch *touch = [touches anyObject];
  NSLog(@"%lf", touch.force);

  //创建路径
  //根据压力*系数 手指的位置为圆心画圆
  UIBezierPath *path = [[UIBezierPath alloc] init];

  [path addArcWithCenter:[touch locationInView:self]
                  radius:touch.force * 20
              startAngle:0
                endAngle:2 * M_PI
               clockwise:YES];
  self.path = path;
  //重绘
  [self setNeedsDisplay];
}
@end
