//
//  UIView+ZFXXXButton.m
//  testDylib
//
//  Created by rise on 2022/2/16.
//  Copyright © 2022 rise. All rights reserved.
//

#import "ZFXXXButton.h"


@implementation ZFXXXButton

-(DingtalkPod *) pod{
    if (!_pod) {
        _pod = [[DingtalkPod alloc]init];
    }
    return _pod;
}
//懒加载按钮
- (UIButton *)btn{
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn setTitle:@"修改经纬度" forState:UIControlStateNormal];
        [_btn.titleLabel setFont:[UIFont systemFontOfSize:13]];
        _btn.userInteractionEnabled = YES;
        [_btn addTarget:self action: @selector (btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}
//重写initWithFrame:(CGRect)frame方法，把按钮添加到我们自定义的view中
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//添加按钮
        [self addSubview:self.btn];
//设置透明度
        self.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.5];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    CGSize size = self.frame.size;
//设置按钮在view中的位置
    self.btn.frame = CGRectMake(0, 0, size.width , size .height);
}
 
//点击按钮触发该方法
- (void)btnClick:(UIButton*)btn{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"修改定位" message:@"请输入经纬度" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction: [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler :^(UIAlertAction * _Nonnull action) {
    }]];
        //点击确定按钮，修改经纬度
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *longitudeTextField = alert.textFields.firstObject;
        UITextField *latitudeTextField = alert.textFields.lastObject;
        NSLog(@"经度= %@",longitudeTextField.text) ;
        NSLog(@"纬度= %@",latitudeTextField.text);
       double longitude = [longitudeTextField.text doubleValue];
       double latitude = [latitudeTextField.text doubleValue];
        //调用DingtalkPod的setLocation:方法修改经纬度
        [self.pod setLocation:CLLocationCoordinate2DMake(longitude,latitude)];
    }]];
        //添加经度输入框
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入经度";
        textField.keyboardType = UIKeyboardTypeASCIICapable;
        textField.returnKeyType = UIReturnKeyDone;
    }];
        //添加纬度输入框
    [alert addTextFieldWithConfigurationHandler:^( UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入纬度";
        textField.keyboardType = UIKeyboardTypeASCIICapable;
        textField.returnKeyType = UIReturnKeyDone;
    }];
        //弹出经纬度输入框
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
}

@end
