//
//  DelegateProtocol.h
//  Bloknotik
//
//  Created by Gnrn on 15.11.14.
//  Copyright (c) 2014 Gnrn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InfoNote.h"
#import "MainTableViewController.h"
#import "NoteViewController.h"
@class MainTableViewController;
@class NoteViewController;
@protocol DelegateProtocol <NSObject>

-(void) addItemViewController:(NoteViewController *) controller refreshNote: (InfoNote *) note atIndexInArray: (int) position;
-(void) addItemViewController:(NoteViewController *) controller deletehNoteAtIndex: (int) index;

@end
