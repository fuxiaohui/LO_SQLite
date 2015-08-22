//
//  LO_SQLiteManager.h
//  LO_SQLite
//
//  Created by fuxiaohui on 15/8/18.
//  Copyright (c) 2015年 Henan Lanou Technology Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LO_SQLiteManager : NSObject

/**
 *  单例方法
 */
+ (LO_SQLiteManager *)sharedManager;

/**
 *  打开数据库
 */
- (void)open;

/**
 *  关闭数据库
 */
- (void)close;

/**
 *  创建表
 */
- (void)create;

/**
 *  插入数据
 */
- (void)insert;

/**
 *  更新数据
 */
- (void)update;

/**
 *  删除数据
 */
- (void)deleteData;

/**
 *  查询数据
 */
- (void)select;

@end
