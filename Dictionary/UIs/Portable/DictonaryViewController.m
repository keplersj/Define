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
@synthesize KeyboardSwipe;
@synthesize DictionaryTermFiel;

- (void)viewDidLoad
{
    //Setting UI Strings
    self.DictDirections.text = NSLocalizedString(@"Guide", @"iPad Guide Text");
    
    //We now have control over the keyboard
    [DictionaryTermFiel setDelegate:self];\
}

- (void)viewDidUnload
{
    
    [self setDictionaryTermFiel:nil];
    [self setKeyboardSwipe:nil];
    [super viewDidUnload];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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

- (void)displayDefinition: (NSNotification *)notification {
    NSLog(@"Displaying the Definition");
    NSDictionary *dict = [notification userInfo];
    UIReferenceLibraryViewController *reference = [[UIReferenceLibraryViewController alloc] initWithTerm:dict];
    [self presentViewController:reference animated:YES completion:NULL];

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
