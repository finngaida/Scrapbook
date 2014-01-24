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

@end
