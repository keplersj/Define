//
//  DictonaryViewController.m
//  Dictionary
//
//  Created by Kepler on 8/8/12.
//  Copyright (c) 2012 Kepler Sticka-Jones. All rights reserved.
//

#import "DictonaryViewController.h"

@interface DictonaryViewController ()

@end

@implementation DictonaryViewController;
@synthesize KeyboardSwipe

- (void)viewDidLoad
{
    //Setting UI Strings
    self.DictDirections.text = NSLocalizedString(@"Guide", @"iPad Guide Text");
}

- (void)viewDidUnload
{
    [self setKeyboardSwipe:nil];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    }
    else {
        return YES;
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    }
}

- (IBAction)KeyboardSwipeDown:(id)sender{
    [DictionaryTermFiel endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)DictionaryTermFiel
{
    if ([self.DictionaryTermFiel.text length] > 0) {
        [AppleReference LookUp:self.DictionaryTermFiel.text];
        return YES;
    }
    else {
        return NO;
    }
}

@end
