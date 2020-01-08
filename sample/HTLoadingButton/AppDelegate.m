//
//  AppDelegate.m
//  HTLoadingButton
//
//  Created by Pokey on 2020/1/7.
//  Copyright © 2020 Pokey. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setRootViewController:[[ViewController alloc] init]];
    [self.window makeKeyAndVisible];
    return YES;
}



@end
