//
//  DoraemonRTMObserveViewController.m
//  DoraemonKit
//
//  Created by Ray on 2024/5/23.
//

#import "DoraemonCacheManager.h"
#import "DoraemonRTMObserveWindow.h"
#import "DoraemonRTMObserveViewController.h"
#import "DoraemonManager.h"

@interface DoraemonRTMObserveViewController ()




@end

@implementation DoraemonRTMObserveViewController

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
    }
    return  _textLabel;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.textLabel.numberOfLines = 0;
    [self.view addSubview:self.textLabel];
    
    NSLayoutConstraint * topLayout = [NSLayoutConstraint constraintWithItem:self.textLabel attribute: NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier: 1 constant: 0];
    NSLayoutConstraint * rightLayout = [NSLayoutConstraint constraintWithItem:self.textLabel attribute: NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier: 1 constant: 0];
    NSLayoutConstraint * leftLayout = [NSLayoutConstraint constraintWithItem:self.textLabel attribute: NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier: 1 constant: 0];

    [self.view  addConstraints: @[
        topLayout,
        rightLayout,
        leftLayout,
        
    
    ] ];
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
}


- (NSString *)title{
    return @"RTM检测";
}

- (NSString *)lowValue{
    return @"0";
}

- (NSString *)highValue{
    return @"60";
}


- (void)closeBtnClick{
    [[DoraemonCacheManager sharedInstance] saveRTMObserveSwitch:NO];
    [[DoraemonRTMObserveWindow shareInstance] hide];
}

- (void)startRecord {
    
    __weak typeof(self) weakSelf = self;
    [DoraemonManager shareInstance].rtmCallBack = ^(NSString * _Nonnull text) {
        weakSelf.textLabel.text = text;
    };
}

- (void)endRecord{
    [DoraemonManager shareInstance].rtmCallBack = nil;
}


@end
