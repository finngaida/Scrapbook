//
//  SBAboutViewController.m
//  Scrapbook
//
//  Created by Finn Gaida on 25.01.14.
//  Copyright (c) 2014 Finn Gaida. All rights reserved.
//

#import "SBAboutViewController.h"

@interface SBAboutViewController ()

@end

@implementation SBAboutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
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
    title.text = NSLocalizedString(@"ABOUT", nil);
    [self.navigationItem setTitleView:title];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _titleOne.font = [UIFont fontWithName:@"Brain Flower" size:30];
    _titleOne.textColor = [UIColor blackColor];
    _titleTwo.font = [UIFont fontWithName:@"Brain Flower" size:30];
    _titleTwo.textColor = [UIColor blackColor];
    _titleThree.font = [UIFont fontWithName:@"Brain Flower" size:30];
    _titleThree.textColor = [UIColor blackColor];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
