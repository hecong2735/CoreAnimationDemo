//
//  DrawViewController.m
//  CoreAnimationDemo
//
//  Created by 何聪 on 2017/6/15.
//  Copyright © 2017年 何聪. All rights reserved.
//

#import "DrawViewController.h"
#import "DrawView.h"

@interface DrawViewController ()

@end

@implementation DrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DrawView *view = [[DrawView alloc] initWithFrame:CGRectMake(0.0, 105.0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 105.0)];
    [self.view addSubview:view];
}

- (IBAction)exit:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
