//
//  LoginCustomComponentViewController.m
//
//  Created by Mohit Jain on 4/4/13.
//  Copyright (c) 2013 Mohit Jain. All rights reserved.
//

#import "LoginCustomComponentViewController.h"

@interface LoginCustomComponentViewController ()


@end

@implementation LoginCustomComponentViewController
@synthesize passwordSaveButton,usernameSaveButton,usernameTextField,passwordTextField,detailView,loginButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)saveUsername:(id)sender {
    [self save:@"username" counter:@"countUsername"];
}

-(IBAction)savePassword:(id)sender {
    [self save:@"password" counter:@"countPassword"];
}


-(void)viewWillLayoutSubviews {
    [self loadSavedCredentials:@"username"];
    [self loadSavedCredentials:@"password"];
}

-(void)save: (NSString*)field counter:(NSString*)countString {
    
    NSInteger count = [[NSUserDefaults standardUserDefaults]
                       integerForKey:countString];
    if(!(count%2)) {
        
        if([countString isEqualToString:@"countUsername"]) {
        NSUserDefaults *usernameDefault = [NSUserDefaults standardUserDefaults];
        [usernameDefault setObject:usernameTextField.text forKey:field];
        }
        else if([countString isEqualToString:@"countPassword"]) {
            NSUserDefaults *passwordDefault = [NSUserDefaults standardUserDefaults];
            [passwordDefault setObject:passwordTextField.text forKey:field];
        }
        
        
        if([field isEqualToString:@"username"]) {
            [usernameSaveButton setBackgroundImage:[UIImage imageNamed:@"buttonOn.png"] forState:UIControlStateNormal];
            [usernameSaveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        else{
            [passwordSaveButton setBackgroundImage:[UIImage imageNamed:@"buttonOn.png"] forState:UIControlStateNormal];
            [passwordSaveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
    }
    else {
        if([countString isEqualToString:@"countUsername"]) {
        NSUserDefaults *usernameDefault = [NSUserDefaults standardUserDefaults];
        [usernameDefault removeObjectForKey:field];
        }
        else {
            NSUserDefaults *passwordDefault = [NSUserDefaults standardUserDefaults];
            [passwordDefault removeObjectForKey:field];
        }
        
        if([field isEqualToString:@"username"]) {
            [usernameSaveButton setBackgroundImage:[UIImage imageNamed:@"buttonOff.png"] forState:UIControlStateNormal];
            [usernameSaveButton setTitleColor:customDarkBlue forState:UIControlStateNormal];
        }
        else{
            [passwordSaveButton setBackgroundImage:[UIImage imageNamed:@"buttonOff.png"] forState:UIControlStateNormal];
            [passwordSaveButton setTitleColor:customDarkBlue forState:UIControlStateNormal];
        }
        
    }
    count++;
    NSUserDefaults *countDefault = [NSUserDefaults standardUserDefaults];
    [countDefault setInteger:count forKey:countString];
    
}


-(void)setup {
    
    customDarkBlue = [UIColor colorWithRed:50.0f/255 green:79.0f/255 blue:133.0f/255 alpha:1.0f];
    
    NSInteger countUsername = [[NSUserDefaults standardUserDefaults]
                               integerForKey:@"countUsername"];
    if(!countUsername) {
        NSUserDefaults *countDefault = [NSUserDefaults standardUserDefaults];
        [countDefault setInteger:0 forKey:@"countUsername"];
    }
    
    NSInteger countPassword = [[NSUserDefaults standardUserDefaults]
                               integerForKey:@"countPassword"];
    if(!countPassword) {
        NSUserDefaults *countDefault = [NSUserDefaults standardUserDefaults];
        [countDefault setInteger:0 forKey:@"countPassword"];
    }
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [usernameTextField resignFirstResponder];
    [passwordTextField resignFirstResponder];
    return YES;
}

-(void)viewWillAppear:(BOOL)animated {
    
    [self loadSavedCredentials:@"username"];
    [self loadSavedCredentials:@"password"];
}

-(void)reload{
    
    [self loadSavedCredentials:@"username"];
    [self loadSavedCredentials:@"password"];
}


-(void)loadSavedCredentials: (NSString*)field {
    NSString *usernameDefault = [[NSUserDefaults standardUserDefaults] stringForKey:field];
    if(usernameDefault) {
        
        if([field isEqualToString:@"username"]) {
            usernameTextField.text = usernameDefault;
            [usernameSaveButton setBackgroundImage:[UIImage imageNamed:@"buttonOn.png"] forState:UIControlStateNormal];
            [usernameSaveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        else {
            passwordTextField.text = usernameDefault;
            [passwordSaveButton setBackgroundImage:[UIImage imageNamed:@"buttonOn.png"] forState:UIControlStateNormal];
            [passwordSaveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
    }
    else {
        
        if([field isEqualToString:@"username"]) {
            usernameTextField.text = @"";
            [usernameSaveButton setBackgroundImage:[UIImage imageNamed:@"buttonOff.png"] forState:UIControlStateNormal];
            [usernameSaveButton setTitleColor:customDarkBlue forState:UIControlStateNormal];
        }
        else {
            passwordTextField.text = @"";
            [passwordSaveButton setBackgroundImage:[UIImage imageNamed:@"buttonOff.png"] forState:UIControlStateNormal];
            [passwordSaveButton setTitleColor:customDarkBlue forState:UIControlStateNormal];
        }
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
