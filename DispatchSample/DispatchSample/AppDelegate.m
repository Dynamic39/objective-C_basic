//
//  AppDelegate.m
//  DispatchSample
//
//  Created by Samuel K on 2018. 5. 9..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  NSLog(@"will finish launching");
  
  return YES;
  
  
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  NSLog(@"did finish launching");
  
  return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
  
  
  NSLog(@"will resign active");
  
  
  
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
  
  NSLog(@"did enter background");
  
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
  
  NSLog(@"will enter foreground");
  // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
  
  NSLog(@"did become avtive");
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
  
  NSLog(@"will terminate");
  //해당 기능은 종료될때인데, 실행에 보장이 없음....?
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
  
  NSLog(@"did receive memory warnnig!");
  
}


@end
