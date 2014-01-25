//
//  FGViewController.h
//  Scrapbook
//
//  Created by Finn Gaida on 24.01.14.
//  Copyright (c) 2014 Finn Gaida. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBCoreDataViewController.h"

@interface SBViewController : SBCoreDataViewController

@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UILabel *outputlabel;

- (IBAction)fetch:(id)sender;
- (IBAction)send:(id)sender;

@end
