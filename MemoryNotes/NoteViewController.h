//
//  NoteViewController.h
//  Bloknotik
//
//  Created by Gnrn on 15.11.14.
//  Copyright (c) 2014 Gnrn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoNote.h"
#import "MainTableViewController.h"
#import "DelegateProtocol.h"

@class NoteViewController;
@interface NoteViewController : UIViewController

@property (nonatomic,weak) id <DelegateProtocol> delegate;
@property (nonatomic,strong) InfoNote *currentNote;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextView *noteField;
@property int pointer;
- (IBAction)saveNote:(id)sender;
- (IBAction)textFieldDoneEditing:(id)sender;
- (IBAction)deleteNote:(id)sender;
@end
