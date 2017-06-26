//
//  ViewController.m
//  CoreAnimationDemo
//
//  Created by 何聪 on 2017/6/11.
//  Copyright © 2017年 何聪. All rights reserved.
//

#import "ViewController.h"
#import "WarningLayer.h"
#import "MaskTransitionViewController.h"
#import "MaskTransitionAnimation.h"
#import "RotateTransitionAnimation.h"
#import "RotateTransitionViewController.h"

@interface ViewController () <UIViewControllerTransitioningDelegate>

@property (strong, nonatomic) IBOutlet UIView *test;
@property (nonatomic, strong) CALayer *animationLayer;
@property (nonatomic, strong) UIStoryboard *stroyboard;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _animationLayer = [CALayer layer];
    [self.view.layer addSublayer:_animationLayer];
    _stroyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
}

- (IBAction)showRotationTransition:(id)sender {
    RotateTransitionViewController *controller = [_stroyboard instantiateViewControllerWithIdentifier:@"rotate"];
    controller.transitioningDelegate = self;
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)showWarningLayer:(id)sender {
    _animationLayer.sublayers = nil;
    WarningLayer *warningLayer = [[WarningLayer alloc] init];
    [_animationLayer addSublayer:warningLayer];
}
- (IBAction)showTransition:(id)sender {
    MaskTransitionViewController *controller = [_stroyboard instantiateViewControllerWithIdentifier:@"transition"];
    controller.transitioningDelegate = self;
    [self presentViewController:controller animated:YES completion:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    if ([presented isKindOfClass:[MaskTransitionViewController class]]) {
        return [[MaskTransitionAnimation alloc] init];
    }
    if ([presented isKindOfClass:[RotateTransitionViewController class]]) {
        return [[RotateTransitionAnimation alloc] init];
    }
    return  nil;
}

@end
