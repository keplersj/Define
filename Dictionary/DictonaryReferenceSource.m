//
//  DictonaryReferenceSource.m
//  Dictionary
//
//  Created by Kepler Sticka-Jones on 10/15/13.
//  Copyright (c) 2013 Kepler Sticka-Jones. All rights reserved.
//

#import "DictonaryReferenceSource.h"

@implementation DictonaryReferenceSource

+(void) startUp
{
    NSLog(@"Something tried to intiialize something. Someone will figure it out eventually.");
}

+(void) LookUp:(NSString *)term
{
    NSLog(@"Something just tried to look up the term %@", term);
}

+(void) unLoad
{
    NSLog(@"Whatever hasn't been unloaded and could be better be now!");
}

@end
