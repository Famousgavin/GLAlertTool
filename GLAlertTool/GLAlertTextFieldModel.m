/*********************************************************************
 *
 * 文件名称： GLAlertTextFieldModel.m
 * 项目名称： GLAlertToolDemo
 * 作   者： Gavin Li
 * Blog  ： http://www.dhlee.cn
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


#import "NSString+GLLanguage.h"
#import "GLAlertTextFieldModel.h"

@implementation GLAlertTextFieldModel

+ (GLAlertTextFieldModel *)alertTextFieldModelWithPlaceholder:(NSString *)placeholder {
    GLAlertTextFieldModel *model = [[GLAlertTextFieldModel alloc] init];
    model.placeholder = [placeholder customLocalizedString];
    return model;
}

@end
