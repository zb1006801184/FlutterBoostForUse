//
//  BoostDelegate.m
//  FlutterBoostDemo
//
//  Created by zhubiao on 2021/8/31.
//

#import "BoostDelegate.h"
#import "ViewController.h"
@interface BoostDelegate()
@property (nonatomic, strong) NSMutableDictionary *resultTable;

@end
@implementation BoostDelegate

- (void)popRoute:(FlutterBoostRouteOptions *)options {
    FBFlutterViewContainer *vc = (FBFlutterViewContainer *)self.navigationController.presentedViewController;
    //如果当前被present的vc是container，那么就执行dismiss逻辑
//    &&vc.uniqueIDString == options.uniqueId
    if (vc) {
        //这里分为两种情况，由于UIModalPresentationOverFullScreen下，生命周期显示会有问题
        //所以需要手动调用的场景，从而使下面底部的vc调用viewAppear相关逻辑
        if (vc.modalPresentationStyle == UIModalPresentationOverFullScreen) {
            //这里手动beginAppearanceTransition触发页面生命周期
            [self.navigationController.topViewController beginAppearanceTransition:YES animated:NO];
            [self.navigationController dismissViewControllerAnimated:YES completion:^{
                [self.navigationController.topViewController endAppearanceTransition];
            }];
            
        }else {
            //正常场景，直接dismiss
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        }
    }else {
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }
    
}
    //跳转flutter页面
- (void)pushFlutterRoute:(FlutterBoostRouteOptions *)options {
    NSLog(@"跳转flutter路由：%@,参数：%@",options.pageName,options.arguments);
    FBFlutterViewContainer *vc = [[FBFlutterViewContainer alloc]init];
    [vc setName:options.pageName uniqueId:options.uniqueId params:options.arguments opaque:options.opaque];
    //用参数控制是push  还是  pop
    NSString *isPresent = [options.arguments objectForKey:@"isPresent"];
    BOOL isAnimated = options.arguments[@"isAnimated"] == nil ? YES:(BOOL)options.arguments[@"isAnimated"];
    
    [self.resultTable setValue: options.onPageFinished forKey:[vc uniqueIDString]];
    //如果是present模式 ，或者要不透明模式，那么就需要以present模式打开页面
    if([isPresent isEqualToString:@"YES"] || !options.opaque){
        [self.navigationController presentViewController:vc animated:isAnimated completion:nil];
    }else{
        [self.navigationController pushViewController:vc animated:isAnimated];
    }


}

- (void)pushNativeRoute:(NSString *)pageName arguments:(NSDictionary *)arguments {
    NSLog(@"跳转nativa ,pageName:%@,参数:%@",pageName,arguments);
    NSString *isPresent = [arguments objectForKey:@"isPresent"];
    BOOL isAnimated = arguments[@"isAnimated"] == nil ? YES:(BOOL)arguments[@"isAnimated"];
    UIViewController *targetViewController = [[UIViewController alloc]init];
    if ([pageName isEqualToString:@"ViewController"]) {
        targetViewController = [[ViewController alloc]init];
    }
    
    if ([isPresent isEqualToString: @"YES"]) {
        [self.navigationController presentViewController:targetViewController animated:isAnimated completion:nil];
    }else {
        [self.navigationController pushViewController:targetViewController animated:isAnimated];
    }
    
    
}

- (NSMutableDictionary *)resultTable {
    if (!_resultTable) {
        _resultTable = [[NSMutableDictionary alloc]init];
    }
    return  _resultTable;
}

@end
