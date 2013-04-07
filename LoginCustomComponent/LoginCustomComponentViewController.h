//
//  LoginCustomComponentViewController.h
//  LoginCustomComponent
//
//  Created by Mohit Jain on 4/4/13.
//  Copyright (c) 2013 Mohit Jain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginCustomComponentViewController : UIViewController

@property(nonatomic,strong)IBOutlet UITextField *username;
@property(nonatomic,strong)IBOutlet UITextField *password;
@property(nonatomic,strong)IBOutlet UIButton *usernameButton;
@property(nonatomic,strong)IBOutlet UIButton *passwordButton;
@property(nonatomic,strong)IBOutlet UIView *detailView;
@property(nonatomic,strong)IBOutlet UIButton *login;



@end
