//
//  ViewController.m
//  ObservedKeyboardDemo
//
//  Created by Shaolie on 15/7/1.
//  Copyright (c) 2015年 LinShaoLie. All rights reserved.
//

#import "ViewController.h"
#import "SLInputAccessoryView.h"

#define SCREEN_WIDTH    ([UIScreen mainScreen].bounds.size.width)       //屏幕宽度
#define SCREEN_HEIGHT   ([UIScreen mainScreen].bounds.size.height)      //屏幕高度

const CGFloat AccessoryViewHeight = 48;
@interface ViewController ()
@property(nonatomic, strong)SLInputAccessoryView *accessoryView;
@end

@implementation ViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.accessoryView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - setter and getter
- (SLInputAccessoryView *)accessoryView {
    if (_accessoryView == nil) {
        CGRect frame = CGRectMake(0, SCREEN_HEIGHT-AccessoryViewHeight, SCREEN_WIDTH, AccessoryViewHeight);
//        _accessoryView = [SLInputAccessoryView inputAccessoryViewWithFrame:frame leftImage:[UIImage imageNamed:@"btn_close"] centerImage:[UIImage imageNamed:@"btn_send"] rightImage:[UIImage imageNamed:@"btn_back"] isObserverKeyboardAppearance:YES];
        _accessoryView = [SLInputAccessoryView inputAccessoryViewWithFrame:frame leftTitle:@"L" centerTitle:@"C" rightTitle:@"R" isObserverKeyboardAppearance:YES];
        
        __weak typeof(self) weakSelf = self;
        _accessoryView.touchLeftButton = ^(UIButton *btn){
            NSLog(@"点击左边按钮");
        };
        
        _accessoryView.touchCenterButton = ^(UIButton *btn) {
            NSLog(@"点击中间按钮");
        };
        
        _accessoryView.touchRightButton = ^(UIButton *btn){
            [weakSelf.textField resignFirstResponder];
        };
    }
    return _accessoryView;
}

@end
