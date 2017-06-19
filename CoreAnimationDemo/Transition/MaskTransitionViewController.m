//
//  TransitionViewController.m
//  CoreAnimationDemo
//
//  Created by 何聪 on 2017/6/16.
//  Copyright © 2017年 何聪. All rights reserved.
//

#import "MaskTransitionViewController.h"

@interface MaskTransitionViewController ()

@end

@implementation MaskTransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    
}


- (IBAction)exit:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
