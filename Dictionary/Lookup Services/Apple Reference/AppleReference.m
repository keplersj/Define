//
//  BackEnd.m
//  Dictionary
//
//  Created by Kepler Sticka-Jones on 10/19/12.
//  Copyright (c) 2012 Kepler Sticka-Jones. All rights reserved.
//

#import "AppleReference.h"

@implementation AppleReference

+(void) startUp
{
    [[UIReferenceLibraryViewController alloc] initWithTerm:@"Kepler"];
}

+(BOOL) LookUp:(NSString *)term
{
    if ([UIReferenceLibraryViewController dictionaryHasDefinitionForTerm:term]==YES) {
        NSLog(@"Definition Found");
        [[NSNotificationCenter defaultCenter] postNotificationName:@"displayDefinition" object:self userInfo:(NSDictionary *)term];
        return true;
    }
    else{
        return false;
    }
    
}

@end
