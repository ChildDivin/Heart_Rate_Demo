//
//  ResultVC.m
//  Heart_Rate_Demo
//
//  Created by TopsTech on 29/04/2015.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "ResultVC.h"
#import "Singleton.h"
#import "Global.h"

@implementation ResultVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:[[Singleton sharedSingleton] getDictUserData]];
    
    lblHeartRate.text = [NSString stringWithFormat:@"%@ BPM", [dict valueForKey:g_Key_BPM]];
    lblStatus.text = [[Singleton sharedSingleton] getRestingHeartRate:dict];
    imgSmily.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",lblStatus.text]];
}

-(IBAction)btnBackClick:(id)sender {
    [self.navigationController popViewControllerAnimated:true];
}

@end
