//
//  CALayer+Swizzling.m
//  CoreAnimationDemo
//
//  Created by 何聪 on 2017/6/16.
//  Copyright © 2017年 何聪. All rights reserved.
//

#import "CALayer+Swizzling.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>

@implementation CALayer (Swizzling)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originSEL = @selector(setBorderColor:);
        Method originMethod = class_getInstanceMethod([self class], originSEL);
        SEL destSEL = @selector(setBorderColorFromUIColor:);
        Method destMethod = class_getInstanceMethod([self class], destSEL);
        BOOL addSuccess = class_addMethod([self class], originSEL, method_getImplementation(destMethod), method_getTypeEncoding(destMethod));
        if (addSuccess) {
            class_replaceMethod([self class], destSEL, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
        }
        method_exchangeImplementations(originMethod, destMethod);
    });
}

- (void)setBorderColorFromUIColor:(UIColor *)color {
    [self setBorderColorFromUIColor:color.CGColor];
}

@end
