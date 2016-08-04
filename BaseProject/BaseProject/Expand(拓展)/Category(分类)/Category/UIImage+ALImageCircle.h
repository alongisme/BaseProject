//
//  UIImage+ALImageCirALe.h
//  05-图片的裁剪和保存
//
//  Created by lin on 15/8/28.
//  Copyright (c) 2015年 itxdl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ALImageCircle)

 + (instancetype)circleImageWithOldImageName:(NSString *)oldImageName WithBorder:(CGFloat)borderW WithColor:(UIColor *) borderColer;

@end
