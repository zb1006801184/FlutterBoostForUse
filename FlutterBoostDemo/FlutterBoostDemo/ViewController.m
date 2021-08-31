//
//  ViewController.m
//  FlutterBoostDemo
//
//  Created by zhubiao on 2021/8/31.
//

#import "ViewController.h"
#import <flutter_boost/FlutterBoost.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self centerView];
}

- (void)centerView {
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClick {
    //跳转flutter页面
    FlutterBoostRouteOptions *options = [[FlutterBoostRouteOptions alloc]init];
    //路由的名称
    options.pageName = @"homePage";
    //传入的参数
    options.arguments = @{@"params":@"参数",@"isPresent":@"NO"};
    //跳转完成
    options.completion = ^(BOOL value) {
        NSLog(@"跳转完成了");
    };
    //返回
    options.onPageFinished = ^(NSDictionary *params) {
        NSLog(@"返回了");
    };
    [FlutterBoost.instance open:options];
}

@end
