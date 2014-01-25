//
//  FGViewController.m
//  Scrapbook
//
//  Created by Finn Gaida on 24.01.14.
//  Copyright (c) 2014 Finn Gaida. All rights reserved.
//

#import "SBViewController.h"
#import "SBScrap.h"
#import "SBAboutViewController.h"

@implementation SBViewController {
    NSUbiquitousKeyValueStore *store;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    NSManagedObjectContext *context = context = [(SBAppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    if (self = [super initWithStyle:UITableViewStylePlain andContext:context]) {
        
        
        
        return self;
    }
    
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@", self.navigationController);
    [self.fetchedResultsController performFetch:nil];
    // testing iClound functionality
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(storeDidChange:) name:NSUbiquitousKeyValueStoreDidChangeExternallyNotification object:nil];
    store = [NSUbiquitousKeyValueStore defaultStore];
    [store synchronize];
    
    [[UINavigationBar appearance] setBackgroundColor:[UIColor colorWithRed:(167.0/255.0) green:(28.0/255.0) blue:(87.0/255.0) alpha:1]];
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:(167.0/255.0) green:(28.0/255.0) blue:(87.0/255.0) alpha:1]];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackOpaque];
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    title.backgroundColor = [UIColor clearColor];
    title.textColor = [UIColor whiteColor];
    title.textAlignment = NSTextAlignmentCenter;
    title.numberOfLines = 0;
    title.font = [UIFont fontWithName:@"Brain Flower" size:35];
    title.text = NSLocalizedString(@"SCRAPBOOK", nil);
    [self.navigationItem setTitleView:title];
    
    [self navigationItem].rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showAddScreen)];
    [self navigationItem].leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(showAboutScreen)];
    [self navigationItem].leftBarButtonItem.title = @"About";
}

- (void)showAddScreen {
    SBAddViewController *add = [[SBAddViewController alloc] init];
    [add setContext:self.managedObjectContext];
    [add setAddedItemBlock:^(SBScrap *scrap) {
        [self insertScrap:scrap];
        NSLog(@"insert");
    }];
    [self.navigationController pushViewController:add animated:YES];
}

- (void)showAboutScreen {
    SBAboutViewController *about = [[SBAboutViewController alloc] init];
//    [about set
    [self.navigationController pushViewController:about animated:YES];
}

- (void)didReceiveMemoryWarning {[super didReceiveMemoryWarning];}

- (void)storeDidChange:(NSNotification *)notification {
    
}

- (IBAction)fetch:(id)sender {
    if ([[NSUbiquitousKeyValueStore defaultStore] stringForKey:@"Doge"])
        [_outputlabel setText:[[NSUbiquitousKeyValueStore defaultStore] stringForKey:@"Doge"]];
    else
        [_outputlabel setText:@"Error fetching data"];
}

- (IBAction)send:(id)sender {
    [[NSUbiquitousKeyValueStore defaultStore] setString:_inputField.text forKey:@"Doge"];
    if ([[NSUbiquitousKeyValueStore defaultStore] synchronize] == YES) {
        [[[UIAlertView alloc] initWithTitle:@"Such Success" message:@"Many congrats" delegate:nil cancelButtonTitle:@"wow" otherButtonTitles:nil, nil] show];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    SBScrap *scrap = [self.fetchedResultsController objectAtIndexPath:indexPath];
    [cell.textLabel setText:[scrap body]];
    // cell setup
    
    return cell;
}

@end
