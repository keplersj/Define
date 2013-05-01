//
//  DOSViewController.m
//  Define Online Shell
//
//  Created by Kepler Sticka-Jones on 4/30/13.
//  Copyright (c) 2013 Project Define. All rights reserved.
//

#import "DOSViewController.h"

@interface DOSViewController ()

@end

@implementation DOSViewController

- (void)viewDidLoad
{
    self.webView = _webView;
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Source Code/index" ofType:@"html"]isDirectory:NO]]];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
