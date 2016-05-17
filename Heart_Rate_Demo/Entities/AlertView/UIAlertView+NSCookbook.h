//
//  UIAlertView+NSCookbook.h
//  AFNetworkingDemo
//
//  Created by TopsTech on 08/01/2015.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AlertCompletion)(UIAlertView *alertView, NSInteger buttonIndex);

@interface UIAlertView (NSCookbook)

- (void)showWithCompletion :(AlertCompletion)completion;

@end
