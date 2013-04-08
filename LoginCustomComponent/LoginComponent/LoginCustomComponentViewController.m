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


-(IBAction)save:(id)sender {
    
    NSInteger count = [[NSUserDefaults standardUserDefaults]
                       integerForKey:@"count"];
    if(!(count%2)) {
        NSUserDefaults *usernameDefault = [NSUserDefaults standardUserDefaults];
        [usernameDefault setObject:usernameTextField.text forKey:@"username"];
        
        [usernameSaveButton setBackgroundImage:[UIImage imageNamed:@"buttonOn.png"] forState:UIControlStateNormal];
        [usernameSaveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    else {
        NSUserDefaults *usernameDefault = [NSUserDefaults standardUserDefaults];
        [usernameDefault removeObjectForKey:@"username"];
        
        [usernameSaveButton setBackgroundImage:[UIImage imageNamed:@"buttonOff.png"] forState:UIControlStateNormal];
        [usernameSaveButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
    }
    count++;
    NSUserDefaults *countDefault = [NSUserDefaults standardUserDefaults];
    [countDefault setInteger:count forKey:@"count"];
    
}

-(void)setup {
    
    NSInteger count = [[NSUserDefaults standardUserDefaults]
                       integerForKey:@"count"];
    if(count) {

        
    } else {
        NSUserDefaults *countDefault = [NSUserDefaults standardUserDefaults];
        [countDefault setInteger:0 forKey:@"count"];
    }
    
}


-(void)viewWillAppear:(BOOL)animated {
    
    NSString *usernameDefault = [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
    if(usernameDefault) {
        usernameTextField.text = usernameDefault;
        [usernameSaveButton setBackgroundImage:[UIImage imageNamed:@"buttonOn.png"] forState:UIControlStateNormal];
        [usernameSaveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    else {
        usernameTextField.text = @"";
        [usernameSaveButton setBackgroundImage:[UIImage imageNamed:@"buttonOff.png"] forState:UIControlStateNormal];
        [usernameSaveButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
