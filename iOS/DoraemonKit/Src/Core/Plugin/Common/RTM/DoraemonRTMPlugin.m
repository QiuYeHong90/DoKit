//
//  DoraemonRTMPlugin.m
//  DoraemonKit
//
//  Created by Ray on 2024/5/23.
//

#import "DoraemonRTMPlugin.h"
#import "DoraemonHomeWindow.h"
#import "DoraemonRTMViewController.h"

@implementation DoraemonRTMPlugin
- (void)pluginDidLoad {
    DoraemonRTMViewController *vc = [[DoraemonRTMViewController alloc] init];
    [DoraemonHomeWindow openPlugin:vc];
}
@end
