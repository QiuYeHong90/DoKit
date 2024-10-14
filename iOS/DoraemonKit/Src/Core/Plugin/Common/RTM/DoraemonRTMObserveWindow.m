//
//  DoraemonRTMObserveWindow.m
//  DoraemonKit
//
//  Created by Ray on 2024/5/23.
//

#import "DoraemonRTMObserveWindow.h"
#import "DoraemonRTMObserveViewController.h"
@implementation DoraemonRTMObserveWindow

+ (DoraemonRTMObserveWindow *)shareInstance{
    static dispatch_once_t once;
    static DoraemonRTMObserveWindow *instance;
    dispatch_once(&once, ^{
        instance = [[DoraemonRTMObserveWindow alloc] initWithFrame:CGRectZero];
    });
    return instance;
}

- (void)addRootVc{
    DoraemonRTMObserveViewController *vc = [[DoraemonRTMObserveViewController alloc] init];
    self.rootViewController = vc;
    self.vc = vc;
}
@end
