//
//  SingletonDataSaver.h
//  SoftIndustry
//
//  Created by Gnrn on 17.11.14.
//  Copyright (c) 2014 Gnrn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingletonDataSaver : NSObject{
   NSMutableArray *saveArray;
}
@property (nonatomic,strong) NSMutableArray *saveArray;
+(SingletonDataSaver *) sharedInstance;

@end
