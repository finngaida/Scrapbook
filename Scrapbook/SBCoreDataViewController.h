//
//  SBCoreDataViewController.h
//  Scrapbook
//
//  Created by Max Kramer on 25/01/2014.
//  Copyright (c) 2014 Finn Gaida. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SBScrap;
@interface SBCoreDataViewController : UITableViewController <NSFetchedResultsControllerDelegate>

- (id) initWithStyle:(UITableViewStyle)style andContext:(NSManagedObjectContext *) context;

- (void) insertScrap:(SBScrap *) scrap;
- (void) deleteScrap:(SBScrap *) scrap;
- (void) updateScrap:(SBScrap *) scrap;
- (NSArray *) findScrapsWithAttributes:(NSDictionary *) dictionary;

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end
