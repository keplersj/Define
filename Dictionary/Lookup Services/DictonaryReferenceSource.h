//
//  DictonaryReferenceSource.h
//  Dictionary
//
//  Created by Kepler Sticka-Jones on 10/15/13.
//  Copyright (c) 2013 Kepler Sticka-Jones. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DictonaryReferenceSource : NSObject

+(void)startUp;
+(void)LookUp:(NSString *)term;
+(void)unLoad;

@end
