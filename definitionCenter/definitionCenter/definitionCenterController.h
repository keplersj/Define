//
//  definitionCenterController.h
//  definitionCenter
//
//  Created by Kepler Sticka-Jones on 2/5/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SpringBoard/BBWeeAppController.h"
#import "BackEnd.h"

@interface definitionCenterController : NSObject <BBWeeAppController>
{
    UIView *_view;
}

- (UIView *)view;

@end