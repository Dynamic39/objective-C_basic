//
//  AppDelegate.m
//  RealmTest
//
//  Created by Samuel K on 2018. 4. 19..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "AppDelegate.h"
#import <Realm.h>
#import "TableDB.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
// Realm Migration
    
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    config.schemaVersion = 1;
    
    config.migrationBlock = ^(RLMMigration * _Nonnull migration, uint64_t oldSchemaVersion) {
        
        if (oldSchemaVersion < 1) {
            
            [migration renamePropertyForClass:TableDB.className oldName:@"title" newName:@"titleName"];
            
        }
    };
    
    [RLMRealmConfiguration setDefaultConfiguration:config];
    
    [RLMRealm defaultRealm];
    
    
  
  return YES;
}

@end
