//
//  AppDelegate.m
//  3D Touch Demo
//
//  Created by zhongdai on 16/4/11.
//  Copyright © 2016年 zhongdai. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  /**
   *  3D Touch 动态菜单
   *  其中一个item就是一个菜单项
   */
  UIApplicationShortcutItem *shortcutItem1 =
      [[UIApplicationShortcutItem alloc] initWithType:@"type1"
                                       localizedTitle:@"列表"];

  //使用系统图标
  //  UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon
  //      iconWithType:UIApplicationShortcutIconTypeHome];

  //使用自定义图标
  //  UIApplicationShortcutIcon *icon2 =
  //      [UIApplicationShortcutIcon iconWithTemplateImageName:@""];

  /**
   不设置icon,Title默认靠右
   */
  UIApplicationShortcutItem *shortcutItem2 = [[UIApplicationShortcutItem alloc]
           initWithType:@""
         localizedTitle:@"force"
      localizedSubtitle:@"subtitle 2subtitle 2"
                   icon:[UIApplicationShortcutIcon
                            iconWithTemplateImageName:@""]
               userInfo:nil];

  //  /**
  //   让title默认靠左，但不显示icon
  //   只要在一个cell中设置其它的title都会靠左显示
  //   */
  //  UIApplicationShortcutItem *shortcutItem3 = [[UIApplicationShortcutItem
  //  alloc]
  //           initWithType:@""
  //         localizedTitle:@"force touch"
  //      localizedSubtitle:@"subtitle 2subtitle 2"
  //                   icon:[UIApplicationShortcutIcon
  //                            iconWithTemplateImageName:@""]
  //               userInfo:nil];

  [UIApplication sharedApplication].shortcutItems =
      @[ shortcutItem1, shortcutItem2 ];  //, shortcutItem3

  return YES;
}
/**
 *  点击item菜单会调用此方法
 *
 *  @param application
 *  @param shortcutItem      被点击的item
 *  @param completionHandler
 */
- (void)application:(UIApplication *)application
    performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem
               completionHandler:(void (^)(BOOL))completionHandler {
  //第一个启动的storyboard所指向的是window的根控制器
  //获取tabbarctrl
  UITabBarController *tabBarCtrl =
      (UITabBarController *)application.keyWindow.rootViewController;
  if ([shortcutItem.type isEqualToString:@"type1"]) {
    //点击了列表
    tabBarCtrl.selectedIndex = 1;
  } else if ([shortcutItem.type isEqualToString:@"type2"]) {
    //点击froce
    tabBarCtrl.selectedIndex = 0;
  }
}

- (void)applicationWillResignActive:(UIApplication *)application {
  // Sent when the application is about to move from active to inactive state.
  // This can occur for certain types of temporary interruptions (such as an
  // incoming phone call or SMS message) or when the user quits the application
  // and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down
  // OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  // Use this method to release shared resources, save user data, invalidate
  // timers, and store enough application state information to restore your
  // application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called
  // instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
  // Called as part of the transition from the background to the inactive state;
  // here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  // Restart any tasks that were paused (or not yet started) while the
  // application was inactive. If the application was previously in the
  // background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
  // Called when the application is about to terminate. Save data if
  // appropriate. See also applicationDidEnterBackground:.
}

@end
