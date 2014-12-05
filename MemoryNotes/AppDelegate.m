//
//  AppDelegate.m
//  SoftIndustry
//
//  Created by Gnrn on 16.11.14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTableViewController.h"

@implementation AppDelegate
@synthesize arr;

-(instancetype) initUniqueInstance {
    return [super init];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    SingletonDataSaver *saver = [SingletonDataSaver sharedInstance];
    arr = [saver saveArray];
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory =  [pathList  objectAtIndex:0];
    NSString *path = [NSString stringWithFormat:@"%@%@",documentsDirectory,@"NotesList.plist"];
    NSFileManager *m = [NSFileManager defaultManager];
    if ([m fileExistsAtPath:path]) {
        NSError *error;
        [m removeItemAtPath:path error:&error];
        [NSKeyedArchiver archiveRootObject:arr toFile:path];
    }else{
    [NSKeyedArchiver archiveRootObject:arr toFile:path];
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{}

- (void)applicationDidBecomeActive:(UIApplication *)application
{}

- (void)applicationWillTerminate:(UIApplication *)application
{}

@end
