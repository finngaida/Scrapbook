//
//  SBCoreDataViewController.m
//  Scrapbook
//
//  Created by Max Kramer on 25/01/2014.
//  Copyright (c) 2014 Finn Gaida. All rights reserved.
//

#import "SBCoreDataViewController.h"
#import "SBScrap.h"

@interface SBCoreDataViewController ()

@end

@implementation SBCoreDataViewController

#pragma mark - Initialiser

- (id) initWithStyle:(UITableViewStyle)style andContext:(NSManagedObjectContext *) context {
    if ((self = [super initWithStyle:style])) {
        [self setManagedObjectContext:context];
    }
    return self;
}

#pragma mark - Properties

- (NSFetchRequest *) defaultFetchRequest {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Scrap"];
    [fetchRequest setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"dateAdded" ascending:YES]]];
    return fetchRequest;
}

- (NSFetchedResultsController *) fetchedResultsController {
    if (_fetchedResultsController == nil) {
        _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:[self defaultFetchRequest] managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"cache"];
        [_fetchedResultsController setDelegate:self];
    }
    return _fetchedResultsController;
}

#pragma mark - Data Management

- (void) insertScrap:(SBScrap *) scrap {
    [self.managedObjectContext insertObject:scrap];
    [self persistChanges];
}

- (void) deleteScrap:(SBScrap *) scrap {
    [self.managedObjectContext deleteObject:scrap];
    [self persistChanges];
}

- (void) updateScrap:(SBScrap *) scrap {
    if ([[self.managedObjectContext updatedObjects] containsObject:scrap]) {
        [self persistChanges];
    }
}

- (NSArray *) findScrapsWithAttributes:(NSDictionary *) dictionary {
    NSMutableString *predicateString = [NSMutableString string];
    __block NSUInteger idx = 0;
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (idx == 0) {
            [predicateString appendFormat:@"%@ == %@", key, obj];
        }
        else {
            [predicateString appendFormat:@"AND %@ == %@", key, obj];
        }
        idx++;
    }];
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Scrap"];
    if (predicateString.length > 0) {
        [fetchRequest setPredicate:[NSPredicate predicateWithFormat:predicateString]];
    }
    NSError *error = nil;
    NSArray *results = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"Unable to find scraps with attributes: %@ error: %@", dictionary, error);
    }
    return results;
}

#pragma mark Saving

- (void) persistChanges {
    NSError *error = nil;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Unable to save changes: %@", error);
    }
}

#pragma mark - Fetched Results Controller

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id )sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath
     forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
            
        case NSFetchedResultsChangeMove:
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.fetchedResultsController.sections count];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionInfo = self.fetchedResultsController.sections[section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    @throw [NSException exceptionWithName:@"SBCoreDataViewController'" reason:@"You must override -cellForRowAtIndexPath" userInfo:@{@"caller" : NSStringFromClass([self class]), @"tableView" : tableView, @"indexPath" : indexPath}];
}

@end
