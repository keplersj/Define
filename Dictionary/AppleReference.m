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

+(void) LookUp:(NSString *)term
{
    if ([UIReferenceLibraryViewController dictionaryHasDefinitionForTerm:term]==YES) {
        NSLog(@"Definition Found");
        [[NSNotificationCenter defaultCenter] postNotificationName:@"displayDefinition" object:self userInfo:(NSDictionary *)term];
    }
    
    else{
        
        if ([term length] < 0) {
            NSLog(@"You didn't give me a term");
            [[NSNotificationCenter defaultCenter] postNotificationName:@"noTerm" object:self];
        }
        
        if ([term length] > 0) {
            NSLog(@"Term did not return a definition");
            [[NSNotificationCenter defaultCenter] postNotificationName:@"noDef" object:self];
        }
    }
}

@end
