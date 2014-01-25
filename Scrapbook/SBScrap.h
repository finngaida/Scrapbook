//
//  SBScrap.h
//  Scrapbook
//
//  Created by Max Kramer on 25/01/2014.
//  Copyright (c) 2014 Finn Gaida. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface SBScrap : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * body;
@property (nonatomic, retain) NSString * tags;
@property (nonatomic, retain) NSString * mediaURL;
@property (nonatomic, retain) NSDate * dateAdded;

@end
