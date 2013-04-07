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
    }
    return self;
}

-(void)createView {
    LoginCustomComponentAppDelegate *app = (LoginCustomComponentAppDelegate*)[[UIApplication sharedApplication] delegate];
    // Window bounds.
    CGRect bounds = app.window.bounds;
    
    // Create a view and add it to the window.
    UIView* view = [[UIView alloc] initWithFrame: bounds];
    [view setBackgroundColor: [UIColor yellowColor]];
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
