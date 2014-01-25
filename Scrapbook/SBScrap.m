//
//  SBScrap.m
//  Scrapbook
//
//  Created by Max Kramer on 25/01/2014.
//  Copyright (c) 2014 Finn Gaida. All rights reserved.
//

#import "SBScrap.h"


@implementation SBScrap

@dynamic title;
@dynamic body;
@dynamic tags;
@dynamic mediaURL;
@dynamic dateAdded;

- (void) awakeFromInsert {
    if (self.dateAdded == nil) {
        [self setDateAdded:[NSDate date]];
    }
}

@end
