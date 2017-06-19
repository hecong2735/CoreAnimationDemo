//
//  TransitionAnimation.m
//  CoreAnimationDemo
//
//  Created by 何聪 on 2017/6/16.
//  Copyright © 2017年 何聪. All rights reserved.
//

#import "MaskTransitionAnimation.h"
#import "ViewController.h"
#import "MaskTransitionViewController.h"

@interface MaskTransitionAnimation ()<CAAnimationDelegate>

@property (nonatomic, strong) id<UIViewControllerContextTransitioning> transitionContext;

@end

@implementation MaskTransitionAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.7;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    _transitionContext = transitionContext;
    ViewController *fromVC = (ViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    MaskTransitionViewController *toVC = (MaskTransitionViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    [transitionContext.containerView addSubview:fromVC.view];
    [transitionContext.containerView addSubview:toVC.view];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:fromVC.transitionButton.frame];
    CGFloat radius = 1000;
    UIBezierPath *finalPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(fromVC.transitionButton.frame, -radius, -radius)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    toVC.view.layer.mask = shapeLayer;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.fromValue = (__bridge id _Nullable)(path.CGPath);
    animation.toValue = (__bridge id _Nullable)(finalPath.CGPath);
    animation.duration = [self transitionDuration:transitionContext];
    animation.delegate = self;
    [shapeLayer addAnimation:animation forKey:@"transition"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    [_transitionContext completeTransition:YES];
    [_transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view.layer.mask = nil;
}
@end
