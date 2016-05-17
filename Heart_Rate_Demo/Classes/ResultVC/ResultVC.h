//
//  ResultVC.h
//  Heart_Rate_Demo
//
//  Created by TopsTech on 29/04/2015.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultVC : UIViewController {
    IBOutlet UILabel *lblHeartRate;
    IBOutlet UILabel *lblStatus;
    
    IBOutlet UIImageView *imgSmily;
}

-(IBAction)btnBackClick:(id)sender;

@end
