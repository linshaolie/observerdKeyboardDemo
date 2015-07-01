//
//  SLInputAccessoryView.h
//  Seeds
//
//  Created by Shaolie on 15/7/1.
//  Copyright (c) 2015年 Amanda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLInputAccessoryView : UIView

+ (instancetype)inputAccessoryViewWithFrame:(CGRect)frame leftImage:(UIImage *)leftImage centerImage:(UIImage *)centerImage rightImage:(UIImage *)rightImage isObserverKeyboardAppearance:(BOOL)isObserverKeyboardAppearance;

+ (instancetype)inputAccessoryViewWithFrame:(CGRect)frame leftTitle:(NSString *)leftTitle centerTitle:(NSString *)centerTitle rightTitle:(NSString *)rightTitle isObserverKeyboardAppearance:(BOOL)isObserverKeyboardAppearance;


@property(nonatomic, copy) void(^touchLeftButton)(UIButton *button);
@property(nonatomic, copy) void(^touchCenterButton)(UIButton *button);
@property(nonatomic, copy) void(^touchRightButton)(UIButton *button);
@end
