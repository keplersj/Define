//
//  BackEnd.h
//  Dictionary
//
//  Created by Kepler Sticka-Jones on 10/19/12.
//  Copyright (c) 2012 Kepler Sticka-Jones. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Flurry.h"

@interface BackEnd : NSObject

+(void)startUp;
+(void)LookUp:(NSString *)term;
+(void)unLoad;


@end
