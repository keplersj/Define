//
//  DictonaryPadViewController.h
//  Dictionary
//
//  Created by Kepler Sticka-Jones on 10/28/12.
//  Copyright (c) 2012 Kepler Sticka-Jones. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BackEnd.h"

@interface DictonaryPadViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *dictionaryTermField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
- (IBAction)searchButtonTouch:(id)sender;
- (void)viewDefinition;
@property (weak, nonatomic) IBOutlet UILabel *dictionaryGuide;
@property (weak, nonatomic) IBOutlet UILabel *dictionaryCopyright;

@end
