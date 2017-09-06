//
//  UIButton+HMObjcSugar.h
//  HMObjcSugar
//
//  Created by 刘凡 on 16/3/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (HMObjcSugar)

/// 实例化 UIButton
///
/// @param title           title
/// @param fontSize        fontSize
/// @param textColor       textColor
///
/// @return UIButton
+ (nonnull instancetype)hm_buttonWithTitle:(nullable NSString *)title
                                  fontSize:(CGFloat)fontSize
                                 textColor:(nonnull UIColor *)textColor;

/// 实例化 UIButton
///
/// @param attributedText  attributedText
///
/// @return UIButton
+ (nonnull instancetype)hm_buttonWithAttributedText:(nullable NSAttributedString *)attributedText;

/// 实例化 UIButton
///
/// @param imageName       imageName
/// @param highlightSuffix highlightSuffix
///
/// @return UIButton
+ (nonnull instancetype)hm_buttonWithImageName:(nullable NSString *)imageName
                               highlightSuffix:(nullable NSString *)highlightSuffix;

/// 实例化 UIButton
///
/// @param imageName       imageName
/// @param backImageName   backImageName
/// @param highlightSuffix highlightSuffix
///
/// @return UIButton
+ (nonnull instancetype)hm_buttonWithImageName:(nullable NSString *)imageName
                                 backImageName:(nullable NSString *)backImageName
                               highlightSuffix:(nullable NSString *)highlightSuffix;

/// 实例化 UIButton
///
/// @param title           title
/// @param fontSize        fontSize
/// @param textColor       textColor
/// @param imageName       imageName
/// @param backImageName   backImageName
/// @param highlightSuffix highlightSuffix
///
/// @return UIButton
+ (nonnull instancetype)hm_buttonWithTitle:(nullable NSString *)title
                                  fontSize:(CGFloat)fontSize
                                 textColor:(nonnull UIColor *)textColor
                                 imageName:(nullable NSString *)imageName
                             backImageName:(nullable NSString *)backImageName
                           highlightSuffix:(nullable NSString *)highlightSuffix;

/// 实例化 UIButton
///
/// @param attributedText  attributedText
/// @param imageName       imageName
/// @param backImageName   backImageName
/// @param highlightSuffix highlightSuffix
///
/// @return UIButton
+ (nonnull instancetype)hm_buttonWithAttributedText:(nullable NSAttributedString *)attributedText
                                          imageName:(nullable NSString *)imageName
                                      backImageName:(nullable NSString *)backImageName
                                    highlightSuffix:(nullable NSString *)highlightSuffix;



/**
 实例化UIButton
 
 @param title 标题
 @param fontSize 字体大小
 @param normalColor 正常状态时Button颜色
 @param highlightedColor 高亮状态时Button颜色
 @return 实例化Button
 */
+ (instancetype _Nullable )hm_textButtonWithTitle:(NSString *_Nullable)title
                                         fontSize:(CGFloat)fontSize
                                      normalColor:(UIColor *_Nullable)normalColor
                                 highlightedColor:(UIColor *_Nullable)highlightedColor;

/**
 实例化UIButton
 
 @param title 标题
 @param fontSize 字体大小
 @param normalColor 正常状态时Button颜色
 @param highlightedColor 高亮状态时Button颜色
 @param backgroundImageName 背景图片
 @return 实例化Button
 */
+ (instancetype _Nullable )hm_textButtonWithTitle:(NSString *_Nullable)title
                                         fontSize:(CGFloat)fontSize
                                      normalColor:(UIColor *_Nullable)normalColor
                                 highlightedColor:(UIColor *_Nullable)highlightedColor
                              backgroundImageName:(NSString *_Nullable)backgroundImageName;

@end
