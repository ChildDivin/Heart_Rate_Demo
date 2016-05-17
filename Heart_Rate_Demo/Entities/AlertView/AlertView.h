//
//  AlertView.h
//  AFNetworkingDemo
//
//  Created by TopsTech on 08/01/2015.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^clickOnAlertButton) (NSInteger buttonIndex);

@interface AlertView : NSObject

+ (AlertView *)sharedAlertView;

- (void)showAlertWithOKButton :(NSString *)strMessage;

- (void)showAlertWithoutButton :(NSString *)strMessage hideAfterDelay :(NSTimeInterval)delayTime;

- (void)showAlertWithTitle :(NSString *)strMessage cancelButton :(NSString *)cancel otherButtons :(NSArray *)arrButtons clickedButton :(clickOnAlertButton)index;

@end
