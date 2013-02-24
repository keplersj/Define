//
//  DictonaryViewController.h
//  Dictionary
//
//  Created by Kepler on 8/8/12.
//  Copyright (c) 2012 Kepler Sticka-Jones. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BackEnd.h"

@interface DictonaryViewController : UIViewController <UIPopoverControllerDelegate, UITextFieldDelegate>

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

@property (weak, nonatomic) IBOutlet UITextField *DictionaryTermFiel;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *KeyboardSwipe;
@property (weak, nonatomic) NSString *deviceType;
@property (weak, nonatomic) NSString *iOSVerison;
- (IBAction)KeyboardSwipeDown:(id)sender;
- (IBAction)togglePopover:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *DictDirections;
@property (weak, nonatomic) IBOutlet UILabel *arrowText;
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation;
- (void)ViewDefintion;

@end