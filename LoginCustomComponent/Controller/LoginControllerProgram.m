//
//  LoginControllerProgram.m
//  LoginCustomComponent
//
//  Created by Mohit Jain on 4/7/13.
//  Copyright (c) 2013 Mohit Jain. All rights reserved.
//

#import "LoginControllerProgram.h"
#import "LoginCustomComponentAppDelegate.h"

@interface LoginControllerProgram ()

@end

@implementation LoginControllerProgram
@synthesize detailView, loginCustomComponent;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)login:(id)sender {
    
    // Perform login functions
    
    //Validation
    if([self.loginCustomComponent.usernameTextField.text isEqualToString:@""] || [self.loginCustomComponent.passwordTextField.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message: @"You cannot log in with the null credentials." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
    else {
    [self.view addSubview:detailView];
    }
}

-(IBAction)goBackToLogin:(id)sender {
    [detailView removeFromSuperview];
}



- (void)viewDidLoad
{
    [super viewDidLoad];

  //  self.loginCustomComponent.rememberMeLabel.text = @"Remember";
    loginCustomComponent = [[CustomComponent alloc] initWithFrame:CGRectMake(30, 50, 280, 129)];
    
    //Edit UI element properties as required
    //Example:
    //self.loginCustomComponent.usernameTextField.textColor = [UIColor redColor];
    //self.loginCustomComponent.rememberMeLabel.text = @"Remember";
    

    
    
    
    [self.view addSubview:loginCustomComponent];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
