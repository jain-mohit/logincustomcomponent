//
//  LoginCustom.m
//  LoginCustomComponent
//
//  Created by Mohit Jain on 4/6/13.
//  Copyright (c) 2013 Mohit Jain. All rights reserved.
//

#import "LoginCustom.h"
#import "LoginCustomComponentAppDelegate.h"

@implementation LoginCustom
@synthesize viewLogin;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self createView];
    }
    return self;
}

//-(id)initWithCoder:(NSCoder *)aDecoder {
//    LoginCustomComponentAppDelegate *app = (LoginCustomComponentAppDelegate*)[[UIApplication sharedApplication] delegate];
//    // Window bounds.
//    CGRect bounds = app.window.bounds;
//    
//    // Create a view and add it to the window.
//    viewLogin = [[UIView alloc] initWithFrame: bounds];
//    [viewLogin setBackgroundColor: [UIColor yellowColor]];
//    return self;
//}

-(void)createView {
    LoginCustomComponentAppDelegate *app = (LoginCustomComponentAppDelegate*)[[UIApplication sharedApplication] delegate];
    // Window bounds.
    CGRect bounds = app.window.bounds;
    
    // Create a view and add it to the window.
    viewLogin = [[UIView alloc] initWithFrame: bounds];
    [viewLogin setBackgroundColor: [UIColor yellowColor]];
    CGRect usernameRect = CGRectMake(36, 143, 249, 30);
    [self createTextField:&usernameRect];
    
    CGRect passwordRect = CGRectMake(36, 189, 249, 30);
    [self createTextField:&passwordRect];
    
    
}


-(void)createButton:(CGRect *)rect {
    CGRect myRect = *rect;
    
}

-(void)createTextField:(CGRect *)rect {
    
    CGRect myRect = *rect;
    UITextField *username = [ [UITextField alloc ] initWithFrame:myRect];
   
    username.textColor = [UIColor whiteColor];
    username.backgroundColor = [UIColor whiteColor];
    username.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(36.0)];
    [viewLogin addSubview:username];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
