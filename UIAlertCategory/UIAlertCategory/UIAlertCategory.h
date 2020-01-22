//
//  UIAlertCategory.h
//
//  Created by Haider Shahzad on 22/12/2019.
//  Copyright © 2019 Muhammad Anum. All rights reserved.
//

@import UIKit;
@import Foundation;

/**
 An enumeration for the kinds of actions that can be created
 - ALERT_BUTTON_OK: A normal action
 - ALERT_BUTTON_CANCEL: An action that indicates to the user that the current process wil be cancelled
 - ALERT_BUTTON_OTHER: A normal action other than ALERT_BUTTON_OK
 - ALERT_BUTTON_DESTRUCTIVE: An action indicates to the user that an irreversible process is about to happen.
 */

typedef NS_ENUM(NSInteger, ButtonType)
{
    /**
     A normal action
     */
    ALERT_BUTTON_OK,
    
    /**
     An action that indicates to the user that the current process wil be cancelled
     */
    ALERT_BUTTON_CANCEL,
    
    /**
     A normal action other than ALERT_BUTTON_OK
     */
    ALERT_BUTTON_OTHER,
    
    /**
     An action indicates to the user that an irreversible process is about to happen.
     */
    ALERT_BUTTON_DESTRUCTIVE
};

@interface UIAlertCategory : NSObject

/** Unique identifier for alert messages */
@property (readonly) NSInteger ID;

/** The title of the alert. Use this string to get the user’s attention and communicate the reason for the alert.*/
@property NSString *title;

/** Descriptive text that provides additional details about the reason for the alert.*/
@property NSString *message;

/** The style to use when presenting the alert controller. Use this parameter to configure the alert controller as an action sheet or as a modal alert. */
@property UIAlertControllerStyle style;

/**
 Creates view controller for displaying an alert to the user.
 @param type     The type of action add to the alert. ALERT_BUTTON_OK | ALERT_BUTTON_CANCEL| ALERT_BUTTON_OTHER
 @param title    The title for the alert action.
 @param handler  The block to be executed when the user interacts with the action.
 */
- (void)addButton:(ButtonType)type WithTitle:(NSString *)title WithAction:(void (^)(void *action))handler;

/**
 Creates view controller for displaying an alert to the user.
 @param title    The title of the alert. Use this string to get the user’s attention and communicate the reason for the alert.
 @param msg      Descriptive text that provides additional details about the reason for the alert.
 @param style    The style to use when presenting the alert controller. Use this parameter to configure the alert controller as an action sheet or as a modal alert.
 */
+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)msg preferredStyle:(UIAlertControllerStyle)style;

/** Returns newly initialized alert controller.*/
- (void)show;


@end
