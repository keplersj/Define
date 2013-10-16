//
//  DictonaryPadViewController.m
//  Dictionary
//
//  Created by Kepler Sticka-Jones on 10/28/12.
//  Copyright (c) 2012 Kepler Sticka-Jones. All rights reserved.
//

#import "DictonaryPadViewController.h"

@interface DictonaryPadViewController ()

@end

@implementation DictonaryPadViewController
@synthesize dictionaryTermField;
@synthesize searchButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    //Telling the Engine to Start Up
    [AppleReference startUp];
    
    //Setting up to recieve messages from Engine
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(displayDefinition:) name:@"displayDefinition" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noTerm:) name:@"noTerm" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noDef:) name:@"noDef" object:nil];
    
    //Allows me to control the keyboard
    [dictionaryTermField setDelegate:self];
    
    //Setting the strings on UI Elements
    NSString *PadSearchButton = NSLocalizedString(@"PadSearchButton", @"The Define Button on the iPad");
    [searchButton setTitle: PadSearchButton forState:UIControlStateNormal];
    [searchButton setTitle: PadSearchButton forState:UIControlStateHighlighted];
    [searchButton setTitle: PadSearchButton forState:UIControlStateDisabled];
    [searchButton setTitle: PadSearchButton forState:UIControlStateSelected];
    self.dictionaryGuide.text = NSLocalizedString(@"Guide", @"iPad Guide Text");
    
    //The view has loaded
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchButtonTouch:(id)sender {
    [AppleReference LookUp:self.dictionaryTermField.text];
}

- (void)displayDefinition: (NSNotification *)notification {
    NSLog(@"Displaying the Definition");
    NSDictionary *dict = [notification userInfo];
    UIReferenceLibraryViewController *reference = [[UIReferenceLibraryViewController alloc] initWithTerm:dict];
    reference.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:reference animated:YES completion:NULL];
}
- (BOOL)textFieldShouldReturn:(UITextField *)dictionaryTermField
{
    [AppleReference LookUp:self.dictionaryTermField.text];
    return YES;
}

- (void)noTerm: (NSNotification *)notification
{
    [dictionaryTermField endEditing:YES];
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle: NSLocalizedString(@"NoTermAlertTitle", @"Title of the no term in box alert")
                          message: NSLocalizedString(@"NoTermAlertMessage", @"Button of the no term in box alert")
                          delegate: nil
                          cancelButtonTitle: NSLocalizedString(@"AlertButton", @"Button of the no term in box alert")
                          otherButtonTitles:nil];
    [alert show];
}

- (void)noDef: (NSNotification *)notification
{
    [dictionaryTermField endEditing:YES];
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle: NSLocalizedString(@"NoDefAlertTitle", @"Title of the no def alert")
                          message: NSLocalizedString(@"NoDefAlertMessage", @"Message of the no def alert")
                          delegate: nil
                          cancelButtonTitle: NSLocalizedString(@"AlertButton", @"Button of the no def alert")
                          otherButtonTitles:nil];
    [alert show];
}

@end
