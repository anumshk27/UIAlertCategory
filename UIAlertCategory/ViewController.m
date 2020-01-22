//
//  ViewController.m
//  UIAlertCategory
//
//  Created by Haider Shahzad on 22/01/2020.
//  Copyright © 2020 Haider Shahzad. All rights reserved.
//

#import "ViewController.h"
#import "UIAlertCategory.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

-(IBAction)alertExample1:(id)sender {
    
    NSString *message = @"The device was unable to locate you.\nPlease make sure that location services are Turn On in your device Privacy Settings";
    
    UIAlertCategory * alert = [UIAlertCategory alertControllerWithTitle:@"Location services are off"
                                                                message:message
                                                         preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addButton:ALERT_BUTTON_OK WithTitle:@"BUTTON_OK" WithAction:^(void *action) {
        
    }];
    [alert addButton:ALERT_BUTTON_CANCEL WithTitle:@"BUTTON_CANCEL" WithAction:^(void *action) {
        
    }];
    
    [alert show];
    
}

-(IBAction)alertExample2:(id)sender {
    
    NSString *message = @"The device was unable to locate you.\nPlease make sure that location services are Turn On in your device Privacy Settings";
    
    UIAlertCategory * alert = [UIAlertCategory alertControllerWithTitle:@"Location services are off"
                                                                message:message
                                                         preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addButton:ALERT_BUTTON_OK WithTitle:@"BUTTON_OK" WithAction:^(void *action) {
        
    }];
    [alert addButton:ALERT_BUTTON_CANCEL WithTitle:@"BUTTON_CANCEL" WithAction:^(void *action) {
        
    }];
    
    [alert addButton:ALERT_BUTTON_DESTRUCTIVE WithTitle:@"ALERT_BUTTON_DESTRUCTIVE" WithAction:^(void *action) {
        
    }];
    
    [alert show];
    
}

-(IBAction)alertExample3:(id)sender {
    
    NSString *message = @"The device was unable to locate you.\nPlease make sure that location services are Turn On in your device Privacy Settings";
    
    UIAlertCategory * alert = [UIAlertCategory alertControllerWithTitle:@"Location services are off"
                                                                message:message
                                                         preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addButton:ALERT_BUTTON_OK WithTitle:@"BUTTON_OK" WithAction:^(void *action) {
        
    }];
    [alert addButton:ALERT_BUTTON_CANCEL WithTitle:@"BUTTON_CANCEL" WithAction:^(void *action) {
        
    }];
    
    [alert addButton:ALERT_BUTTON_OTHER WithTitle:@"BUTTON_OTHER_1" WithAction:^(void *action) {
        
    }];
    
    [alert addButton:ALERT_BUTTON_OTHER WithTitle:@"BUTTON_OTHER_2" WithAction:^(void *action) {
        
    }];
    
    [alert addButton:ALERT_BUTTON_OTHER WithTitle:@"BUTTON_OTHER_3" WithAction:^(void *action) {
        
    }];
    
    
    [alert show];
    
}

/*
 [alert addButton:ALERT_BUTTON_OTHER WithTitle:@"ALERT_BUTTON_OTHER" WithAction:^(void *action) {
 
 }];
 [alert addButton:ALERT_BUTTON_DESTRUCTIVE WithTitle:@"ALERT_BUTTON_DESTRUCTIVE" WithAction:^(void *action) {
 
 }];
 */

@end
