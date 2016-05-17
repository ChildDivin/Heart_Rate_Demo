//
//  HomeVC.h
//  Heart_Rate_Demo
//
//  Created by TopsTech on 29/04/2015.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetectVC.h"

@interface HomeVC : UIViewController {
    DetectVC *DetectVCObj;
    
    IBOutlet UIButton *btnMale;
    IBOutlet UIButton *btnFeMale;
    IBOutlet UIButton *btnSelectAge;
    
    IBOutlet UITableView *tblAge;
    
    NSArray *arrAge;
    
    NSInteger intSelectedIndex;
}

-(IBAction)btnStartClick:(id)sender;
-(IBAction)btnGenderClick:(id)sender;
-(IBAction)btnSelectAgeClick:(id)sender;

@end
