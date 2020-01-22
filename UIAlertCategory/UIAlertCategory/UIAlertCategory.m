//
//  UIAlertCategory.m
//
//  Created by Haider Shahzad on 22/12/2019.
//  Copyright © 2019 Muhammad Anum. All rights reserved.
//

#import "UIAlertCategory.h"

#pragma mark -

@interface MyButton : NSObject

@property (nonatomic,strong) NSString *title;
@property ButtonType type;
@property (nonatomic,strong) void (^actionHandler)(void *);

@end

@implementation MyButton

@end

#pragma mark -

@interface AlertManager : NSObject<UIAlertViewDelegate>

+(id)sharedManager;

+(NSInteger)nextIndex;

+(void)addMyAlertMessage:(UIAlertCategory *)msg;

+(void)removeMyAlertMessage:(UIAlertCategory *)msg;

@end


@implementation AlertManager
{
    NSInteger _nextMsgIndex;
    NSMutableDictionary *_msgs;
}

///
+(id)sharedManager
{
    static AlertManager *sharedSingletonAlert = nil;
    @synchronized(self)
    {
        if(sharedSingletonAlert == nil)
        {
            sharedSingletonAlert = [[AlertManager alloc] init];
        }
    }
    return sharedSingletonAlert;
}

///
-(id)init
{
    self = [super init];
    if (self != nil)
    {
        _msgs = [[NSMutableDictionary alloc] init];
        _nextMsgIndex = 0;
    }
    
    return self;
}

///
+(NSInteger)nextIndex
{
    AlertManager *m = [AlertManager sharedManager];
    
    NSInteger i = m->_nextMsgIndex;
    m->_nextMsgIndex++;
    return i;
}

///
+(void)addMyAlertMessage:(UIAlertCategory *)msg
{
    AlertManager *m = [AlertManager sharedManager];
    
    [m->_msgs setObject:msg forKey:[NSNumber numberWithInteger:msg.ID]];
}

///
+(void)removeMyAlertMessage:(UIAlertCategory *)msg
{
    AlertManager *m = [AlertManager sharedManager];
    
    NSNumber *index = [NSNumber numberWithInteger:msg.ID];
    
    [m->_msgs removeObjectForKey:index];
}

@end

#pragma mark -

@interface UIAlertCategory ()

@property (readonly) NSMutableArray *buttons;

@end

@implementation UIAlertCategory

///
-(id)init
{
    self = [super init];
    if (self != nil)
    {
        _buttons = [[NSMutableArray alloc] init];
        _title = @"";
        _message = @"";
        _ID = [AlertManager nextIndex];
    }
    
    return self;
}

///
- (id)copyWithZone:(NSZone *)zone
{
    UIAlertCategory *alertAction = [self.class new];
    alertAction.title   = self.title;
    alertAction.message = self.message;
    alertAction.style   = self.style;
    return alertAction;
}

///
-(id)initWithTitle:(NSString *)title message:(NSString *)msg preferredStyle:(UIAlertControllerStyle)style

{
    self = [super init];
    if (self != nil)
    {
        _buttons = [[NSMutableArray alloc] init];
        
        _title = title;
        _message = msg;
        _style = style;
        _ID = [AlertManager nextIndex];
    }
    
    return self;
}

///
+(instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)msg preferredStyle:(UIAlertControllerStyle)style {
    
    UIAlertCategory * alertController = [[UIAlertCategory alloc] initWithTitle:title
                                                                       message:msg
                                                                preferredStyle:style];
    
    return alertController;
}

///
-(void)addButton:(ButtonType)type WithTitle:(NSString *)title WithAction:(void (^)(void *action))handler
{
    MyButton *btn = [[MyButton alloc] init];
    
    btn.title = title;
    btn.type = type;
    btn.actionHandler = handler;
    
    [_buttons addObject:btn];
    
}

///
-(void)show
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:_title
                                                                             message:_message
                                                                      preferredStyle:_style];
    //[alertController.view setTintColor:[StyleManager mainColor]];
    [AlertManager addMyAlertMessage:self];
    
    for (MyButton *btn in _buttons)
    {
        UIAlertActionStyle style = UIAlertActionStyleDefault;
        
        if (btn.type == ALERT_BUTTON_CANCEL) style = UIAlertActionStyleCancel;
        if (btn.type == ALERT_BUTTON_DESTRUCTIVE) style = UIAlertActionStyleDestructive;
        
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:btn.title style:style handler:^(UIAlertAction *action) {
            if (btn.actionHandler == nil) {
                
            }else
                btn.actionHandler((__bridge void *)(action));
            [AlertManager removeMyAlertMessage:self];
        }];
        
        [alertController addAction:alertAction];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^(void){
#ifdef TARGET_IS_EXTENSION
        
#else
        UIViewController *top = [UIApplication sharedApplication].keyWindow.rootViewController;
        [top presentViewController:alertController animated:YES completion:nil];
#endif
    });
    
}




@end
