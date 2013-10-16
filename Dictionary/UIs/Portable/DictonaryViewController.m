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
    //Telling the Engine to Turn On
    [AppleReference startUp];
    
    //Allowing the interface to recieve notifactions from the engine
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(displayDefinition:) name:@"displayDefinition" object:nil];
    
    //Setting UI Strings
    self.DictDirections.text = NSLocalizedString(@"Guide", @"iPad Guide Text");
    
    //Intialized Everything needed to function and for interface, showing user
    [super viewDidLoad];
    
    //We now have control over the keyboard
    [DictionaryTermFiel setDelegate:self];
    
    //Make the damn status bar cooperate!
    [self setNeedsStatusBarAppearanceUpdate];
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
    if ([AppleReference LookUp:self.DictionaryTermFiel.text] == true) {
        return YES;
    }
    else {
        if ([AppleReference LookUp:self.DictionaryTermFiel.text] == false) {
            if ([self.DictionaryTermFiel.text length] < 0) {
                NSLog(@"The term box did not contain anything.");
                [DictionaryTermFiel endEditing:YES];
                UIAlertView *alert = [[UIAlertView alloc]
                                      initWithTitle: NSLocalizedString(@"NoTermAlertTitle", @"Title of the no term in box alert")
                                      message: NSLocalizedString(@"NoTermAlertMessage", @"Button of the no term in box alert")
                                      delegate: nil
                                      cancelButtonTitle: NSLocalizedString(@"AlertButton", @"Button of the no term in box alert")
                                      otherButtonTitles:nil];
                [alert show];
                return NO;
            }
        }
    }
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
