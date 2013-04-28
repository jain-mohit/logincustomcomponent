//
//  LoginCustomComponentViewController.m
//
//  Created by Mohit Jain on 4/4/13.

/*
 Copyright (c) 2013 Mohit Jain. All rights reserved.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
*/


#import "LoginCustomComponentViewController.h"
#define SET_BACKGROUND_TO_ONSTATE setBackgroundImage:[UIImage imageNamed:@"buttonOn.png"] forState:UIControlStateNormal
#define SET_BACKGROUND_TO_OFFSTATE setBackgroundImage:[UIImage imageNamed:@"buttonOff.png"] forState:UIControlStateNormal
#define SET_WHITECOLOR setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal
#define SET_CUSTOMCOLOR setTitleColor:[UIColor colorWithRed:50.0f/255 green:79.0f/255 blue:133.0f/255 alpha:1.0f] forState:UIControlStateNormal

@interface LoginCustomComponentViewController ()


@end

@implementation LoginCustomComponentViewController
@synthesize passwordSaveButton,usernameSaveButton,usernameTextField,passwordTextField,detailView;
@synthesize errorMessage, loginButton;
@synthesize keychainForModeRememberMe, keychainForModeSaveIndividualCredentials, username, password,mode, rememberMeLabel, rememberMeButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // By default mode = 1
    if(!mode) {
        mode = @"1";
    }
    
    // Remember me mode = 1
    if([mode isEqualToString:@"1"])
    {
        [self setupForRememberMe];
        [usernameSaveButton removeFromSuperview];
        [passwordSaveButton removeFromSuperview];
        // Reloads settings from Keychain/NSUserdefaults
        [self loadSavedCredentialsForRememberMe];
    }
     // Save individual credentials mode = 2
    else {
       [self setupForSaveIndividualCredential];
        [rememberMeLabel removeFromSuperview];
        [rememberMeButton removeFromSuperview];
        // Reloads settings from Keychain/NSUserdefaults
        [self loadSavedCredentials];
    }
}

// This method is to save/unsave username in keychain/NSUserdefaults
// Keychain: To store username/password securely
// NSUserdefaults: To save the state of save button in username textfield
-(IBAction)saveUsername:(id)sender {
    NSInteger count = [[NSUserDefaults standardUserDefaults]
                       integerForKey:@"countUsername"];
    if(!(count%2))
    {
     [keychainForModeSaveIndividualCredentials setObject:usernameTextField.text forKey:(__bridge id)(kSecAttrAccount)];
     [usernameSaveButton SET_BACKGROUND_TO_ONSTATE];
     [usernameSaveButton SET_WHITECOLOR];
    }
    else {
        [keychainForModeSaveIndividualCredentials removeObjectForKey:(__bridge NSString *)(kSecAttrAccount)];
        
        // Set the background of save button to 'off state'
        [usernameSaveButton SET_BACKGROUND_TO_OFFSTATE];
        [usernameSaveButton SET_CUSTOMCOLOR];
    }
    count++;
    NSUserDefaults *countDefault = [NSUserDefaults standardUserDefaults];
    [countDefault setInteger:count forKey:@"countUsername"];
}

// This method is to save/unsave password in keychain/NSUserdefaults
// Keychain: To store username/password securely
// NSUserdefaults: To save the state of save button in password textfield
-(IBAction)savePassword:(id)sender {
    NSInteger count = [[NSUserDefaults standardUserDefaults]
                       integerForKey:@"countPassword"];
    if(!(count%2))
    {
    [keychainForModeRememberMe setObject:passwordTextField.text forKey:(__bridge id)(kSecValueData)];
    [passwordSaveButton SET_BACKGROUND_TO_ONSTATE];
    [passwordSaveButton SET_WHITECOLOR];
    }
    else {
        [keychainForModeRememberMe removeObjectForKey:(__bridge NSString *)(kSecValueData)];
        
        // Set the background of save button to 'off state'
        [passwordSaveButton SET_BACKGROUND_TO_OFFSTATE];
        [passwordSaveButton SET_CUSTOMCOLOR];
    }
    
    count++;
    NSUserDefaults *countDefault = [NSUserDefaults standardUserDefaults];
    [countDefault setInteger:count forKey:@"countPassword"];
}


-(IBAction)saveCredentials:(id)sender {
    NSInteger count = [[NSUserDefaults standardUserDefaults]
                       integerForKey:@"countRemember"];
    if(!(count%2))
    {
        [keychainForModeRememberMe setObject:usernameTextField.text forKey:(__bridge id)(kSecAttrAccount)];
        [keychainForModeRememberMe setObject:passwordTextField.text forKey:(__bridge id)(kSecValueData)];
        
        // Set the rememberMe button to 'ON state'
        [rememberMeButton setBackgroundImage:[UIImage imageNamed:@"checkbox_ON"] forState:UIControlStateNormal];
    }
    else {
        [keychainForModeRememberMe removeObjectForKey:(__bridge NSString *)(kSecAttrAccount)];
        [keychainForModeRememberMe removeObjectForKey:(__bridge NSString *)(kSecValueData)];
        
        // Set the rememberMe button to 'off state'
        [rememberMeButton setBackgroundImage:[UIImage imageNamed:@"checkbox_OFF"] forState:UIControlStateNormal];
    }
    count++;
    NSUserDefaults *countDefault = [NSUserDefaults standardUserDefaults];
    [countDefault setInteger:count forKey:@"countRemember"];
}


-(void)setupForRememberMe {
    
    // The identifier should be unique per keychain item. The access group can be nil unless you want to share this keychain item among multiple apps
    keychainForModeRememberMe = [[KeychainItemWrapper alloc] initWithIdentifier:@"RememberMe" accessGroup:nil];
    [keychainForModeRememberMe setObject:(__bridge id)(kSecAttrAccessibleWhenUnlocked) forKey:(__bridge id)(kSecAttrAccessible)];
    
    // If standard default for key 'countRemember' does not exist then create it.
    if(!([[NSUserDefaults standardUserDefaults]
          integerForKey:@"countRemember"])) {
        NSUserDefaults *countDefault = [NSUserDefaults standardUserDefaults];
        [countDefault setInteger:0 forKey:@"countRemember"];
    }
    
}

// This is to setup the secured keychain keys, counter for saved (or unsaved) credential info -
-(void)setupForSaveIndividualCredential {
    
    // The identifier should be unique per keychain item. The access group can be nil unless you want to share this keychain item among multiple apps 
    keychainForModeSaveIndividualCredentials = [[KeychainItemWrapper alloc] initWithIdentifier:@"AppLogin" accessGroup:nil];
    [keychainForModeSaveIndividualCredentials setObject:(__bridge id)(kSecAttrAccessibleWhenUnlocked) forKey:(__bridge id)(kSecAttrAccessible)];
    
    // If standard default for key 'counterUsername' does not exist then create it.
    if(!([[NSUserDefaults standardUserDefaults]
          integerForKey:@"countUsername"])) {
        NSUserDefaults *countDefault = [NSUserDefaults standardUserDefaults];
        [countDefault setInteger:0 forKey:@"countUsername"];
    }
    
    // If standard default for key 'counterPassword' does not exist then create it.
    if(!([[NSUserDefaults standardUserDefaults]
          integerForKey:@"countPassword"])) {
        NSUserDefaults *countDefault = [NSUserDefaults standardUserDefaults];
        [countDefault setInteger:0 forKey:@"countPassword"];
    }
}


// Method will hide the keyboard when return key is pressed
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [usernameTextField resignFirstResponder];
    [passwordTextField resignFirstResponder];
    return YES;
}

// This method is used to load the settings from the saved Keychain/NSUserdefaults
-(void)loadSavedCredentials {
    NSString *usernameDefault = [keychainForModeSaveIndividualCredentials objectForKey:(__bridge id)(kSecAttrAccount)];
    NSString *passwordDefault = [keychainForModeSaveIndividualCredentials objectForKey:(__bridge id)(kSecValueData)];
    
    // If username defaults exists in keychain then load otherwise load blank
    if(![usernameDefault isEqualToString:@""]) {
        usernameTextField.text = usernameDefault;
        [usernameSaveButton SET_BACKGROUND_TO_ONSTATE];
        [usernameSaveButton SET_WHITECOLOR];
    }
    else {
        usernameTextField.text = @"";
        [usernameSaveButton SET_BACKGROUND_TO_OFFSTATE];
        [usernameSaveButton SET_CUSTOMCOLOR];
    }
    
    // If password defaults exists in keychain then load otherwise set it to empty string and button to off state
    if(![passwordDefault isEqualToString:@""]) {
        passwordTextField.text = passwordDefault;
        [passwordSaveButton SET_BACKGROUND_TO_ONSTATE];
        [passwordSaveButton SET_WHITECOLOR];
    }
    else {
        passwordTextField.text = @"";
        [passwordSaveButton SET_BACKGROUND_TO_OFFSTATE];
        [passwordSaveButton SET_CUSTOMCOLOR];
    }
}


// This method is used to load the settings from the saved Keychain/NSUserdefaults
-(void)loadSavedCredentialsForRememberMe {
    NSString *usernameDefault = [keychainForModeRememberMe objectForKey:(__bridge id)(kSecAttrAccount)];
    NSString *passwordDefault = [keychainForModeRememberMe objectForKey:(__bridge id)(kSecValueData)];
    
    // If username defaults and password defaults exists in keychain then load otherwise load blank
    if((![usernameDefault isEqualToString:@""]) && (![passwordDefault isEqualToString:@""])) {
        usernameTextField.text = usernameDefault;
         passwordTextField.text = passwordDefault;
        [rememberMeButton setBackgroundImage:[UIImage imageNamed:@"checkbox_ON"] forState:UIControlStateNormal];
    }
    else {
        usernameTextField.text = @"";
        passwordTextField.text = @"";
        [rememberMeButton setBackgroundImage:[UIImage imageNamed:@"checkbox_OFF"] forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
