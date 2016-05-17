

//  Set Application Name
#define g_AppName @"Heart Rate"

#define g_Key_Gender @"keyGender"
#define g_Key_Age @"keyAge"
#define g_Key_BPM @"keyBPM"

//  Set Font
#define g_FontHelveticaNeue(fontSize) [UIFont fontWithName:@"HelveticaNeue" size:fontSize]

//  Set Color
#define g_colorRGB(R, G, B)            [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1]
#define g_colorRGBA(R, G, B, A)        [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

//  Check Device Compatibility
#define g_IS_IPAD               ([[[UIDevice currentDevice] model] isEqualToString:@"iPad"])
#define g_IS_IPHONE             ([[[UIDevice currentDevice] model] isEqualToString:@"iPhone"])
#define g_IS_IPOD               ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])

#define g_IS_IPHONE_4_SCREEN    [[UIScreen mainScreen] bounds].size.height >= 480.0f && [[UIScreen mainScreen] bounds].size.height < 568.0f
#define g_IS_IPHONE_5_SCREEN    [[UIScreen mainScreen] bounds].size.height >= 568.0f && [[UIScreen mainScreen] bounds].size.height < 667.0f
#define g_IS_IPHONE_6_SCREEN    [[UIScreen mainScreen] bounds].size.height >= 667.0f && [[UIScreen mainScreen] bounds].size.height < 736.0f
#define g_IS_IPHONE_6Plus_SCREEN    [[UIScreen mainScreen] bounds].size.height >= 736.0f && [[UIScreen mainScreen] bounds].size.height < 1024.0f

//  Check Version Compatibility
#define g_IS_IOS_6 ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0)
#define g_IS_IOS_7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define g_IS_IOS_8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)