//
//  LZZConsole.m
//  LZZConsoleDemo
//
//  Created by 玩车tv on 2019/6/20.
//  Copyright © 2019 玩车tv. All rights reserved.
//

#import "LZZConsole.h"
#import "UIViewController+ConsoleUtils.h"
#import "LZZDubugLogVC.h"

@interface LZZConsole()

@property(nonatomic,copy)NSString * log;
@property(nonatomic,strong)UIWindow * logWindow;

@end

@implementation LZZConsole
{
    dispatch_source_t _source;
}
static LZZConsole *sharedInstance = nil;
+(LZZConsole*)shareConsole
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[super allocWithZone:NULL] init];
    });
    return sharedInstance;
}
+ (id)allocWithZone:(NSZone *)zone
{
    return [self shareConsole];
}
- (id)copyWithZone:(NSZone *)zone
{
    return self;
}


-(void)setEnable:(BOOL)enable
{
    _enable = enable;
    if (enable) {
        [self readingConsoleLog];
    }else{
        if (_source) {
            dispatch_source_cancel(_source);
            _source = nil;
        }
    }
}

-(void)readingConsoleLog
{
    if (_source) {
        dispatch_source_cancel(_source);
        _source = nil;
    }
    int fildes[2];
    int fd = STDERR_FILENO;
    pipe(fildes);  // [0] is read end of pipe while [1] is write end
    dup2(fildes[1], fd);  // Duplicate write end of pipe "onto" fd (this closes fd)
    close(fildes[1]);  // Close original write end of pipe
    fd = fildes[0];  // We can now monitor the read end of the pipe
    
    char* buffer = malloc(1024);
    NSMutableData* data = [[NSMutableData alloc] init];
    fcntl(fd, F_SETFL, O_NONBLOCK);
    _source = dispatch_source_create(DISPATCH_SOURCE_TYPE_READ, fd, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0));
    dispatch_source_set_cancel_handler(_source, ^{
        free(buffer);
    });
    dispatch_source_set_event_handler(_source, ^{
        @autoreleasepool {
            
            while (self.enable) {
                ssize_t size = read(fd, buffer, 1024);
                if (size <= 0) {
                    break;
                }
                [data appendBytes:buffer length:size];
                if (size < 1024) {
                    break;
                }
            }
            self.log = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        }
    });
    dispatch_resume(_source);
}

-(void)openConsoleWindow
{
    if (_logWindow) {
        if (_logWindow.hidden==NO&&[_logWindow isKeyWindow]) {
            return;
        }
    }
    self.logWindow.rootViewController = [[LZZDubugLogVC alloc] init];
    [self.logWindow makeKeyAndVisible];
}
-(void)closeWindow
{
    self.logWindow.hidden = YES;
    [self.logWindow resignKeyWindow];
    self.logWindow = nil;
}
-(NSString *)getLog
{
    return [self.log copy];
}
-(void)clearLog
{
    self.log = @"";
}


-(UIWindow *)logWindow
{
    if (!_logWindow) {
        _logWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _logWindow.windowLevel = UIWindowLevelNormal;
    }
    return _logWindow;
}




@end
