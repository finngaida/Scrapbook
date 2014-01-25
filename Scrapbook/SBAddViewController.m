//
//  SBAddViewController.m
//  Scrapbook
//
//  Created by Finn Gaida on 25.01.14.
//  Copyright (c) 2014 Finn Gaida. All rights reserved.
//

#import "SBAddViewController.h"

@implementation SBAddViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bar"] forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
        [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
        [self.navigationController.navigationBar setBackgroundColor:[UIColor redColor]];
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
        title.backgroundColor = [UIColor clearColor];
        title.textColor = [UIColor whiteColor];
        title.textAlignment = NSTextAlignmentLeft;
        title.numberOfLines = 0;
        title.font = [UIFont fontWithName:@"Brain Flower" size:35];
        title.text = NSLocalizedString(@"ADD ITEM", nil);
        [self.navigationItem setTitleView:title];
        self.navigationItem.backBarButtonItem.title = @"Back";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
