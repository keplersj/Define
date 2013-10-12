//
//  BackEnd.m
//  Dictionary
//
//  Created by Kepler Sticka-Jones on 10/19/12.
//  Copyright (c) 2012 Kepler Sticka-Jones. All rights reserved.
//

#import "BackEnd.h"

@implementation BackEnd

+(void) startUp
{
    [[UIReferenceLibraryViewController alloc] initWithTerm:@"Kepler"];
    //NSLog(@"UIReferenceLibrary Initalized");
    //[KBReferenceLibrary log];
}

+(void) LookUp:(NSString *)term
{
    if ([UIReferenceLibraryViewController dictionaryHasDefinitionForTerm:term]==YES) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"displayDefinition" object:self userInfo:(NSDictionary *)term];
        NSLog(@"Definition Found");
        [Flurry logEvent:@"Search_For" withParameters:term];
    }
    
    else{
        
        if ([term length] < 0) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"noTerm" object:self];
            NSLog(@"You didn't give me a term");
            [Flurry logEvent:@"No_Term_Supplied"];
        }
        
        if ([term length] > 0) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"noDef" object:self];
            NSLog(@"Term did not return a definition");
            [Flurry logEvent:@"Definition_Not_Found" withParameters:term];
        }
    }
}

+(void) unLoad
{
    
}

@end
