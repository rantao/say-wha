// Copyright 2011 Ping Labs, Inc. All rights reserved.

#import "Parse/Parse.h"
#import "ParseStarterProjectAppDelegate.h"
#import "ParseStarterProjectViewController.h"

@implementation ParseStarterProjectAppDelegate


@synthesize window=_window;

@synthesize viewController=_viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // ****************************************************************************
    // Uncomment and fill in with your Parse credentials:
     [Parse setApplicationId:@"9E18AtcEtt3jNRNLDFFyI9YFJdxAjFJn7GHfgUbn" clientKey:@"VKlSy8MbcAWJxosemOMfo8N943KVHUyKfDrmWLja"];
    //
    // If you are using Facebook, uncomment and fill in with your Facebook App Id:
    // [PFFacebookUtils initializeWithApplicationId:@"your_facebook_app_id"];
    // ****************************************************************************
    
    [PFUser enableAutomaticUser];
    PFACL *defaultACL = [PFACL ACL];
    // Optionally enable public read access by default.
    // [defaultACL setPublicReadAccess:YES];
    [PFACL setDefaultACL:defaultACL withAccessForCurrentUser:YES];
    
    // Override point for customization after application launch.
     
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge|
                                                    UIRemoteNotificationTypeAlert|
                                                    UIRemoteNotificationTypeSound];
    return YES;
}

/*
 
///////////////////////////////////////////////////////////
// Uncomment these two methods if you are using Facebook
///////////////////////////////////////////////////////////
 
// Pre 4.2 support
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [PFFacebookUtils handleOpenURL:url];
}
 
// For 4.2+ support
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
    sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [PFFacebookUtils handleOpenURL:url];
} 
 
*/

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)newDeviceToken
{
    [PFPush storeDeviceToken:newDeviceToken];
    [PFPush subscribeToChannelInBackground:@"" target:self selector:@selector(subscribeFinished:error:)];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
	NSLog(@"application:didFailToRegisterForRemoteNotificationsWithError: %@", error);
	if ([error code] != 3010) // 3010 is for the iPhone Simulator
    {
        // show some alert or otherwise handle the failure to register.
	}
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [PFPush handlePush:userInfo];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)subscribeFinished:(NSNumber *)result error:(NSError *)error {
    if ([result boolValue]) {
        NSLog(@"ParseStarterProject successfully subscribed to push notifications on the broadcast channel.");
    } else {
        NSLog(@"ParseStarterProject failed to subscribe to push notifications on the broadcast channel.");
    }
}


@end
