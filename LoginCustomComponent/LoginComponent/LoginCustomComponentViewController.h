//
//  LoginCustomComponentViewController.h
//
//  Created by Mohit Jain on 4/4/13.
//  Copyright (c) 2013 Mohit Jain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginCustomComponentViewController : UIViewController <UITextFieldDelegate> {
    UIColor *customDarkBlue;
}

@property(nonatomic,strong)IBOutlet UITextField *usernameTextField;
@property(nonatomic,strong)IBOutlet UITextField *passwordTextField;
@property(nonatomic,strong)IBOutlet UIButton *usernameSaveButton;
@property(nonatomic,strong)IBOutlet UIButton *passwordSaveButton;
@property(nonatomic,strong)IBOutlet UIView *detailView;
@property(nonatomic,strong)IBOutlet UIButton *loginButton;


@end
