//
//  BoostDelegate.m
//  FlutterBoostDemo
//
//  Created by zhubiao on 2021/8/31.
//

#import "BoostDelegate.h"
@interface BoostDelegate()
@property (nonatomic, strong) NSMutableDictionary *resultTable;

@end
@implementation BoostDelegate

- (void)popRoute:(FlutterBoostRouteOptions *)options {
    
}
    //跳转flutter页面
- (void)pushFlutterRoute:(FlutterBoostRouteOptions *)options {
    NSLog(@"跳转flutter路由：%@,参数：%@",options.pageName,options.arguments);
    FBFlutterViewContainer *vc = [[FBFlutterViewContainer alloc]init];
    [vc setName:options.pageName uniqueId:options.uniqueId params:options.arguments opaque:options.opaque];
    //用参数控制是push  还是  pop
    bool isPresent = options.arguments[@"isPresent"];
    bool isAnimated = options.arguments[@"isAnimated"] == nil ? YES:(BOOL)options.arguments[@"isAnimated"];
    
    [self.resultTable setValue: options.onPageFinished forKey:[vc uniqueIDString]];
    //如果是present模式 ，或者要不透明模式，那么就需要以present模式打开页面
    if(isPresent || !options.opaque){
        [self.navigationController presentViewController:vc animated:isAnimated completion:nil];
    }else{
        [self.navigationController pushViewController:vc animated:isAnimated];
//        [self.navigationController presentViewController:vc animated:isAnimated completion:nil];

    }


}

- (void)pushNativeRoute:(NSString *)pageName arguments:(NSDictionary *)arguments {
    NSLog(@"zz2:%@",pageName);
}

- (NSMutableDictionary *)resultTable {
    if (!_resultTable) {
        _resultTable = [[NSMutableDictionary alloc]init];
    }
    return  _resultTable;
}

@end
