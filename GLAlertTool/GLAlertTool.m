/*********************************************************************
 *
 * 文件名称： GLAlertTool.m
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
#import "GLAlertTool.h"
#import <MBProgressHUD/MBProgressHUD.h>

/**  带有RGBA的颜色设置  */
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

typedef NS_ENUM(NSInteger, GLMessageImage) {
    GLMessageImageTips,
    GLMessageImageError,
    GLMessageImageSuccess,
};

@interface GLAlertTool () <MBProgressHUDDelegate>

@property (nonatomic, strong) MBProgressHUD *HUD;

@property (nonatomic, strong) MBProgressHUD *showMessage;


@end

@implementation GLAlertTool


#pragma mark - Init
+ (instancetype)shareInstance {
    static GLAlertTool *tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[GLAlertTool alloc] init];
        
        UIActivityIndicatorView *indicatorView = [UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[[MBProgressHUD class]]];
        // 设置指示器颜色
        indicatorView.color = [UIColor whiteColor];
    });
    return tool;
}

#pragma mark - Public Methods
/**  显示文字  */
+ (void)showText:(NSString *)text {
    [GLAlertTool showText:text toView:nil bgColor:nil afterDelay:0];
}

+ (void)showText:(NSString *)text afterDelay:(NSTimeInterval)delay {
    [GLAlertTool showText:text toView:nil bgColor:nil afterDelay:delay];
}

+ (void)showText:(NSString *)text toView:(UIView *)toView {
    [GLAlertTool showText:text toView:toView bgColor:nil afterDelay:0];
}

+ (void)showText:(NSString *)text toView:(UIView *)toView bgColor:(UIColor *)bgColor {
    [GLAlertTool showText:text toView:toView bgColor:bgColor afterDelay:0];
}

+ (void)showText:(NSString *)text toView:(UIView *)toView bgColor:(UIColor *)bgColor afterDelay:(NSTimeInterval)delay {
    [[GLAlertTool shareInstance] showText:text toView:toView bgColor:bgColor afterDelay:delay];
}

/**  显示成功  */
+ (void)showSuccess:(NSString *)success {
    [GLAlertTool showSuccess:success toView:nil afterDelay:0];
}

+ (void)showSuccess:(NSString *)success afterDelay:(NSTimeInterval)delay {
    [GLAlertTool showSuccess:success toView:nil afterDelay:delay];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)toView {
    [GLAlertTool showSuccess:success toView:toView afterDelay:0];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)toView afterDelay:(NSTimeInterval)delay {
    NSString *imageName = [[GLAlertTool shareInstance] getMessageImageName:GLMessageImageSuccess];
    [[GLAlertTool shareInstance] showMessage:success toView:toView imageName:imageName afterDelay:delay];
}

/**  显示失败  */
+ (void)showError:(NSString *)error {
    [GLAlertTool showError:error toView:nil afterDelay:0];
}

+ (void)showError:(NSString *)error afterDelay:(NSTimeInterval)delay {
    [GLAlertTool showError:error toView:nil afterDelay:delay];
}

+ (void)showError:(NSString *)error toView:(UIView *)toView {
    [GLAlertTool showError:error toView:toView afterDelay:0];
}

+ (void)showError:(NSString *)error toView:(UIView *)toView afterDelay:(NSTimeInterval)delay {
    NSString *imageName = [[GLAlertTool shareInstance] getMessageImageName:GLMessageImageError];
    [[GLAlertTool shareInstance] showMessage:error toView:toView imageName:imageName afterDelay:delay];
}

/**  显示提示  */
+ (void)showTips:(NSString *)tips {
    [GLAlertTool showTips:tips toView:nil];
}

+ (void)showTips:(NSString *)tips afterDelay:(NSTimeInterval)delay {
    [GLAlertTool showTips:tips toView:nil afterDelay:delay];
}

+ (void)showTips:(NSString *)tips toView:(UIView *)toView {
    [GLAlertTool showTips:tips toView:toView afterDelay:0];
}

+ (void)showTips:(NSString *)tips toView:(UIView *)toView afterDelay:(NSTimeInterval)delay {
    NSString *imageName = [[GLAlertTool shareInstance] getMessageImageName:GLMessageImageTips];
    [[GLAlertTool shareInstance] showMessage:tips toView:toView imageName:imageName afterDelay:delay];
}

/**  自定义图片  */
+ (void)showCustom:(NSString *)custom imageName:(NSString *)imageName {
    [GLAlertTool showCustom:custom toView:nil imageName:imageName afterDelay:0];
}

+ (void)showCustom:(NSString *)custom imageName:(NSString *)imageName afterDelay:(NSTimeInterval)delay {
    [GLAlertTool showCustom:custom toView:nil imageName:imageName afterDelay:delay];
}

+ (void)showCustom:(NSString *)custom toView:(UIView *)toView imageName:(NSString *)imageName afterDelay:(NSTimeInterval)delay {
    [[GLAlertTool shareInstance] showMessage:custom toView:toView imageName:imageName afterDelay:delay];
}

/**  显示加载中  */
+ (void)showMessage:(NSString *)message {
    [GLAlertTool shareInstance].HUD = [self showLoadMessage:message toView:nil];
}

+ (void)showMessage:(NSString *)message toView:(UIView *)toView {
    [GLAlertTool shareInstance].HUD = [self showLoadMessage:message toView:toView];
}

+ (MBProgressHUD *)showLoadMessage:(NSString *)message toView:(UIView *)toView {
    [[GLAlertTool shareInstance] showLoadMessage:message toView:toView canClick:true];
    return [GLAlertTool shareInstance].showMessage;
}

+ (void)showNoClickMessage:(NSString *)message {
    [GLAlertTool shareInstance].HUD = [self showNoClickLoadMessage:message toView:nil];
}

+ (void)showNoClickMessage:(NSString *)message toView:(UIView *)toView {
    [GLAlertTool shareInstance].HUD = [self showNoClickLoadMessage:message toView:toView];
}

+ (MBProgressHUD *)showNoClickLoadMessage:(NSString *)message toView:(UIView *)toView {
    [[GLAlertTool shareInstance] showLoadMessage:message toView:toView canClick:false];
    
    return [GLAlertTool shareInstance].showMessage;
}

/**  隐藏加载中  */
+ (void)hideMessage {
    [[GLAlertTool shareInstance].HUD hideAnimated:true];
}


/**  Sheet 提示  */
+ (void)showActionSheetFromController:(UIViewController *)fromController title:(NSString *)title message:(NSString *)message completion:(void(^)(NSInteger index, UIAlertAction *action, UIAlertController *alertControler))completion buttonModels:(NSArray *)buttonModels {
    [GLAlertTool showAlertFromController:fromController preferredStyle:UIAlertControllerStyleActionSheet title:title message:message completion:completion buttonModels:buttonModels];
}

/**  Alery 提示  */
+ (void)showAlertFromController:(UIViewController *)fromController title:(NSString *)title message:(NSString *)message completion:(void(^)(NSInteger index, UIAlertAction *action, UIAlertController *alertControler))completion buttonModels:(NSArray *)buttonModels {
    
    [GLAlertTool showAlertFromController:fromController preferredStyle:UIAlertControllerStyleAlert title:title message:message completion:completion buttonModels:buttonModels];
}

+ (void)showAlertFromController:(UIViewController *)fromController title:(NSString *)title message:(NSString *)message completion:(void(^)(NSInteger index, UIAlertAction *action, UIAlertController *alertControler))completion buttonTitleStringModels:(NSArray <NSString*> *)buttonTitleStringModels {
    NSMutableArray *buttonModels = [NSMutableArray array];
    
    for (NSString *title in buttonTitleStringModels) {
        [buttonModels addObject:kB_MODEL(title, 0, nil, nil)];
    }
    [GLAlertTool showAlertFromController:fromController preferredStyle:UIAlertControllerStyleAlert title:title message:message completion:completion buttonModels:buttonModels];
}

/**  单个按钮提示  */
+ (void)showAlertRadioButtonFromController:(UIViewController *)fromController title:(NSString *)title message:(NSString *)message completion:(void(^)(NSInteger index, UIAlertAction *action, UIAlertController *alertControler))completion {
    [GLAlertTool showAlertFromController:fromController preferredStyle:UIAlertControllerStyleAlert title:title message:message completion:completion buttonModels:@[kB_MODEL([@"gl_alertPV_2" customLocalizedStringFromTable:@"GLAlertToolLocalizable"], 0, nil, nil)]];
}

/**  二个按钮提示  */
+ (void)showAlertTwoButtonFromController:(UIViewController *)fromController title:(NSString *)title message:(NSString *)message completion:(void(^)(NSInteger index, UIAlertAction *action, UIAlertController *alertControler))completion {
    NSArray *models = @[kB_MODEL([@"gl_alertPV_1" customLocalizedStringFromTable:@"GLAlertToolLocalizable"], 0, nil, nil),
                        kB_MODEL([@"gl_alertPV_2" customLocalizedStringFromTable:@"GLAlertToolLocalizable"], 0, nil, nil),];
    [GLAlertTool showAlertFromController:fromController preferredStyle:UIAlertControllerStyleAlert title:title message:message completion:completion buttonModels:models];
}

#pragma mark - Private Methods
/**  获取当前最顶层的window  */
- (UIWindow *)getTopLevelWindow {
    return [UIApplication sharedApplication].keyWindow;
}

- (NSString *)getMessageImageName:(GLMessageImage)type {
    NSString *imagePath = [NSString stringWithFormat:@"%@.bundle", NSStringFromClass([self class])];
    if (type == GLMessageImageError) {
        return [imagePath stringByAppendingPathComponent:@"error_white.png"];
    }else if (type == GLMessageImageSuccess) {
        return [imagePath stringByAppendingPathComponent:@"success_white.png"];
    }else if (type == GLMessageImageTips) {
        return [imagePath stringByAppendingPathComponent:@"info_white.png"];
    }
    return @"";
}

- (void)showText:(NSString *)text toView:(UIView *)toView bgColor:(UIColor *)bgColor afterDelay:(NSTimeInterval)delay {
    if (self.showMessage != nil) {
        [self.showMessage removeFromSuperview];
    }
    if (toView == nil) {
        toView = [self getTopLevelWindow];
    }
    
    // 创建指示器
    self.showMessage = [MBProgressHUD showHUDAddedTo:toView animated:true];
    self.showMessage.userInteractionEnabled = false;
    // 设置text模式
    self.showMessage.mode = MBProgressHUDModeText;
    // 隐藏时从父控件中移除
    self.showMessage.removeFromSuperViewOnHide = true;
    // 设置背景色
    self.showMessage.bezelView.color = bgColor != nil ? bgColor : [UIColor blackColor];
    self.showMessage.bezelView.layer.cornerRadius = 8.0;
    
    // 设置文字属性
    self.showMessage.label.text      = text;
    self.showMessage.label.font      = [UIFont systemFontOfSize:14.0];
    self.showMessage.label.textColor = [UIColor whiteColor];
    
    [self performSelectorOnMainThread:@selector(hideMessage:) withObject:delay==0?@(1.0):@(delay) waitUntilDone:true];
}

- (void)showMessage:(NSString *)message toView:(UIView *)toView imageName:(NSString *)imageName afterDelay:(NSTimeInterval)delay {
    if (self.showMessage != nil) {
        [self.showMessage removeFromSuperview];
    }
    if (toView == nil) {
        toView = [self getTopLevelWindow];
    }
    
    // 创建指示器
    self.showMessage = [MBProgressHUD showHUDAddedTo:toView animated:true];
    self.showMessage.userInteractionEnabled = false;
    // 设置为自定义模式
    self.showMessage.mode = MBProgressHUDModeCustomView;
    // 隐藏时从父控件中移除
    self.showMessage.removeFromSuperViewOnHide = true;
    // 设置将要显示的图片
    UIImage *image = [UIImage imageNamed:imageName];
    // 设置自定义视图
    self.showMessage.customView = [[UIImageView alloc] initWithImage:image];
    // 设置bezelView背景色
    self.showMessage.bezelView.color = [UIColor blackColor];
    self.showMessage.bezelView.layer.cornerRadius = 6.0;
    
    // 设置显示的文字内容
    self.showMessage.label.text = message;
    self.showMessage.label.font = [UIFont systemFontOfSize:14.0];
    self.showMessage.label.textColor = [UIColor whiteColor];
    
    [self performSelectorOnMainThread:@selector(hideMessage:) withObject:delay==0?@(1.0):@(delay) waitUntilDone:true];
}

- (void)showLoadMessage:(NSString *)message toView:(UIView *)toView canClick:(BOOL)canClick {
    if (self.showMessage != nil) {
      [self.showMessage removeFromSuperview];
    }
    if (toView == nil) {
       toView = [self getTopLevelWindow];
    }
    
    // 创建hud
    self.showMessage = [MBProgressHUD showHUDAddedTo:toView animated:true];
    self.showMessage.userInteractionEnabled = canClick;
    // 设置背景颜色和圆角
    self.showMessage.bezelView.color = [UIColor blackColor];
    self.showMessage.bezelView.layer.cornerRadius = 10.0;
    // 设置文字内容和颜色
    self.showMessage.label.text = message;
    self.showMessage.label.textColor = [UIColor whiteColor];
}

- (void)hideMessage:(NSNumber *)delay {
    [self.showMessage hideAnimated:true afterDelay:[delay floatValue]];
}

+ (void)showAlertFromController:(UIViewController *)fromController preferredStyle:(UIAlertControllerStyle)preferredStyle title:(NSString *)title message:(NSString *)message completion:(void(^)(NSInteger index, UIAlertAction *action, UIAlertController *alertControler))completion buttonModels:(NSArray *)buttonMdoels {
    
    NSString *titleString = [title customLocalizedString];
    NSString *messageString = [message customLocalizedString];
    
    UIAlertController *actionSheet = actionSheet = [UIAlertController alertControllerWithTitle:titleString.length > 0 ? titleString : nil message:messageString.length > 0 ? messageString : nil preferredStyle:preferredStyle];
    
    NSInteger index = 0;
    for (id tempModel in buttonMdoels) {
        if ([tempModel isKindOfClass:[GLAlertButtonModel class]]) {
            GLAlertButtonModel *model = (GLAlertButtonModel *)tempModel;
            UIAlertAction *action = [UIAlertAction actionWithTitle:model.title style:model.style handler:^(UIAlertAction *action) {
                if (completion) {
                    completion(index, action, actionSheet);
                }
            }];
            // 设置按钮的title颜色
            if (model.color != nil) {
                [action setValue:model.color forKey:@"titleTextColor"];
            }
            
            if (model.style == UIAlertActionStyleCancel) {

            }else if (model.style == UIAlertActionStyleDestructive) {
                
            }else{
                if (model.imageString.length > 0) {
                    // 设置按钮的title的对齐方式
                    [action setValue:[NSNumber numberWithInteger:NSTextAlignmentLeft] forKey:@"titleTextAlignment"];
                    
                    [action setValue:[[UIImage imageNamed:model.imageString] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forKey:@"image"];
                }
            }
            [actionSheet addAction:action];
        }else if ([tempModel isKindOfClass:[GLAlertTextFieldModel class]]) {
            GLAlertTextFieldModel *model = (GLAlertTextFieldModel *)tempModel;
            [actionSheet addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                textField.placeholder = model.placeholder;
                textField.clearButtonMode = UITextFieldViewModeWhileEditing;
                textField.tag = index;
                
            }];
        }
        index++;
    }
    [fromController presentViewController:actionSheet animated:true completion:nil];
}




@end
