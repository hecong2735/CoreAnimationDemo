//
//  WarningLayer.m
//  CoreAnimationDemo
//
//  Created by 何聪 on 2017/6/12.
//  Copyright © 2017年 何聪. All rights reserved.
//

#import "WarningLayer.h"

@interface WarningLayer ()<CAAnimationDelegate>

@property (nonatomic, strong) CALayer* exclamationLayer;
@property (nonatomic) CGFloat lineWidth;

@end

@implementation WarningLayer

- (instancetype)initWithCenter:(CGPoint)center
                        radius:(CGFloat)radius{
    self = [super init];
    _center = center;
    _radius = radius;
    _lineWidth = 5.0;
    [self addCircle];
    
    return self;
}

- (void)addCircle {
    CAShapeLayer *circleShapeLayer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPath];
    circleShapeLayer.position = _center;
    [path addArcWithCenter:CGPointMake(0.0, 0.0) radius:_radius startAngle:M_PI * 2 endAngle:0 clockwise:NO];
    circleShapeLayer.path = path.CGPath;
    circleShapeLayer.lineWidth = _lineWidth;
    circleShapeLayer.strokeColor = [UIColor blueColor].CGColor;
    circleShapeLayer.fillColor = nil;
    
    CABasicAnimation *strokeAniamtion = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeAniamtion.fromValue = @0.0;
    strokeAniamtion.toValue = @1.0;
    
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotateAnimation.fromValue = @(M_PI_2 * 3);
    rotateAnimation.toValue = @0.0;
    
    CAAnimationGroup *step1Animation = [CAAnimationGroup animation];
    step1Animation.animations = @[strokeAniamtion, rotateAnimation];
    step1Animation.duration = 0.8;
    [step1Animation setValue:@"step1" forKey:@"name"];
    step1Animation.delegate = self;
    [circleShapeLayer addAnimation:step1Animation forKey:nil];
    
    [self addSublayer:circleShapeLayer];
}

- (void)addPoint {
    CGFloat d = _radius / 2;
    CGPoint arcCenter = CGPointMake( - _radius - d, 0.0);
    CGFloat arcRadius = d + 2 * _radius;
    CGFloat origin = M_PI * 2;
    CGFloat dest =  M_PI * 2 - asin(_radius * 2 / arcRadius);
    CAShapeLayer *pointShaperLayer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:arcCenter radius:arcRadius startAngle:origin endAngle:dest clockwise:NO];
    pointShaperLayer.path = path.CGPath;
    pointShaperLayer.strokeColor = [UIColor blueColor].CGColor;
    pointShaperLayer.lineWidth = _lineWidth;
    pointShaperLayer.fillColor = nil;
    pointShaperLayer.position = _center;
    pointShaperLayer.strokeEnd = 0.0;
    
    CABasicAnimation *startStrokeAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    startStrokeAnimation.fromValue = @0.0;
    startStrokeAnimation.toValue = @0.9;
    
    CABasicAnimation *endStrokeAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    endStrokeAnimation.fromValue = @0.1;
    endStrokeAnimation.toValue = @1.0;
    
    CAAnimationGroup *step2Animation = [CAAnimationGroup animation];
    step2Animation.animations = @[startStrokeAnimation, endStrokeAnimation];
    step2Animation.duration = 0.3;
    step2Animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [step2Animation setValue:@"step2" forKey:@"name"];
    step2Animation.delegate = self;
    [pointShaperLayer addAnimation:step2Animation forKey:nil];
    
    [self addSublayer:pointShaperLayer];
}

- (void)addExclamation {
    _exclamationLayer = [CALayer layer];
    _exclamationLayer.position = _center;
    
    CAShapeLayer *topLineShapeLayer = [CAShapeLayer layer];
    UIBezierPath *topLinePath = [UIBezierPath bezierPath];
    [topLinePath moveToPoint:CGPointMake(0.0, - _radius)];
    [topLinePath addLineToPoint:CGPointMake(0.0, _radius / 4)];
    topLineShapeLayer.path = topLinePath.CGPath;
    topLineShapeLayer.lineWidth = _lineWidth;
    topLineShapeLayer.fillColor = nil;
    topLineShapeLayer.strokeColor = [UIColor redColor].CGColor;
    [_exclamationLayer addSublayer:topLineShapeLayer];
    
    CAShapeLayer *bottomLineShapeLayer = [CAShapeLayer layer];
    UIBezierPath *bottomLinePath = [UIBezierPath bezierPath];
    [bottomLinePath moveToPoint:CGPointMake(0.0, _radius * 11 / 12)];
    [bottomLinePath addLineToPoint:CGPointMake(0.0, _radius * 7 / 12)];
    bottomLineShapeLayer.path = bottomLinePath.CGPath;
    bottomLineShapeLayer.fillColor = nil;
    bottomLineShapeLayer.lineWidth = _lineWidth;
    bottomLineShapeLayer.strokeColor = [UIColor redColor].CGColor;
    [_exclamationLayer addSublayer:bottomLineShapeLayer];
    
    CABasicAnimation *startStrokeAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    startStrokeAnimation.fromValue = @0.0;
    startStrokeAnimation.toValue = @0.2;
    
    CABasicAnimation *endStrokeAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    endStrokeAnimation.fromValue = @0.0;
    endStrokeAnimation.toValue = @1.0;
    
    CAAnimationGroup *strokeAnimation = [CAAnimationGroup animation];
    strokeAnimation.animations = @[startStrokeAnimation, endStrokeAnimation];
    strokeAnimation.duration = 0.6;
    strokeAnimation.delegate = self;
    [strokeAnimation setValue:@"stroke" forKey:@"name"];
    strokeAnimation.removedOnCompletion = NO;
    strokeAnimation.fillMode = kCAFillModeBoth;
    [topLineShapeLayer addAnimation:strokeAnimation forKey:nil];
    [bottomLineShapeLayer addAnimation:strokeAnimation forKey:nil];
    
    [self addSublayer:_exclamationLayer];
}

- (void)shakeExclamation {
    CABasicAnimation *shakeAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    shakeAnimation.fromValue = @(M_PI * 0.04);
    shakeAnimation.toValue = @(-M_PI * 0.04);
    shakeAnimation.duration = 0.1;
    shakeAnimation.autoreverses = YES;
    shakeAnimation.repeatCount = 1.5;
    [_exclamationLayer addAnimation:shakeAnimation forKey:nil];

}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if ([[anim valueForKey:@"name"] isEqualToString:@"step1"]) {
        [self addPoint];
    }
    if ([[anim valueForKey:@"name"] isEqualToString:@"step2"]) {
        [self addExclamation];
    }
    if ([[anim valueForKey:@"name"] isEqualToString:@"stroke"]) {
        [self shakeExclamation];
    }
}
@end
