//
//  SimpleChart.h
//  SampleHeartRateApp
//
//  Created by Chris Greening on 25/11/2010.
//  Copyright 2010 CMG Research. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SimpleChart : UIView {
	NSMutableArray *points;
}

@property (nonatomic, retain) NSMutableArray *points;

-(void) addPoint:(NSNumber *) newPoint;

@end
