//
//  DetectVC.h
//  Heart_Rate_Demo
//
//  Created by TopsTech on 29/04/2015.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "PulseDetector.h"
#import "Filter.h"
#import "ResultVC.h"
#import "SimpleChart.h"

typedef NS_ENUM(NSUInteger, CURRENT_STATE) {
    STATE_PAUSED,
    STATE_SAMPLING
};

@class SimpleChart;

@interface DetectVC : UIViewController <AVCaptureVideoDataOutputSampleBufferDelegate> {

    ResultVC *ResultVCObj;
    
    NSTimer *timerUpdatePulse;
    
    int intSecond;
    int validFrameCounter;
    
    IBOutlet UILabel *lblBPMValue;
    IBOutlet UILabel *lblRemainingTime;
}
@property(nonatomic, strong) AVCaptureSession *session;
@property(nonatomic, strong) AVCaptureDevice *camera;
@property(nonatomic, strong) PulseDetector *pulseDetector;
@property(nonatomic, strong) Filter *filter;
@property(nonatomic, assign) CURRENT_STATE currentState;
@property (nonatomic, retain) IBOutlet SimpleChart *simpleChart;

-(IBAction)btnBackClick:(id)sender;

@end
