//
//  FSFirstViewController.m
//  TestBeacon
//
//  Created by Forrest Shi on 5/9/14.
//  Copyright (c) 2014 Request. All rights reserved.
//

#import "FSFirstViewController.h"

@interface FSFirstViewController ()<UIWebViewDelegate>


@end

@implementation FSFirstViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}


- (void)viewWillAppear:(BOOL)animated{
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.thegaragesociety.com/"]]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
