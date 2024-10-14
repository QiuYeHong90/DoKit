//
//  DoraemonRTMObserveWindow.h
//  DoraemonKit
//
//  Created by Ray on 2024/5/23.
//

#import <UIKit/UIKit.h>
#import "DoraemonOscillogramWindow.h"
NS_ASSUME_NONNULL_BEGIN

@interface DoraemonRTMObserveWindow : DoraemonOscillogramWindow
+ (DoraemonRTMObserveWindow *)shareInstance;

@end

NS_ASSUME_NONNULL_END
