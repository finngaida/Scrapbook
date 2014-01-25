//
//  SBAddViewController.m
//  Scrapbook
//
//  Created by Finn Gaida on 25.01.14.
//  Copyright (c) 2014 Finn Gaida. All rights reserved.
//

#import "SBAddViewController.h"
#import "SBScrap.h"

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
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    UITextField *title = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    [title setPlaceholder:@"Enter the title"];
    [title setDelegate:self];
    [title setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:title];
    self.textField = title;
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(title.frame) + 10, 320, 300)];
    [textView setDelegate:self];
    [textView setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:textView];
    self.textView = textView;
    
    [self navigationItem].rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(test)];
    [self navigationItem].rightBarButtonItem.title = @"Save";
    /*
    UIButton *save = [UIButton buttonWithType:UIButtonTypeCustom];
    [save setFrame:CGRectMake(textView.frame.size.width + 10, 40, 150, 40)];
    [save setTitle:@"Save" forState:UIControlStateNormal];
    [save setBackgroundColor:[UIColor greenColor]];
    [save addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:save];*/
    
}



- (void) test {
    SBScrap *scrap = [NSEntityDescription insertNewObjectForEntityForName:@"Scrap" inManagedObjectContext:self.context];
    [scrap setBody:self.textView.text];
    [scrap setTitle:self.textField.text];
    self.addedItemBlock(scrap);
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL) textFieldShouldEndEditing:(UITextField *)textField {
    [textField resignFirstResponder];
    [self test];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
