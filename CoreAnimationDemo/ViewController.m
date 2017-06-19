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

@interface ViewController () <UIViewControllerTransitioningDelegate>

@property (strong, nonatomic) IBOutlet UIView *test;
@property (nonatomic, strong) CALayer *animationLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _animationLayer = [CALayer layer];
    [self.view.layer addSublayer:_animationLayer];
}


- (IBAction)showWarningLayer:(id)sender {
    _animationLayer.sublayers = nil;
    WarningLayer *warningLayer = [[WarningLayer alloc] initWithCenter:self.view.center radius:50];
    [_animationLayer addSublayer:warningLayer];
}
- (IBAction)showTransition:(id)sender {
    UIStoryboard *stroybooard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    MaskTransitionViewController *controller = [stroybooard instantiateViewControllerWithIdentifier:@"transition"];
    controller.transitioningDelegate = self;
    [self presentViewController:controller animated:YES completion:nil];

}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[MaskTransitionAnimation alloc] init];
}

@end
