//
//  MainTableViewController.h
//  Bloknotik
//
//  Created by Gnrn on 15.11.14.
//  Copyright (c) 2014 Gnrn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoteViewController.h"
#import "InfoNote.h"
#import "DelegateProtocol.h"
#import "AppDelegate.h"
#import "SingletonDataSaver.h"

@interface MainTableViewController : UITableViewController <DelegateProtocol>
@property (nonatomic,strong) NSMutableArray *infoNotes;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
-(IBAction)addNewNote:(id)sender;
@end
