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
@synthesize password,username,usernameButton,passwordButton,detailView,loginButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setup];
	// Do any additional setup after loading the view, typically from a nib.
}

/*
-(IBAction)login:(id)sender {
    [self.view addSubview:detailView];
}

-(IBAction)goBackToLogin:(id)sender {
    NSString *usernameDefault = [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
    if(usernameDefault) {
        username.text = usernameDefault;
    }
    else {
        username.text = @"";
    }
    [detailView removeFromSuperview];
}
*/
-(IBAction)save:(id)sender {
    
    NSInteger count = [[NSUserDefaults standardUserDefaults]
                       integerForKey:@"count"];
    if(!(count%2)) {
        NSUserDefaults *usernameDefault = [NSUserDefaults standardUserDefaults];
        [usernameDefault setObject:username.text forKey:@"username"];
        
        [usernameButton setBackgroundImage:[UIImage imageNamed:@"buttonOn.png"] forState:UIControlStateNormal];
        [usernameButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    else {
        NSUserDefaults *usernameDefault = [NSUserDefaults standardUserDefaults];
        [usernameDefault removeObjectForKey:@"username"];
        
        [usernameButton setBackgroundImage:[UIImage imageNamed:@"buttonOff.png"] forState:UIControlStateNormal];
        [usernameButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
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
        username.text = usernameDefault;
        [usernameButton setBackgroundImage:[UIImage imageNamed:@"buttonOn.png"] forState:UIControlStateNormal];
        [usernameButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    else {
        username.text = @"";
        [usernameButton setBackgroundImage:[UIImage imageNamed:@"buttonOff.png"] forState:UIControlStateNormal];
        [usernameButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
