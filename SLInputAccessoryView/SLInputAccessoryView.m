//
//  SLInputAccessoryView.m
//  Seeds
//
//  Created by Shaolie on 15/7/1.
//  Copyright (c) 2015年 Amanda. All rights reserved.
//

#import "SLInputAccessoryView.h"

@interface SLInputAccessoryView ()

@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *centerButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;

@property (assign, nonatomic) BOOL isObserverKeyboardAppearance;

@end

@implementation SLInputAccessoryView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)dealloc {
    if (self.isObserverKeyboardAppearance) {
        [[NSNotificationCenter defaultCenter] removeObserver:self];
    }
}

+ (instancetype)inputAccessoryViewWithFrame:(CGRect)frame leftImage:(UIImage *)leftImage centerImage:(UIImage *)centerImage rightImage:(UIImage *)rightImage isObserverKeyboardAppearance:(BOOL)isObserverKeyboardAppearance{
    SLInputAccessoryView *inputAV = [[[NSBundle mainBundle] loadNibNamed:@"SLInputAccessoryView" owner:nil options:nil] firstObject];
    inputAV.frame = frame;
    
    if (leftImage) {
        [inputAV.leftButton setImage:leftImage forState:(UIControlStateNormal)];
        [inputAV.leftButton addTarget:inputAV action:@selector(touchLeftButton:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    
    if (centerImage) {
        [inputAV.centerButton setImage:centerImage forState:(UIControlStateNormal)];
        [inputAV.centerButton addTarget:inputAV action:@selector(touchCenterButton:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    
    if (rightImage) {
        [inputAV.rightButton setImage:rightImage forState:(UIControlStateNormal)];
        [inputAV.rightButton addTarget:inputAV action:@selector(touchRightButton:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    
    inputAV.isObserverKeyboardAppearance = isObserverKeyboardAppearance;
    
    return inputAV;
}

+ (instancetype)inputAccessoryViewWithFrame:(CGRect)frame leftTitle:(NSString *)leftTitle centerTitle:(NSString *)centerTitle rightTitle:(NSString *)rightTitle isObserverKeyboardAppearance:(BOOL)isObserverKeyboardAppearance {
    SLInputAccessoryView *inputAV = [[[NSBundle mainBundle] loadNibNamed:@"SLInputAccessoryView" owner:nil options:nil] firstObject];
    inputAV.frame = frame;
    
    if (leftTitle) {
        [inputAV.leftButton setTitle:leftTitle forState:(UIControlStateNormal)];
        [inputAV.leftButton addTarget:inputAV action:@selector(touchLeftButton:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    
    if (centerTitle) {
        [inputAV.centerButton setTitle:centerTitle forState:(UIControlStateNormal)];
        [inputAV.centerButton addTarget:inputAV action:@selector(touchCenterButton:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    
    if (rightTitle) {
        [inputAV.rightButton setTitle:rightTitle forState:(UIControlStateNormal)];
        [inputAV.rightButton addTarget:inputAV action:@selector(touchRightButton:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    inputAV.isObserverKeyboardAppearance = isObserverKeyboardAppearance;
    return inputAV;
}

#pragma mark - setter and getter 
- (void)setIsObserverKeyboardAppearance:(BOOL)isObserverKeyboardAppearance {
    if (isObserverKeyboardAppearance) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    }
    _isObserverKeyboardAppearance = isObserverKeyboardAppearance;
}

#pragma mark - Observer
- (void)keyboardWillChangeFrame:(NSNotification *)notification
{
    NSDictionary *info = [notification userInfo];
    CGFloat duration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
//    CGRect beginKeyboardRect = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGRect endKeyboardRect = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    CGRect frame = self.frame;
    frame.origin.y = endKeyboardRect.origin.y-CGRectGetHeight(self.frame);
    [UIView animateWithDuration:duration animations:^{
        [self setFrame:frame];
    }];
}

#pragma mark - touch event
- (void)touchLeftButton:(UIButton *)button {
    if (_touchLeftButton) {
        _touchLeftButton(button);
    }
}

- (void)touchCenterButton:(UIButton *)button {
    if (_touchCenterButton) {
        _touchCenterButton(button);
    }
}

- (void)touchRightButton:(UIButton *)button {
    if (_touchRightButton) {
        _touchRightButton(button);
    }
}

@end
