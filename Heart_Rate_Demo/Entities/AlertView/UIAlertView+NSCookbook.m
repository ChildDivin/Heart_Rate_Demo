//
//  UIAlertView+NSCookbook.m
//  AFNetworkingDemo
//
//  Created by TopsTech on 08/01/2015.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <objc/runtime.h>
#import "UIAlertView+NSCookbook.h"

@interface NSCBAlertWrapper : NSObject

@property (copy) void(^completionBlock)(UIAlertView *alertView, NSInteger buttonIndex);

@end

@implementation NSCBAlertWrapper

#pragma mark
#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (self.completionBlock)
        self.completionBlock(alertView, buttonIndex);
}

// Called when we cancel a view (eg. the user clicks the Home button). This is not called when the user clicks the cancel button.
// If not defined in the delegate, we simulate a click in the cancel button
- (void)alertViewCancel:(UIAlertView *)alertView {
    if (self.completionBlock)
        self.completionBlock(alertView, alertView.cancelButtonIndex);
}

@end

static const char kNSCBAlertWrapper;
@implementation UIAlertView (NSCookbook)

#pragma mark
#pragma mark - Class Public
- (void)showWithCompletion :(AlertCompletion)completion {
    NSCBAlertWrapper *alertWrapper = [[NSCBAlertWrapper alloc] init];
    alertWrapper.completionBlock = completion;
    self.delegate = alertWrapper;
    
    // Set the wrapper as an associated object
    objc_setAssociatedObject(self, &kNSCBAlertWrapper, alertWrapper, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self show];
}

@end
