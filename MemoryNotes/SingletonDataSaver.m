//
//  SingletonDataSaver.m
//  SoftIndustry
//
//  Created by Gnrn on 17.11.14.
//  Copyright (c) 2014 Gnrn. All rights reserved.
//

#import "SingletonDataSaver.h"

@implementation SingletonDataSaver
@synthesize saveArray;
static SingletonDataSaver *singletonDataSaver = nil;
+(SingletonDataSaver *) sharedInstance{
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        singletonDataSaver = [[SingletonDataSaver alloc] init];
        singletonDataSaver.saveArray = [[NSMutableArray alloc] init];
    });
    
    return singletonDataSaver;
}

@end
