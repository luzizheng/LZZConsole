//
//  LZZConsole.h
//  LZZConsoleDemo
//
//  Created by 玩车tv on 2019/6/20.
//  Copyright © 2019 玩车tv. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZZConsole : NSObject
+(LZZConsole*)shareConsole;
/**
 * set YES in methor didFinishLaunchingWithOptions for installation
 */
@property(nonatomic,assign)BOOL enable;

/**
 * open console window in your app anywhere
 */
-(void)openConsoleWindow;
/**
 * close the console window in app which called out
 */
-(void)closeWindow;
/**
 * return log string in console
 */
-(NSString *)getLog;

/**
 * set inner log string nil
 */
-(void)clearLog;



@end

NS_ASSUME_NONNULL_END
