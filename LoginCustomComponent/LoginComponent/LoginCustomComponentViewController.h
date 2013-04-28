//
//  LoginCustomComponentViewController.h

//  Created by Mohit Jain on 4/4/13.

/*
 Copyright (c) 2013 Mohit Jain. All rights reserved.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

#import <UIKit/UIKit.h>
#import "KeychainItemWrapper.h"

@interface LoginCustomComponentViewController : UIViewController <UITextFieldDelegate> {
    UIColor *customDarkBlue;
   
}

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
