//
//  FGViewController.m
//  Scrapbook
//
//  Created by Finn Gaida on 24.01.14.
//  Copyright (c) 2014 Finn Gaida. All rights reserved.
//

#import "SBViewController.h"

@implementation SBViewController {
    NSUbiquitousKeyValueStore *store;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // testing iClound functionality
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(storeDidChange:) name:NSUbiquitousKeyValueStoreDidChangeExternallyNotification object:nil];
    store = [NSUbiquitousKeyValueStore defaultStore];
    [store synchronize];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bar"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    [self.navigationController.navigationBar setBackgroundColor:[UIColor redColor]];
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
    [self.navigationController pushViewController:add animated:YES];
}

- (void)showAboutScreen {
    SBAboutViewController *about = [self.storyboard instantiateViewControllerWithIdentifier:@"about"];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15; // [objects count]
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    // cell setup
    
    return cell;
}

@end
