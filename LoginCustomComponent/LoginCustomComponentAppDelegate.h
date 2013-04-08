//
//  LoginCustomComponentAppDelegate.h
//  LoginCustomComponent
//
//  Created by Mohit Jain on 4/4/13.
//  Copyright (c) 2013 Mohit Jain. All rights reserved.
//

#import <UIKit/UIKit.h>


@class LoginControllerProgram;

@interface LoginCustomComponentAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) LoginControllerProgram *viewController;

@end
