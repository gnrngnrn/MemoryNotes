//
//  MainTableViewController.m
//  Bloknotik
//
//  Created by Gnrn on 15.11.14.
//  Copyright (c) 2014 Gnrn. All rights reserved.
//

#import "MainTableViewController.h"


@interface MainTableViewController ()

@end

@implementation MainTableViewController
@synthesize infoNotes,tableView;
NSArray *pathList;
NSString *documentsDirectory ;
NSString *path;
NSFileManager *m ;

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc]initWithTitle:@"Add" style:UIBarButtonSystemItemAction target:self action:@selector(addNewNote:)];
    self.navigationItem.rightBarButtonItem = barItem;
    pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    documentsDirectory =  [pathList  objectAtIndex:0];
    path = [NSString stringWithFormat:@"%@%@",documentsDirectory,@"NotesList.plist"];
    m = [[NSFileManager alloc] init];
    if ([m fileExistsAtPath:path]) {
        infoNotes = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    }else{
        infoNotes = [[NSMutableArray alloc] init];
    }
    SingletonDataSaver *saver = [SingletonDataSaver sharedInstance];
    [saver setSaveArray:infoNotes];
}

-(void) addItemViewController:(NoteViewController *) controller refreshNote: (InfoNote *) note atIndexInArray: (int) position{
    [infoNotes replaceObjectAtIndex:position withObject:note];
    [self.tableView reloadData];
    
}
-(void) addItemViewController:(NoteViewController *) controller deletehNoteAtIndex: (int) index {
    [infoNotes removeObjectAtIndex:index];
    [self.tableView reloadData];
}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"DetailVeiw"]) {
        NoteViewController *nvc = [segue destinationViewController];
        NSIndexPath *indePath = [self.tableView indexPathForSelectedRow];
        InfoNote *note = [infoNotes objectAtIndex:[indePath row]];
        [nvc setCurrentNote:note];
        [nvc setDelegate:self];
        [nvc setPointer:indePath.row];
        
    }    
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}
-(IBAction) addNewNote:(id)sender{
    NoteViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"NoteViewControllerID"];
    [controller setDelegate:self];
    InfoNote *note = [[InfoNote alloc] initWithTitle:nil andNote:nil];
    [infoNotes addObject:note];
    [controller setCurrentNote:note];
    if (infoNotes.count==0) {
        [controller setPointer:0];
    }else{
    [controller setPointer:(infoNotes.count -1)];
    }
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning
{
    m = nil;
    path = nil;
    pathList = nil;
    documentsDirectory = nil;
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [infoNotes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier =@"PhotoCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    InfoNote *current = [infoNotes objectAtIndex:indexPath.row];
    [cell.textLabel setText:current.title];
    [cell.detailTextLabel setText:current.date];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55; }
@end
