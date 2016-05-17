//
//  AppDelegate.m
//  Heart_Rate_Demo
//
//  Created by TopsTech on 29/04/2015.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeVC.h"

@implementation AppDelegate
@synthesize window, navigationObj;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    HomeVC *HomeVCObj = [[HomeVC alloc] initWithNibName:@"HomeVC" bundle:nil];
    
    navigationObj = [[UINavigationController alloc] initWithRootViewController:HomeVCObj];
    navigationObj.navigationBar.hidden = YES;
    
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [window setRootViewController:navigationObj];
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
