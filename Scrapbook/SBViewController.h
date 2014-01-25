//
//  FGViewController.h
//  Scrapbook
//
//  Created by Finn Gaida on 24.01.14.
//  Copyright (c) 2014 Finn Gaida. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBViewController : UIViewController <UITableViewDataSource,  UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UILabel *outputlabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)fetch:(id)sender;
- (IBAction)send:(id)sender;

@end
