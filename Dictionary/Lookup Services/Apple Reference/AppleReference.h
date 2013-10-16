//
//  BackEnd.h
//  Dictionary
//
//  Created by Kepler Sticka-Jones on 10/19/12.
//  Copyright (c) 2012 Kepler Sticka-Jones. All rights reserved.
//

#import "DictonaryReferenceSource.h"

@interface AppleReference : DictonaryReferenceSource

+(void)startUp;
+(void)LookUp:(NSString *)term;

@end
