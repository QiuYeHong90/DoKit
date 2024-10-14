//
//  DoraemonRTMViewController.m
//  DoraemonKit
//
//  Created by Ray on 2024/5/23.
//

#import "DoraemonRTMViewController.h"

#import "DoraemonCacheManager.h"
#import "DoraemonRTMObserveWindow.h"
#import "DoraemonFPSOscillogramViewController.h"
#import "DoraemonCellSwitch.h"
#import "DoraemonDefine.h"


@interface DoraemonRTMViewController ()<DoraemonSwitchViewDelegate, DoraemonOscillogramWindowDelegate>

@property (nonatomic, strong) DoraemonCellSwitch *switchView;
@end

@implementation DoraemonRTMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"RTM检测";
    _switchView = [[DoraemonCellSwitch alloc] initWithFrame:CGRectMake(0, self.bigTitleView.doraemon_bottom, self.view.doraemon_width, kDoraemonSizeFrom750_Landscape(104))];
    [_switchView renderUIWithTitle:DoraemonLocalizedString(@"帧率检测开关") switchOn:[[DoraemonCacheManager sharedInstance] rtmSwitch]];
    [_switchView needTopLine];
    [_switchView needDownLine];
    _switchView.delegate = self;
    [self.view addSubview:_switchView];
    [[DoraemonRTMObserveWindow shareInstance] addDelegate:self];
}

- (BOOL)needBigTitleView{
    return YES;
}


#pragma mark -- DoraemonSwitchViewDelegate
- (void)changeSwitchOn:(BOOL)on sender:(id)sender{
    [[DoraemonCacheManager sharedInstance] saveRTMObserveSwitch:on];
    if(on){
        [[DoraemonRTMObserveWindow shareInstance] show];
    }else{
        [[DoraemonRTMObserveWindow shareInstance] hide];
    }
}

#pragma mark -- DoraemonOscillogramWindowDelegate
- (void)doraemonOscillogramWindowClosed {
    [_switchView renderUIWithTitle:DoraemonLocalizedString(@"Rtm检测开关") switchOn:[[DoraemonCacheManager sharedInstance] rtmSwitch]];
}


@end
