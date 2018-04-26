/*********************************************************************
 *
 * 文件名称： GLAlertButtonModel.m
 * 项目名称： GLAlertToolDemo
 * 作   者： Gavin Li
 * Blog  ： https://www.dhlee.cn
 * GitHub： https://github.com/Gavin-ldh
 * Copyright © 2018年 Gavin Lee. All rights reserved.
 *
 *
 * 修改记录1：// 修改历史记录，包括修改日期、修改者及修改内容
 *    修改日期：
 *    版 本 号：
 *    修 改 人：
 *    修改内容：//修改原因以及修改内容说明
 * 修改记录2：…
 *
 **********************************************************************/


#import <NSString+GLLanguage.h>
#import "GLAlertButtonModel.h"

@implementation GLAlertButtonModel

+ (GLAlertButtonModel *)alertButtonModelWithTitle:(NSString *)title  style:(UIAlertActionStyle)style imageString:(NSString *)imageString color:(UIColor *)color {
    
    GLAlertButtonModel *model = [[self alloc] init];
    model.style = style;
    model.imageString = imageString;
    if (model.imageString.length > 0) {
        model.title = [NSString stringWithFormat:@"    %@", [title customLocalizedString]];
    }else{
        model.title = [title customLocalizedString];
    }
    model.color = color;
    return model;
}


@end
