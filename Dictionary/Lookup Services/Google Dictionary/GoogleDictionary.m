//
//  GoogleDictionary.m
//  Dictionary
//
//  Created by Kepler Sticka-Jones on 10/14/13.
//  Copyright (c) 2013 Kepler Sticka-Jones. All rights reserved.
//

#import "GoogleDictionary.h"

@implementation GoogleDictionary

+(void) startUp
{
    NSLog(@"Should probably be checking if Google is still giving Dictionary information here...");
}

+(void) LookUp:(NSString *)term
{
    NSLog(@"Something just tried to use Google for the term: %@", term);
}

@end
