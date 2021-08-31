//
//  AppDelegate.m
//  FlutterBoostDemo
//
//  Created by zhubiao on 2021/8/31.
//

#import "AppDelegate.h"
#import "ViewController.h"

//#import "FlutterBoostDemo-Swift.h"
#import "BoostDelegate.h"
#import <flutter_boost/FlutterBoost.h>

@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:[[ViewController alloc]init]];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    BoostDelegate *boostDelegate = [[BoostDelegate alloc]init];
    boostDelegate.navigationController = nav;
    
    
    [FlutterBoost.instance setup:application delegate:boostDelegate callback:^(FlutterEngine *engine) {
        
    }];
    return YES;
}




@end
