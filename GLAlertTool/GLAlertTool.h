/*********************************************************************
 *
 * 文件名称： GLAlertTool.h
 * 项目名称： GLAlertToolDemo
 * 作   者： Gavin Li
 * Blog  ： https://www.dhlee.cn
 * GitHub： https://github.com/Gavin-ldh
 * 当前版本： 1.0.0
 * 创建日期： 2018/4/19
 * 完成日期： // 输入完成日期，例：2018年08月08日
 * 内容摘要： // 简要描述本文件的内容，包括主要模块、函数及其功能的说明
 * 其它说明： // 其它内容的说明
 *
 * Copyright © 2018年 Gavin Lee. All rights reserved.
 *
 **********************************************************************/


#import "GLAlertTextFieldModel.h"
#import "GLAlertButtonModel.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kGLALERT_TOOL [GLAlertTool shareInstance]

@interface GLAlertTool : NSObject

+ (instancetype)shareInstance;

#pragma mark - MBProgressHUD封装
/**  显示文字  */
+ (void)showText:(NSString *)text;
+ (void)showText:(NSString *)text afterDelay:(NSTimeInterval)delay;
+ (void)showText:(NSString *)text toView:(UIView *)toView;
+ (void)showText:(NSString *)text toView:(UIView *)toView bgColor:(UIColor *)bgColor;
+ (void)showText:(NSString *)text toView:(UIView *)toView bgColor:(UIColor *)bgColor afterDelay:(NSTimeInterval)delay;

/**  显示成功  */
+ (void)showSuccess:(NSString *)success;
+ (void)showSuccess:(NSString *)success afterDelay:(NSTimeInterval)delay;
+ (void)showSuccess:(NSString *)success toView:(UIView *)toView;
+ (void)showSuccess:(NSString *)success toView:(UIView *)toView afterDelay:(NSTimeInterval)delay;

/**  显示失败  */
+ (void)showError:(NSString *)error;
+ (void)showError:(NSString *)error afterDelay:(NSTimeInterval)delay;
+ (void)showError:(NSString *)error toView:(UIView *)toView;
+ (void)showError:(NSString *)error toView:(UIView *)toView afterDelay:(NSTimeInterval)delay;

/**  显示提示  */
+ (void)showTips:(NSString *)tips;
+ (void)showTips:(NSString *)tips afterDelay:(NSTimeInterval)delay;
+ (void)showTips:(NSString *)tips toView:(UIView *)toView;
+ (void)showTips:(NSString *)tips toView:(UIView *)toView afterDelay:(NSTimeInterval)delay;

/**  自定义图片  */
+ (void)showCustom:(NSString *)custom imageName:(NSString *)imageName;
+ (void)showCustom:(NSString *)custom imageName:(NSString *)imageName afterDelay:(NSTimeInterval)delay;
+ (void)showCustom:(NSString *)custom toView:(UIView *)toView imageName:(NSString *)imageName afterDelay:(NSTimeInterval)delay;

/**  显示加载中  */
+ (void)showMessage:(NSString *)message;
+ (void)showMessage:(NSString *)message toView:(UIView *)toView;

+ (void)showNoClickMessage:(NSString *)message;
+ (void)showNoClickMessage:(NSString *)message toView:(UIView *)toView;

/**  隐藏加载中  */
+ (void)hideMessage;


#pragma mark - UIAlertController封装
/**  Sheet 提示  */
+ (void)showActionSheetFromController:(UIViewController *)fromController title:(NSString *)title message:(NSString *)message completion:(void(^)(NSInteger index, UIAlertAction *action, UIAlertController *alertControler))completion buttonModels:(NSArray *)buttonModels;

/**  Alery 提示  */
+ (void)showAlertFromController:(UIViewController *)fromController title:(NSString *)title message:(NSString *)message completion:(void(^)(NSInteger index, UIAlertAction *action, UIAlertController *alertControler))completion buttonModels:(NSArray *)buttonModels;

+ (void)showAlertFromController:(UIViewController *)fromController title:(NSString *)title message:(NSString *)message completion:(void(^)(NSInteger index, UIAlertAction *action, UIAlertController *alertControler))completion buttonTitleStringModels:(NSArray <NSString*> *)buttonTitleStringModels;

/**  单个按钮提示  */
+ (void)showAlertRadioButtonFromController:(UIViewController *)fromController title:(NSString *)title message:(NSString *)message completion:(void(^)(NSInteger index, UIAlertAction *action, UIAlertController *alertControler))completion;

/**  二个按钮提示  */
+ (void)showAlertTwoButtonFromController:(UIViewController *)fromController title:(NSString *)title message:(NSString *)message completion:(void(^)(NSInteger index, UIAlertAction *action, UIAlertController *alertControler))completion;


@end
