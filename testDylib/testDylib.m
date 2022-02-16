//  weibo: http://weibo.com/xiaoqing28
//  blog:  http://www.alonemonkey.com
//
//  testDylib.m
//  testDylib
//
//  Created by rise on 2022/2/15.
//  Copyright (c) 2022 rise. All rights reserved.
//

#import "testDylib.h"
#import <CaptainHook/CaptainHook.h>
#import <UIKit/UIKit.h>
#import <Cycript/Cycript.h>
#import <MDCycriptManager.h>
#import <CoreLocation/CoreLocation.h>
#import "DingtalkPod.h"
#import "ZFXXXButton.h"
//宏定义屏幕的宽度和高度
#define KScreenHeight [UIScreen mainScreen].bounds.size.height
#define KScreenWidth [UIScreen mainScreen].bounds.size.width

CHConstructor{
    NSLog(@INSERT_SUCCESS_WELCOME);
    
    [[NSNotificationCenter defaultCenter]
     addObserverForName:UIApplicationDidBecomeActiveNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
#ifndef __OPTMIZE__
        NSLog(@"%@", [UIApplication sharedApplication].keyWindow.rootViewController);
#endif
    }];
    
//    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
//
//#ifndef __OPTIMIZE__
//        CYListenServer(6666);
//
//        MDCycriptManager* manager = [MDCycriptManager sharedInstance];
//        [manager loadCycript:NO];
//
//        NSError* error;
//        NSString* result = [manager evaluateCycript:@"UIApp" error:&error];
//        NSLog(@"result: %@", result);
//        if(error.code != 0){
//            NSLog(@"error: %@", error.localizedDescription);
//        }
//#endif
//
//    }];
}

CHDeclareClass(DTTabBarController)

CHOptimizedMethod0(self, void, DTTabBarController, viewDidLayoutSubviews) {
    //调用y正版钉钉的viewDidLayoutSubviews方法
    CHSuper0(DTTabBarController, viewDidLayoutSubviews);
    //创建ZFXXXButton
    ZFXXXButton *btn = [[ZFXXXButton alloc]initWithFrame:CGRectMake((KScreenWidth - 80)/2, 20 , 80, 50)];
    //获取DTTabBarController控制器的根控制器的view，把ZFXXXButton添加到view上
    UITabBarController * vc = (UITabBarController*)self;
    UIView *view = vc.selectedViewController.view;
    [view addSubview:btn];
}

CHConstructor {
    CHLoadLateClass(DTTabBarController);
    CHClassHook(0, DTTabBarController, viewDidLayoutSubviews);
}

//CHDeclareClass(CustomViewController)
//
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Wstrict-prototypes"
//
////add new method
//CHDeclareMethod1(void, CustomViewController, newMethod, NSString*, output){
//    NSLog(@"This is a new method : %@", output);
//}
//
//#pragma clang diagnostic pop
//
//CHOptimizedClassMethod0(self, void, CustomViewController, classMethod){
//    NSLog(@"hook class method");
//    CHSuper0(CustomViewController, classMethod);
//}
//
//CHOptimizedMethod0(self, NSString*, CustomViewController, getMyName){
//    //get origin value
//    NSString* originName = CHSuper(0, CustomViewController, getMyName);
//
//    NSLog(@"origin name is:%@",originName);
//
//    //get property
//    NSString* password = CHIvar(self,_password,__strong NSString*);
//
//    NSLog(@"password is %@",password);
//
//    [self newMethod:@"output"];
//
//    //set new property
//    self.newProperty = @"newProperty";
//
//    NSLog(@"newProperty : %@", self.newProperty);
//
//    //change the value
//    return @"rise";
//
//}
//
////add new property
//CHPropertyRetainNonatomic(CustomViewController, NSString*, newProperty, setNewProperty);
//
//CHConstructor{
//    CHLoadLateClass(CustomViewController);
//    CHClassHook0(CustomViewController, getMyName);
//    CHClassHook0(CustomViewController, classMethod);
//
//    CHHook0(CustomViewController, newProperty);
//    CHHook1(CustomViewController, setNewProperty);
//}

//CHDeclareClass(CLLocation)
//
//CHOptimizedMethod0(self, CLLocationCoordinate2D, CLLocation, coordinate) {
//  return CLLocationCoordinate2DMake(30.533753, 114.344154);
//}
//
//CHConstructor {
//    CHLoadLateClass(CLLocation);
//    CHClassHook(0, CLLocation, coordinate);
//}

CHDeclareClass (AMapGeoFenceManager);

CHMethod(0, BOOL, AMapGeoFenceManager, detectRiskOfFakeLocation) {
  return NO;
}

CHMethod(0, BOOL, AMapGeoFenceManager, pausesLocationUpdatesAutomatically) {
  return NO;
}

CHConstructor{
    CHLoadLateClass(AMapGeoFenceManager);
    CHClassHook(0, AMapGeoFenceManager, detectRiskOfFakeLocation);
    CHClassHook(0, AMapGeoFenceManager, pausesLocationUpdatesAutomatically);
}

CHDeclareClass(AMapLocationManager);

CHMethod(0, BOOL, AMapLocationManager, detectRiskOfFakeLocation) {
  return NO;
}

CHMethod(0, BOOL, AMapLocationManager, pausesLocationUpdatesAutomatically ) {
  return NO;
}

CHConstructor{
    CHLoadLateClass(AMapLocationManager);
    CHClassHook(0, AMapLocationManager, detectRiskOfFakeLocation);
    CHClassHook(0, AMapLocationManager, pausesLocationUpdatesAutomatically);
}

CHDeclareClass (DTALocationManager);

CHMethod(0, BOOL, DTALocationManager, detectRiskOfFakeLocation) {
  return NO;
}

CHMethod(0, BOOL, DTALocationManager, dt_pausesLocationUpdatesAutomatically) {
  return NO;
}

CHConstructor{
    CHLoadLateClass(DTALocationManager);
    CHClassHook(0, DTALocationManager, detectRiskOfFakeLocation);
    CHClassHook(0, DTALocationManager, dt_pausesLocationUpdatesAutomatically);
}
