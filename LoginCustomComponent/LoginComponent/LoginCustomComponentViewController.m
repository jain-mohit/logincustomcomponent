//
//  LoginCustomComponentViewController.m
//
//  Created by Mohit Jain on 4/4/13.
//  Copyright (c) 2013 Mohit Jain. All rights reserved.
//

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
@synthesize keychain, username, password;

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

// Reloads settings from Keychain/NSUserdefaults
-(void)viewWillLayoutSubviews {
    [self loadSavedCredentials];
}


// This method is to save/unsave credentials in keychain/NSUserdefaults
// Keychain: To store username/password securely
// NSUserdefaults: To save the state of save button(s) in textfield (username and password)
-(void)save: (NSString*)field counter:(NSString*)countString {
    
    NSInteger count = [[NSUserDefaults standardUserDefaults]
                       integerForKey:countString];
    if(!(count%2)) {
        
        if([countString isEqualToString:@"countUsername"]) {
            [keychain setObject:usernameTextField.text forKey:(__bridge id)(kSecAttrAccount)];
        }
        else if([countString isEqualToString:@"countPassword"]) {
            [keychain setObject:passwordTextField.text forKey:(__bridge id)(kSecValueData)];
        }
        
        if([field isEqualToString:@"username"]) {
            [usernameSaveButton SET_BACKGROUND_TO_ONSTATE];
            [usernameSaveButton SET_WHITECOLOR];
        }
        else{
            [passwordSaveButton SET_BACKGROUND_TO_ONSTATE];
            [passwordSaveButton SET_WHITECOLOR];
        }
    }
    else {
        if([countString isEqualToString:@"countUsername"]) {
            [keychain removeObjectForKey:(__bridge NSString *)(kSecAttrAccount)];
        }
        else {
            [keychain removeObjectForKey:(__bridge NSString *)(kSecValueData)];
        }
        
        [self setButtonOff:field];
    }
    count++;
    NSUserDefaults *countDefault = [NSUserDefaults standardUserDefaults];
    [countDefault setInteger:count forKey:countString];
}


// Set the background of save button to 'off state'
-(void)setButtonOff: (NSString *)field {
    if([field isEqualToString:@"username"]) {
        [usernameSaveButton SET_BACKGROUND_TO_OFFSTATE];
        [usernameSaveButton SET_CUSTOMCOLOR];
    }
    else{
        [passwordSaveButton SET_BACKGROUND_TO_OFFSTATE];
        [passwordSaveButton SET_CUSTOMCOLOR];
    }
}

// This is to setup the secured keychain keys, counter for saved (or unsaved) credential info -
-(void)setup {
    
    keychain = [[KeychainItemWrapper alloc] initWithIdentifier:@"AppLogin" accessGroup:nil];
    [keychain setObject:(__bridge id)(kSecAttrAccessibleWhenUnlocked) forKey:(__bridge id)(kSecAttrAccessible)];
    
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

-(void)viewWillAppear:(BOOL)animated {
    [self loadSavedCredentials];
}

// This method is used to load the settings from the saved Keychain/NSUserdefaults
-(void)loadSavedCredentials {
    NSString *usernameDefault = [keychain objectForKey:(__bridge id)(kSecAttrAccount)];
    NSString *passwordDefault = [keychain objectForKey:(__bridge id)(kSecValueData)];
    
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
        passwordTextField.text = usernameDefault;
        [passwordSaveButton SET_BACKGROUND_TO_ONSTATE];
        [passwordSaveButton SET_WHITECOLOR];
    }
    else {
        passwordTextField.text = @"";
        [passwordSaveButton SET_BACKGROUND_TO_OFFSTATE];
        [passwordSaveButton SET_CUSTOMCOLOR];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
