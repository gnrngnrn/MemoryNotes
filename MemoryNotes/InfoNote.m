//
//  InfoNote.m
//  Bloknotik
//
//  Created by Gnrn on 15.11.14.
//  Copyright (c) 2014 Gnrn. All rights reserved.
//

#import "InfoNote.h"

@implementation InfoNote
@synthesize date,note,title;
-(id) initWithTitle:(NSString *) title andNote:(NSString *) note{
    if (self = [super init]) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"HH:mm - dd/MM/yyyy"];
        NSDate *temp = [[NSDate alloc] init];
        [self setDate:[formatter stringFromDate:temp]];
        [self setNote:note];
        [self setTitle:title];
        return self;
    }
    return nil;
}
-(void) encodeWithCoder : (NSCoder *) coder{
    [coder encodeObject:date forKey:@"Date"];
    [coder encodeObject:title forKey:@"Title"];
    [coder encodeObject:note forKey:@"Note"];
}
-(id) initWithCoder:(NSCoder *) coder{
    date = [coder decodeObjectForKey:@"Date"];
    title = [coder decodeObjectForKey:@"Title"];
    note = [coder decodeObjectForKey:@"Note"];
    return self;
}


@end
