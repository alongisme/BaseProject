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
+ (ALCustomBarButtonItem *)CreateBarButtonItemWithImageName:(NSString *)imageName hlImageName:(NSString *)hlImageName barButtonAction:(BarButtonItemClickAction)barButtonAction;

+ (ALCustomBarButtonItem *)CreateBarButtonItemWithImageName:(NSString *)imageName hlImageName:(NSString *)hlImageName Frame:(CGRect)frame barButtonAction:(BarButtonItemClickAction)barButtonAction;

@end
