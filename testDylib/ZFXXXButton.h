//
//  ZFXXXButton.h
//  testDylib
//
//  Created by rise on 2022/2/16.
//  Copyright © 2022 rise. All rights reserved.
//

#import <UIKit/UIKit.h>
//导入第三方库DingtalkPod
#import "DingtalkPod.h"
//宏定义屏幕的宽度和高度
#define KScreenHeight [UIScreen mainScreen].bounds.size.height
#define KScreenWidth [UIScreen mainScreen].bounds.size.width

NS_ASSUME_NONNULL_BEGIN

@interface ZFXXXButton : UIView

//按钮（用于点击弹出经纬度输入框）
@property (nonatomic,strong)UIButton *btn;
//DingtalkPod对象用于修改经纬度操作
@property (nonatomic,strong)DingtalkPod *pod;

@end

NS_ASSUME_NONNULL_END
