//
//  DictonaryReferenceSource.h
//  Dictionary
//
//  Created by Kepler Sticka-Jones on 10/15/13.
//  Copyright (c) 2013 Kepler Sticka-Jones. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DictonaryReferenceSource : NSObject

#ifdef __LIVE_TESTING

    #if defined(true)
    #undef true
    #endif

    #if defined(false)
    #undef flase
    #endif

    #define true (BOOL) 1
    #define false (BOOL) 0

#endif

+(void)startUp;
+(BOOL)LookUp:(NSString *)term;
+(void)unLoad;

@end
