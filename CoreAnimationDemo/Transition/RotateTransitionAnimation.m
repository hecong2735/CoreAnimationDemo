//
//  RotateTransitionAnimation.m
//  CoreAnimationDemo
//
//  Created by 何聪 on 2017/6/19.
//  Copyright © 2017年 何聪. All rights reserved.
//

#import "RotateTransitionAnimation.h"
#import "ViewController.h"
#import "RotateTransitionViewController.h"

@interface RotateTransitionAnimation ()

@end

@implementation RotateTransitionAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    [transitionContext.containerView addSubview:fromView];
    
    CATransform3D pt = CATransform3DIdentity;
    pt.m34 = -1.0 / 500.0;
    CATransform3D ct = CATransform3DRotate(pt, - M_PI_2, 0.0, 10.0, 0.0);
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveLinear  animations:^{
        fromView.layer.transform = ct;
    } completion:^(BOOL finished) {
        if (finished) {
            UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
            [transitionContext.containerView addSubview:toView];
            CATransform3D toCt = CATransform3DRotate(pt, M_PI_2, 0.0, 1.0, 0.0);
            toView.layer.transform = toCt;
            [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
                toView.layer.transform = pt;
            } completion:^(BOOL finished) {
                if (finished) {
                    fromView.layer.transform = CATransform3DIdentity;
                    [transitionContext completeTransition:YES];
                }
            }];
        }
    }];
    
  }

@end
