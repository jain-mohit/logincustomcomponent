//
//  LoginControllerProgram.h
//  LoginCustomComponent
//
//  Created by Mohit Jain on 4/7/13.
//  Copyright (c) 2013 Mohit Jain. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoginCustomComponentViewController;

@interface LoginControllerProgram : UIViewController

@property (nonatomic,strong)LoginCustomComponentViewController *loginComponent;
@property (nonatomic,strong)IBOutlet UIView *detailView;


@end
