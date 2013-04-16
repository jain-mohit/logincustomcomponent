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

// Reloads settings from NSUserdefaults 
-(void)viewWillLayoutSubviews {
    [self loadSavedCredentials];
}

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

-(void)setButtonOff: (NSString *)field {
    if([field isEqualToString:@"username"]) {
        [usernameSaveButton setBackgroundImage:[UIImage imageNamed:@"buttonOff.png"] forState:UIControlStateNormal];
        [usernameSaveButton setTitleColor:customDarkBlue forState:UIControlStateNormal];
    }
    else{
        [passwordSaveButton setBackgroundImage:[UIImage imageNamed:@"buttonOff.png"] forState:UIControlStateNormal];
        [passwordSaveButton setTitleColor:customDarkBlue forState:UIControlStateNormal];
    }
}

// This is to setup the userdefault keys -
-(void)setup {
    
    keychain = [[KeychainItemWrapper alloc] initWithIdentifier:@"AppLogin" accessGroup:nil];
    [keychain setObject:(__bridge id)(kSecAttrAccessibleWhenUnlocked) forKey:(__bridge id)(kSecAttrAccessible)];

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


// Method will hide the keyboard when return key is pressed
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [usernameTextField resignFirstResponder];
    [passwordTextField resignFirstResponder];
    return YES;
}

-(void)viewWillAppear:(BOOL)animated {
    [self loadSavedCredentials];
}

// This method is used to load the settings from the saved NSUserdefaults
-(void)loadSavedCredentials {
    NSString *usernameDefault = [keychain objectForKey:(__bridge id)(kSecAttrAccount)];
    NSString *passwordDefault = [keychain objectForKey:(__bridge id)(kSecValueData)];
    
    // If username defaults exists in keychain then load otherwise load blank
    if(![usernameDefault isEqualToString:@""]) {
        usernameTextField.text = usernameDefault;
        [usernameSaveButton setBackgroundImage:[UIImage imageNamed:@"buttonOn.png"] forState:UIControlStateNormal];
        [usernameSaveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    else {
        usernameTextField.text = @"";
        [usernameSaveButton setBackgroundImage:[UIImage imageNamed:@"buttonOff.png"] forState:UIControlStateNormal];
        [usernameSaveButton setTitleColor:customDarkBlue forState:UIControlStateNormal];
    }
    
    // If password defaults exists in keychain then load otherwise load blank
    if(![passwordDefault isEqualToString:@""]) {
        passwordTextField.text = usernameDefault;
        [passwordSaveButton setBackgroundImage:[UIImage imageNamed:@"buttonOn.png"] forState:UIControlStateNormal];
        [passwordSaveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    else {
        passwordTextField.text = @"";
        [passwordSaveButton setBackgroundImage:[UIImage imageNamed:@"buttonOff.png"] forState:UIControlStateNormal];
        [passwordSaveButton setTitleColor:customDarkBlue forState:UIControlStateNormal];
    }


}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
