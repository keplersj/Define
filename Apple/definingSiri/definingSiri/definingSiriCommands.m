//
//  definingSiriCommands.m
//  definingSiri
//
//  Created by Kepler Sticka-Jones on 2/4/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "definingSiriCommands.h"

@implementation definingSiriCommands

-(id)init
{
	if ((self = [super init]))
	{
	}
	return self;
}

-(void)dealloc
{
	[super dealloc];
}

-(BOOL)handleSpeech:(NSString*)text tokens:(NSArray*)tokens tokenSet:(NSSet*)tokenset context:(id<SEContext>)ctx
{
	// NSLog(@"definingSiriCommands handleSpeech: %@", text);
	
	// react to recognized tokens (what happen or what happened)
	if ([tokens count] >= 2 && [[tokens objectAtIndex:0] isEqualToString:@"who"] &&
		([tokenset containsObject:@"rocks"] || [tokenset containsObject:@"rules"]))
	{
		// three ways to respond...
		
		// #1: send utterance text as response
		//[ctx sendAddViewsUtteranceView:@"Angels and Airwaves"];
		
		// #2: send snippet view as response
		//NSDictionary* snipProps = [NSDictionary dictionaryWithObjectsAndKeys:@"Angels and Airwaves", @"text", @"http://angelsandairwaves.com", @"link", nil];
		//[ctx sendAddViewsSnippet:@"definingSiriSnippet" properties:snipProps];
		
		// #3: send utterance text and snippet view as response
		NSDictionary* snipProps = [NSDictionary dictionaryWithObjectsAndKeys:@"Angels and Airwaves", @"text", @"http://angelsandairwaves.com", @"link", nil];
		NSMutableArray* views = [NSMutableArray arrayWithCapacity:2];
		[views addObject:[ctx createAssistantUtteranceView:@"Angels and Airwaves"]];
		[views addObject:[ctx createSnippet:@"definingSiriSnippet" properties:snipProps]];
		[ctx sendAddViews:views];

		// for more complex extensions, do something asynchronly here...

		// end of the request
		[ctx sendRequestCompleted];
		
		return YES; // handled by extension
	}
	
	return NO;
}

@end
