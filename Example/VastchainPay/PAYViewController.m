//
//  PAYViewController.m
//  VastchainPay
//
//  Created by chenxiandiao on 05/05/2022.
//  Copyright (c) 2022 chenxiandiao. All rights reserved.
//

#import "PAYViewController.h"
#import "PayWebViewController.h"

@interface PAYViewController ()

@end

@implementation PAYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"firstPage");
    PayWebViewController *viewController = [[PayWebViewController alloc]initWithUrl:@"https://www.baidu.com"];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
