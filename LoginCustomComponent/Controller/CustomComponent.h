//
//  CustomComponent.h
//  LoginCustomComponent
//
//  Created by Mohit Jain on 5/11/13.
//  Copyright (c) 2013 Mohit Jain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KeychainItemWrapper.h"

@interface CustomComponent : UIView <UITextFieldDelegate> {
    UIColor *customDarkBlue;
}

@property(nonatomic,strong)IBOutlet UIView *customView;

@property(nonatomic,strong)IBOutlet UITextField *usernameTextField;
@property(nonatomic,strong)IBOutlet UITextField *passwordTextField;
@property(nonatomic,strong)IBOutlet UIButton *usernameSaveButton;
@property(nonatomic,strong)IBOutlet UIButton *passwordSaveButton;
@property(nonatomic,strong)IBOutlet UIView *detailView;
@property(nonatomic,strong)IBOutlet UIButton *loginButton;
@property(nonatomic,strong)IBOutlet UIButton *rememberMeButton;
@property(nonatomic,strong)IBOutlet UILabel *errorMessage;
@property(nonatomic,strong)IBOutlet UILabel *rememberMeLabel;
@property(nonatomic, strong)KeychainItemWrapper *keychainForModeRememberMe;
@property(nonatomic, strong)KeychainItemWrapper *keychainForModeSaveIndividualCredentials;
@property(nonatomic, retain)NSString *username;
@property(nonatomic, retain)NSString *password;
@property(nonatomic, retain)NSString *mode;

@end