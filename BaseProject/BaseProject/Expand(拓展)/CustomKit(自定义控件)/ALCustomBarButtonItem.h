//
//  ALCustomBarButtonItem.h
//  BaseProject
//
//  Created by admin on 16/8/4.
//  Copyright © 2016年 along. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BarButtonItemClickAction)(id button);

@interface ALCustomBarButtonItem : UIBarButtonItem
/**
 *  创建一个itembutton
 *
 *  @param imageName       图片名字
 *  @param hlImageName     图片高亮名字
 *  @param barButtonAction 按钮点击事件
 *
 *  @return buttonitem
 */
+ (ALCustomBarButtonItem *)CreateBarButtonItemWithImageName:(NSString *)imageName hlImageName:(NSString *)hlImageName barButtonAction:(BarButtonItemClickAction)barButtonAction;

/**
 *  创建一个itembutton 带frame
 *
 *  @param imageName       图片名字
 *  @param hlImageName     图片高亮名字
 *  @param frame           frame
 *  @param barButtonAction 按钮点击事件
 *
 *  @return buttonitem
 */
+ (ALCustomBarButtonItem *)CreateBarButtonItemWithImageName:(NSString *)imageName hlImageName:(NSString *)hlImageName Frame:(CGRect)frame barButtonAction:(BarButtonItemClickAction)barButtonAction;

/**
 *  创建一个itemButton 用button
 *
 *  @param button button
 *
 *  @return buttonitem
 */
+ (ALCustomBarButtonItem *)CreateBarButtonItemWithButton:(UIButton *)button;

@end
