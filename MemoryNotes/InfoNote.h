//
//  InfoNote.h
//  Bloknotik
//
//  Created by Gnrn on 15.11.14.
//  Copyright (c) 2014 Gnrn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InfoNote : NSObject
@property (nonatomic,strong) NSString *date;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *note;
-(id) initWithTitle:(NSString *) title andNote:(NSString *) note;
@end
