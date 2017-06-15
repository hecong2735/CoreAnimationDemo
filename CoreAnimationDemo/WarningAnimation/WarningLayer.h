//
//  WarningLayer.h
//  CoreAnimationDemo
//
//  Created by 何聪 on 2017/6/12.
//  Copyright © 2017年 何聪. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface WarningLayer : CALayer

@property (nonatomic) CGPoint center;
@property (nonatomic) CGFloat radius;

- (instancetype)initWithCenter:(CGPoint)center
                        radius:(CGFloat)radius;

@end
