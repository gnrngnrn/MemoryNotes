//
//  AppDelegate.h
//  SoftIndustry
//
//  Created by Gnrn on 16.11.14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SingletonDataSaver.h"
extern NSMutableArray *arr;

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
     NSMutableArray *arr;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,strong) NSMutableArray *arr;

@end
