//
//  FSAppDelegate.h
//  TestBeacon
//
//  Created by Forrest Shi on 5/9/14.
//  Copyright (c) 2014 Request. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../Beacon/Beacon/Beacon.h"

@interface FSAppDelegate : UIResponder <UIApplicationDelegate,BeaconNotificationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) Beacon *beacon;

@end
