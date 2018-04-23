/*********************************************************************
 *
 * 文件名称： GLRootViewController.m
 * 项目名称： GLAlertToolDemo
 * 作   者： Gavin Li(博客：http://www.dhlee.cn)
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


#import "GLLanguageTool.h"
#import "GLAlertTool.h"
#import "GLRootViewController.h"

@interface GLRootViewController () <UITableViewDataSource>

#pragma mark - UI
@property (nonatomic, strong) IBOutlet UIButton *titleButton;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

#pragma mark - Data
@property (nonatomic, strong) NSArray *dataSource;

#pragma mark - Constraint


@end

@implementation GLRootViewController

#pragma mark - 生命周期方法
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self gl_init];
    
    NSArray *groupA = @[@"这是一个提示",
                        @"这是一个提示3秒后消失",
                        @"这是一个成功提示",
                        @"这是一个失败提示",
                        @"这是一个警示提示",
                        @"这是一个加载中提示",
                        @"这是一个加载中提示可以点击",
                        ];
    NSArray *groupB = @[@"单个按钮",
                        @"两个按钮",
                        @"输入框",
                        @"ActionSheet",
                        ];
    
    self.dataSource = @[groupA, groupB];
}

#pragma mark - Init
- (void)gl_init {
    

}

#pragma mark - Action
- (IBAction)hideButtonAction:(UIButton *)sender {
    [GLAlertTool hideMessage];
}

#pragma mark - Public Methods

#pragma mark - Private Methods

#pragma mark - Protocol
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource[section] count];;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *IDCell = @"GLTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:IDCell];
    cell.textLabel.text = self.dataSource[indexPath.section][indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    NSString *msg = self.dataSource[indexPath.section][indexPath.row];
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0: {
                [GLAlertTool showText:msg];
            }
                break;
            case 1: {
                [GLAlertTool showText:msg afterDelay:3.0];
            }
                break;
            case 2: {
                [GLAlertTool showSuccess:msg];
            }
                break;
            case 3: {
                [GLAlertTool showError:msg toView:self.view];
            }
                break;
            case 4: {
                [GLAlertTool showTips:msg];
            }
                break;
            case 5: {
                [GLAlertTool showMessage:msg toView:self.view];
            }
                break;
            case 6: {
                [GLAlertTool showNoClickMessage:msg];
            }
                break;
                
            default:
                break;
        }
    }else{
        switch (indexPath.row) {
            case 0: {
                [GLAlertTool showAlertRadioButtonFromController:self title:msg message:nil completion:^(NSInteger index, UIAlertAction *action, UIAlertController *alertControler) {
                    
                }];
                
            }
                break;
            case 1: {
                [GLAlertTool showAlertTwoButtonFromController:self title:msg message:nil completion:^(NSInteger index, UIAlertAction *action, UIAlertController *alertControler) {
                    
                }];
            }
                break;
            case 2: {
                
                NSArray *actions = @[kT_MODEL(@"账号"),
                                     kT_MODEL(@"密码"),
                                     kB_MODEL(@"取消", 0, nil, nil),
                                     kB_MODEL(@"确认", 0, nil, nil)];
                [GLAlertTool showAlertFromController:self title:msg message:nil completion:^(NSInteger index, UIAlertAction *action, UIAlertController *alertControler) {
                    
                } buttonModels:actions];
            }
                break;
            case 3: {
                NSArray *actions = @[kB_MODEL(@"BUTTON1", 0, nil, nil),
                                     kB_MODEL(@"BUTTON2", 2, nil, nil),
                                     kB_MODEL(@"取消", 1, nil, nil)];
                [GLAlertTool showActionSheetFromController:self title:msg message:nil completion:^(NSInteger index, UIAlertAction *action, UIAlertController *alertControler) {
                    
                } buttonModels:actions];
            }
                break;
            case 4: {
                
            }
                break;
                
            default:
                break;
        }
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"示例(Message)";
    }
    return @"示例(Alert)";
}


#pragma mark - Notice
- (void)dealloc {
    NSLog(@"%s", __FUNCTION__);
}

#pragma mark - Rewrite
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

#pragma mark - Lazy Loading


@end
