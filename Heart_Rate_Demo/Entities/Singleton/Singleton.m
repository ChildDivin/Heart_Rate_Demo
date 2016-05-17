//
//  Singleton.m
//  InstagramApp
//
//  Created by Webinfoways on 15/02/13.
//  Copyright (c) 2013 WebPlanex. All rights reserved.
//

#import "Singleton.h"
#import "Global.h"
#import "AlertView.h"

@implementation Singleton

static Singleton *singletonObj = NULL;

#pragma mark -
#pragma mark Allocate
+ (Singleton *)sharedSingleton {
    @synchronized(self) {
        if (singletonObj == NULL)
            singletonObj = [[self alloc] init];
    }
    return(singletonObj);
}

-(BOOL) isHelthKitAvailable {
    if(NSClassFromString(@"HKHealthStore") && [HKHealthStore isHealthDataAvailable])
        return true;
    else
        return false;
}

-(NSString *)getRestingHeartRate :(NSMutableDictionary *)dict {
    NSString *strPlistPath = [[NSBundle mainBundle] pathForResource:@"Resting_Heart_Rate" ofType:@"plist"];
    NSDictionary *dictAllData = [[NSDictionary alloc] initWithContentsOfFile:strPlistPath];
    NSDictionary *dictGender = [dictAllData objectForKey:[dict valueForKey:g_Key_Gender]];
    NSDictionary *dictAge = [dictGender objectForKey:[dict valueForKey:g_Key_Age]];
    NSArray *arrBpmValue = [dictAge objectForKey:@"BPMValue"];
    
    for(int i=0; i<arrBpmValue.count; i++) {
        NSDictionary *dictBpmValue = [arrBpmValue objectAtIndex:i];
        if(([[dict valueForKey:g_Key_BPM] integerValue] >= [[dictBpmValue valueForKey:@"StartBPM"] integerValue]) && ([[dict valueForKey:g_Key_BPM] integerValue] <= [[dictBpmValue valueForKey:@"EndBPM"] integerValue])) {
            return [dictBpmValue valueForKey:@"Heart_Rate_Status"];
        }
    }
    
    return @"Normal";
}

-(NSMutableDictionary *) getDataFromHelthKit {
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    
    HKHealthStore *healthStore = [[HKHealthStore alloc] init];
    
    // Share body mass, height and body mass index
    NSSet *shareObjectTypes = [NSSet setWithObjects:
                               [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass],
                               [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeight],
                               [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMassIndex],
                               nil];
    
    // Read date of birth, biological sex and step count
    NSSet *readObjectTypes = [NSSet setWithObjects:
                              [HKObjectType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierDateOfBirth],
                              [HKObjectType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierBiologicalSex],
                              [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount],
                              nil];
    
    //    // Request access
    [healthStore requestAuthorizationToShareTypes:shareObjectTypes
                                        readTypes:readObjectTypes
                                       completion:^(BOOL success, NSError *error) {
                                           if(success == YES) {
                                               NSError *error;
                                               HKBiologicalSexObject *bioSex = [healthStore biologicalSexWithError:&error];
                                               
                                               switch (bioSex.biologicalSex) {
                                                   case HKBiologicalSexNotSet:
                                                       [dict setValue:@"" forKey:g_Key_Gender];
                                                       break;
                                                   case HKBiologicalSexFemale:
                                                       [dict setValue:@"Female" forKey:g_Key_Gender];
                                                       break;
                                                   case HKBiologicalSexMale:
                                                       [dict setValue:@"Male" forKey:g_Key_Gender];
                                                       break;
                                               }
                                           } else
                                               [[AlertView sharedAlertView] showAlertWithOKButton:error.localizedDescription];
                                       }];
    
    return dict;
}

-(void)setDictUserData :(NSDictionary *)dictData {
    dictUserData = [NSDictionary dictionaryWithDictionary:dictData];
}
-(NSDictionary *)getDictUserData {
    return dictUserData;
}

@end
