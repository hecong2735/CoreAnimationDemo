//
//  RotateTransitionViewController.m
//  CoreAnimationDemo
//
//  Created by 何聪 on 2017/6/19.
//  Copyright © 2017年 何聪. All rights reserved.
//

#import "RotateTransitionViewController.h"

@interface RotateTransitionViewController ()

@end

@implementation RotateTransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
}

- (IBAction)exit:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
