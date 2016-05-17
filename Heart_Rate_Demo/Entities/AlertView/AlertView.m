//
//  AlertView.m
//  AFNetworkingDemo
//
//  Created by TopsTech on 08/01/2015.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "AlertView.h"
#import "UIAlertView+NSCookbook.h"
#import "Global.h"

@implementation AlertView

static AlertView *alertViewObj = NULL;

+ (AlertView *)sharedAlertView {
    @synchronized(self) {
        if(alertViewObj == NULL)
            alertViewObj = [[self alloc] init];
    }
    return alertViewObj;
}

- (void)showAlertWithOKButton :(NSString *)strMessage
{
    UIAlertView *alertObj = [[UIAlertView alloc] initWithTitle:g_AppName message:strMessage delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alertObj show];
}

- (void)showAlertWithoutButton :(NSString *)strMessage hideAfterDelay :(NSTimeInterval)delayTime {
    UIAlertView *alertObj = [[UIAlertView alloc] initWithTitle:g_AppName message:strMessage delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [alertObj show];
    
    [self performSelector:@selector(dismissAlertView:) withObject:alertObj afterDelay:delayTime];
}

-(void)dismissAlertView :(UIAlertView *) alertView {
    [alertView dismissWithClickedButtonIndex:0 animated:YES];
}

- (void)showAlertWithTitle :(NSString *)strMessage cancelButton :(NSString *)cancel otherButtons :(NSArray *)arrButtons clickedButton :(clickOnAlertButton)index {
    UIAlertView *alertObj = [[UIAlertView alloc] initWithTitle:g_AppName message:strMessage delegate:self cancelButtonTitle:cancel otherButtonTitles:nil];
    
    for(NSString *strTitle in arrButtons) {
        [alertObj addButtonWithTitle:strTitle];
    }
    
    [alertObj showWithCompletion:^(UIAlertView *alertView, NSInteger buttonIndex) {
        index(buttonIndex);
    }];
    
    [alertObj show];
}

@end
