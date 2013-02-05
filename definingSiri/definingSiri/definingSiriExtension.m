//
//  definingSiriExtension.m
//  definingSiri
//
//  Created by Kepler Sticka-Jones on 2/4/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "definingSiriExtension.h"
#import "definingSiriCommands.h"
#import "definingSiriSnippet.h"

@implementation definingSiriExtension

-(id)initWithSystem:(id<SESystem>)system
{
	if ((self = [super init]))
	{
		[system registerCommand:[definingSiriCommands class]];
		[system registerSnippet:[definingSiriSnippet class]];
	}
	return self;
}

-(NSString*)author
{
	return @"Kepler Sticka-Jones";
}

-(NSString*)name
{
	return @"definingSiri";
}

-(NSString*)description
{
	return @"Created using the iOSOpenDev Xcode template for building an Assistant Extension";
}

-(NSString*)website
{
	return @"http://www.iOSOpenDev.com";
}

-(NSString*)versionRequirement
{
	return @"1.0.1";
}

@end