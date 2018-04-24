/*********************************************************************
 *
 * 文件名称： GLAlertButtonModel.h
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


#import <UIKit/UIKit.h>

#define kB_MODEL(TITLE, STYLE, IMAGENAME, COLOR) [GLAlertButtonModel alertButtonModelWithTitle:TITLE style:STYLE imageString:IMAGENAME color:COLOR]

@interface GLAlertButtonModel : NSObject

@property (nonatomic, strong) NSString *title;

@property (nonatomic, assign) UIAlertActionStyle style;

@property (nonatomic, strong) NSString *imageString;

@property (nonatomic, strong) UIColor *color;

+ (GLAlertButtonModel *)alertButtonModelWithTitle:(NSString *)title  style:(UIAlertActionStyle)style imageString:(NSString *)imageString color:(UIColor *)color;

@end
