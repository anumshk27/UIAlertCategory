
![image](https://pasteboard.co/IR8dPAQ.png)
![image](https://www.dropbox.com/s/cw26v1ugwiyomcf/Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202020-01-22%20at%2014.48.02.png?dl=0)
![image](https://www.dropbox.com/s/mwxpeqnw01dbo52/Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202020-01-22%20at%2014.48.07.png?dl=0)

### Requirements

1. Xcode 10.0 or above
2. Objective-C
3. Development Target 9.0 or above
4. Device Universal Supported

### Usage

1. Copy UIAlertCategory Folder to your project. Make sure to select Copy items when asked if you extracted the code archive outside of your project.<br>
2. #import "UIAlertCategory.h", where required and call the required method to present your alert".<br>
3. Check the demo application for usage. The API is just like UIAlertController.

```objective-c

    NSString *title = @"Location services are off";
    NSString *message = @"The device was unable to locate you.";

    UIAlertCategory * alert = [UIAlertCategory alertControllerWithTitle:title
                                                                message:message
                                                         preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addButton:ALERT_BUTTON_OK WithTitle:@"BUTTON_OK" WithAction:^(void *action) {
        
    }];
    [alert addButton:ALERT_BUTTON_CANCEL WithTitle:@"BUTTON_CANCEL" WithAction:^(void *action) {
        
    }];
    
    [alert show];

```

### Helpful!!

If this help you in anyway please let me know.



