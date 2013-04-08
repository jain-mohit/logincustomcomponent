//
//  LoginControllerProgram.m
//  LoginCustomComponent
//
//  Created by Mohit Jain on 4/7/13.
//  Copyright (c) 2013 Mohit Jain. All rights reserved.
//

#import "LoginControllerProgram.h"
#import "LoginCustom.h"
#import "LoginCustomComponentAppDelegate.h"

@interface LoginControllerProgram ()

@end

@implementation LoginControllerProgram
@synthesize login;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
    // Do any additional setup after loading the view from its nib.
}


-(void)setup {
    login = [[LoginCustom alloc]initWithFrame:CGRectMake(0, 0, 320, 578)];
    //login.backgroundColor = [UIColor redColor];
   [self.view addSubview:login.viewLogin];
    
  //  self.view = login;
    
//    LoginCustomComponentAppDelegate *app = (LoginCustomComponentAppDelegate*)[[UIApplication sharedApplication] delegate];
//    // Window bounds.
//    CGRect bounds = app.window.bounds;
//    UIView *viewl = [[UIView alloc] initWithFrame: bounds];
//    [viewl setBackgroundColor: [UIColor yellowColor]];
//    [self.view addSubview:viewl];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
