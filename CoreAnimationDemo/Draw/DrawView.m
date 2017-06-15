//
//  DrawView.m
//  CoreAnimationDemo
//
//  Created by 何聪 on 2017/6/15.
//  Copyright © 2017年 何聪. All rights reserved.
//

#import "DrawView.h"

@interface DrawView ()

@property (nonatomic, strong) UIBezierPath *path;

@end

@implementation DrawView

+ (Class)layerClass {
    return [CAShapeLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        _path = [UIBezierPath bezierPath];
        CAShapeLayer *shapeLayer = (CAShapeLayer *)self.layer;
        shapeLayer.lineJoin = kCALineJoinRound;
        shapeLayer.fillColor = nil;
        shapeLayer.strokeColor = [UIColor blueColor].CGColor;
        shapeLayer.lineWidth = 4.0;
        shapeLayer.lineCap = kCALineCapRound;
    }
    
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView:self];
    [_path moveToPoint:point];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView:self];
    [_path addLineToPoint:point];
    
    ((CAShapeLayer *)self.layer).path = _path.CGPath;
}

@end
