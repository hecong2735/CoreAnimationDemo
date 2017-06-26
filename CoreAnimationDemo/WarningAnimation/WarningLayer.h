//
//  WarningLayer.h
//  CoreAnimationDemo
//
//  Created by 何聪 on 2017/6/12.
//  Copyright © 2017年 何聪. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@protocol WarningLayerDelegate <NSObject>

@optional

- (CGPoint)setWarningLayerCenter;

- (CGFloat)setWarningLayerRadius;

- (CGColorRef)setWarningLayerCircleColor;

- (CGColorRef)setWarningLayerExclamationColor;

- (CGFloat)setWarningLayerLineWidth;

@end

@interface WarningLayer : CALayer

@end
