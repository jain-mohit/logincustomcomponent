//
//  LoginControllerProgram.m
//  LoginCustomComponent
//
//  Created by Mohit Jain on 4/7/13.
//  Copyright (c) 2013 Mohit Jain. All rights reserved.
//

#import "LoginControllerProgram.h"
#import "LoginCustomComponentAppDelegate.h"
#import "LoginCustomComponentViewController.h"

@interface LoginControllerProgram ()

@end

@implementation LoginControllerProgram
@synthesize loginComponent,detailView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)login:(id)sender {
    
    // Perform login functions
    [loginComponent.view addSubview:detailView];
}

-(IBAction)goBackToLogin:(id)sender {
    [detailView removeFromSuperview];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    loginComponent= [[LoginCustomComponentViewController alloc]initWithNibName:@"LoginCustomComponentViewController" bundle:nil];
    [self.view addSubview:loginComponent.view];
    
    [loginComponent.loginButton addTarget:self
                             action:@selector(login:)
       forControlEvents:UIControlEventTouchUpInside];
    
    //Edit UI element properties as required or add more UI view on top of loginComponent
    //Example:
    //loginComponent.username.textColor = [UIColor redColor];
    // Do any additional setup after loading the view from its nib.
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
