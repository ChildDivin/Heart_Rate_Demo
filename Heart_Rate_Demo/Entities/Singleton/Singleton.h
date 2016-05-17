//
//  Singleton.h
//  InstagramApp
//
//  Created by Webinfoways on 15/02/13.
//  Copyright (c) 2013 WebPlanex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <HealthKit/HealthKit.h>

@interface Singleton : NSObject {
    NSDictionary *dictUserData;
}

+ (Singleton *)sharedSingleton;

-(BOOL) isHelthKitAvailable;
-(NSMutableDictionary *) getDataFromHelthKit;

-(void)setDictUserData :(NSDictionary *)dictData;
-(NSDictionary *)getDictUserData;

-(NSString *)getRestingHeartRate :(NSMutableDictionary *)dict;

@end
