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

+(void) findDeviceType
{
    NSString *deviceType = [UIDevice currentDevice].model;
    //NSLog(@"Device is a %@", deviceType);
}

+(void) findOSVersion
{
    if (!NSClassFromString(@"NSLayoutRelationEqual")) {
        NSString *iOSVerison = @"Post iOS 5";
        //NSLog(@"Device is running a verison of iOS %@", iOSVerison);
    }
    else {
        NSString *iOSVerison = @"Pre iOS 6";
        //NSLog(@"Device is running a verison of iOS %@", iOSVerison);
    }
}

@end
