//
//  NoteViewController.m
//  Bloknotik
//
//  Created by Gnrn on 15.11.14.
//  Copyright (c) 2014 Gnrn. All rights reserved.
//

#import "NoteViewController.h"

@interface NoteViewController ()

@end

@implementation NoteViewController
@synthesize currentNote,dateLabel,noteField,titleField,pointer,delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [dateLabel setText:[currentNote date]];
    [noteField setText:[currentNote note]];
    [titleField setText:currentNote.title];
}

- (void)didReceiveMemoryWarning

{
    self.noteField = nil;
    self.dateLabel = nil;
    self.noteField = nil;
    [super didReceiveMemoryWarning];
}

- (IBAction)saveNote:(id)sender {
    [currentNote setTitle:[titleField text]];
    [currentNote setNote:noteField.text];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm - dd/MM/yyyy"];
    NSDate *temp = [[NSDate alloc] init];
    [currentNote setDate:[formatter stringFromDate:temp]];
    [self.delegate addItemViewController:self refreshNote:currentNote atIndexInArray:pointer];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (IBAction)textFieldDoneEditing:(id)sender{
    [sender resignFirstResponder];
}

- (IBAction)deleteNote:(id)sender {
    [self.delegate addItemViewController:self deletehNoteAtIndex:pointer];
    currentNote = nil;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)backgroundTap:(id)sender {
    [self.titleField resignFirstResponder];
    [self.noteField resignFirstResponder];
}
@end
