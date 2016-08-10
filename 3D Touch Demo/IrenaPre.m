//
//  IrenaPre.m
//  3D Touch Demo
//
//  Created by zhongdai on 16/4/11.
//  Copyright © 2016年 irena. All rights reserved.
//

#import "IrenaPre.h"

@implementation IrenaPre
- (void)viewDidLoad {
  [super viewDidLoad];
  [self.view setBackgroundColor:[UIColor redColor]];
  UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
  [btn setTitle:self.item forState:UIControlStateNormal];
  [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  btn.frame = CGRectMake(100, 100, 100, 50);
  [self.view addSubview:btn];
  //  NSLog(@"%@", self.item);
}
/**
 *  peek 过程中的自定义操作
 */
- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {
  //创建点赞操作
  UIPreviewAction *item1 = [UIPreviewAction
      actionWithTitle:@"赞"
                style:UIPreviewActionStyleDefault
              handler:^(UIPreviewAction *_Nonnull action,
                        UIViewController *_Nonnull previewViewController) {
                NSLog(@"赞了");
              }];
  //创建点赞操作
  UIPreviewAction *item2 = [UIPreviewAction
      actionWithTitle:@"举报"
                style:UIPreviewActionStyleDestructive
              handler:^(UIPreviewAction *_Nonnull action,
                        UIViewController *_Nonnull previewViewController) {
                NSLog(@"举报了");
              }];
  /**
   *  添加group的效果可运行看看
   */
  UIPreviewActionGroup *group =
      [UIPreviewActionGroup actionGroupWithTitle:@"group"
                                           style:UIPreviewActionStyleDefault
                                         actions:@[ item1, item2 ]];
  //  return @[ group ];
  return @[ item1, item2 ];
}

@end
