//
//  FSAppDelegate.m
//  TestBeacon
//
//  Created by Forrest Shi on 5/9/14.
//  Copyright (c) 2014 Request. All rights reserved.
//

#import "FSAppDelegate.h"



@implementation FSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    
    self.beacon = [Beacon new];
    self.beacon.delegate = self;
    [self.beacon startMonitorBeacon:kUUID_Estimote major:1000 minor:2000];

    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)NotifyWhenEntryBeacon:(CLBeaconRegion *)beaconRegion{
    
    
    NSString *tip = @"Welcome to Garage Society !";

    if ([beaconRegion.minor integerValue] == 2000) {
        
        tip = @"Today's Event : BaseCamp Workshop ";
    }else if ([beaconRegion.minor integerValue] == 2001) {
        
        tip = @"Happy Hour Today ";
    }

    
    [self sendLocalNotificationWithMessage:tip];
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Entry" object:nil];
    
    NSLog(@"detect beacon %@", beaconRegion);
    
}
- (void)NotifyWhenExitBeacon:(CLBeaconRegion *)beaconRegion{
    NSString *tip = @"Goodbye, See you next time!";
    
    if ([beaconRegion.minor integerValue] == 2000) {
        
        tip = @"Today's Event : BaseCamp Workshop ";
    }else if ([beaconRegion.minor integerValue] == 2001) {
        
        tip = @"Don't Forget Happy Hour Today :) ";
    }


    [self sendLocalNotificationWithMessage:tip];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Exit" object:nil];
    
        NSLog(@"detect beacon %@", beaconRegion);
}


#pragma mark - Local notifications
- (void)sendLocalNotificationWithMessage:(NSString*)message
{
    UILocalNotification *notification = [UILocalNotification new];
    
    // Notification details
    notification.alertBody = message;
    // notification.alertBody = [NSString stringWithFormat:@"Entered beacon region for UUID: %@",
    //                         region.proximityUUID.UUIDString];   // Major and minor are not available at the monitoring stage
    notification.alertAction = NSLocalizedString(@"View Details", nil);
    notification.soundName = UILocalNotificationDefaultSoundName;
    
    [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
}



@end
