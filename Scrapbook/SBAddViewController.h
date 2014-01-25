//
//  SBAddViewController.h
//  Scrapbook
//
//  Created by Finn Gaida on 25.01.14.
//  Copyright (c) 2014 Finn Gaida. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SBScrap;
@interface SBAddViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic) SBScrap *scrap;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) NSManagedObjectContext *context;

@property (nonatomic, strong) void (^addedItemBlock)(SBScrap * scrap);

@end
