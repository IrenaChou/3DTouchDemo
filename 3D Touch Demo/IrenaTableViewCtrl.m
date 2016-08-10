
//
//  IrenaTableViewCtrl.m
//  3D Touch Demo
//
//  Created by zhongdai on 16/4/11.
//  Copyright © 2016年 irena. All rights reserved.
//

#import "IrenaPre.h"
#import "IrenaTableViewCtrl.h"

@interface IrenaTableViewCtrl ()<UITableViewDelegate, UITableViewDataSource,
                                 UIViewControllerPreviewingDelegate>
@property(nonatomic, strong) NSArray *items;
@end

@implementation IrenaTableViewCtrl
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
  return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"abc"];

  [cell.textLabel setText:self.items[indexPath.row]];
  [self registerForPreviewingWithDelegate:self sourceView:cell];
  return cell;
}
- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  IrenaPre *pre = [[IrenaPre alloc] init];

  NSLog(@"a");

  [self.navigationController pushViewController:pre animated:YES];
}

/**
 *  peek
 *
 *  @param previewingContext 包含被选中对象的所有信息
 *  @param location          被选中对象手指所在的location
 */
- (nullable UIViewController *)
        previewingContext:(id<UIViewControllerPreviewing>)previewingContext
viewControllerForLocation:(CGPoint)location {
  // indexPathForRowAtPoint获取到的是以当前cell为0,0点的位置
  //我们需要的是从tableview顶部为0,0点的位置，才可以获取到当前被选中的cell
  //获取以cell为0,0点的坐标
  //  NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:location];
  //转化坐标
  //此处的方法一定要看清楚，不是convertPoint:toView:是convertPoint:fromView:
  //  location = [self.tableView convertPoint:location
  //                                   toView:[previewingContext sourceView]];
  location = [self.tableView convertPoint:location
                                 fromView:[previewingContext sourceView]];
  NSLog(@"%@", NSStringFromCGPoint(location));

  NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:location];

  //根据cell获取数组中的数据
  id abc = self.items[indexPath.row];

  IrenaPre *pre = [[IrenaPre alloc] init];
  pre.item = abc;
  return pre;
}
/**
 *  pop
 *
 *  @param previewingContext      包含被选中对象的所有信息
 *  @param viewControllerToCommit peek返回的controller
 */
- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext
     commitViewController:(UIViewController *)viewControllerToCommit {
  //隐藏tabbar
  viewControllerToCommit.hidesBottomBarWhenPushed = YES;
  //跳转到peek的controller
  // animated在pop时无效
  [self.navigationController pushViewController:viewControllerToCommit
                                       animated:YES];
}

- (NSArray *)items {
  if (!_items) {
    _items = [NSArray arrayWithObjects:@"a", @"b", nil];
  }
  return _items;
}
@end
