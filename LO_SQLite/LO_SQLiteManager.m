//
//  LO_SQLiteManager.m
//  LO_SQLite
//
//  Created by fuxiaohui on 15/8/18.
//  Copyright (c) 2015年 Henan Lanou Technology Co. Ltd. All rights reserved.
//

#import "LO_SQLiteManager.h"
#import <sqlite3.h>
#import <UIKit/UIKit.h>

@interface LO_SQLiteManager () {
    sqlite3 *db;
}

@end

@implementation LO_SQLiteManager

+ (LO_SQLiteManager *)sharedManager {
    static LO_SQLiteManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[LO_SQLiteManager alloc] init];
    });
    return manager;
}

- (void)open {
    //document路径
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    //sqlite路径
    NSString *sqlitePath = [documentPath stringByAppendingPathComponent:@"database.sqlite"];
    //打开数据库
    int result = sqlite3_open(sqlitePath.UTF8String, &db);
    //判断数据库打开是否成功
    if (result == SQLITE_OK) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"数据库执行结果" message:@"打开成功" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alertView show];
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"数据库执行结果" message:@"打开失败" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alertView show];
    }
}

- (void)close {
    //关闭数据库
    int result = sqlite3_close(db);
    //判断结果
    if (result == SQLITE_OK) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"数据库执行结果" message:@"关闭成功" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alertView show];
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"数据库执行结果" message:@"关闭失败" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alertView show];
    }
}

- (void)create {
    //sql语句
    NSString *sqlString = @"create table Person (id integer primary key, name text, age integer)";
    //执行sql语句
    char *error = nil;
    sqlite3_exec(db, sqlString.UTF8String, nil, nil, &error);
    //判断是否出现了错误
    if (error == nil) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"数据库执行结果" message:@"创建表成功" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alertView show];
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"数据库执行结果" message:@"创建表失败" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alertView show];
    }
}

- (void)insert {
    //sql语句
    NSString *sqlString = @"insert into Person ('name', 'age') values ('张三', 18)";
    //执行sql语句
    char *error = nil;
    sqlite3_exec(db, sqlString.UTF8String, nil, nil, &error);
    //判断结果
    if (error == nil) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"数据库执行结果" message:@"插入成功" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alertView show];
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"数据库执行结果" message:@"插入失败" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alertView show];
    }
}

- (void)update {
    //sql语句
    NSString *sqlString = @"update Person set 'name' = '李四' where id = 1";
    //执行sql语句
    char *error = nil;
    sqlite3_exec(db, sqlString.UTF8String, nil, nil, &error);
    //判断结果
    if (error == nil) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"数据库执行结果" message:@"更新成功" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alertView show];
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"数据库执行结果" message:@"更新失败" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alertView show];
    }
}

- (void)deleteData {
    //sql语句
    NSString *sqlString = @"delete from Person where id = 1";
    //执行sql语句
    char *error = nil;
    sqlite3_exec(db, sqlString.UTF8String, nil, nil, &error);
    //判断结果
    if (error == nil) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"数据库执行结果" message:@"删除成功" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alertView show];
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"数据库执行结果" message:@"删除失败" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alertView show];
    }

}

- (void)select {
    //sql语句
    NSString *sqlString = @"select * from Person";
    //准备sql语句
    sqlite3_stmt *stmt = nil;
    sqlite3_prepare(db, sqlString.UTF8String, -1, &stmt, nil);
    //单步执行语句
    while (sqlite3_step(stmt) == SQLITE_ROW) {
        int ID = sqlite3_column_int(stmt, 0);
        const unsigned char *name = sqlite3_column_text(stmt, 1);
        NSString *nameString = [NSString stringWithUTF8String:(const char *)name];
        int age = sqlite3_column_int(stmt, 2);
        NSLog(@"id:%d, name:%@, age:%d", ID, nameString, age);
    }
    //释放
    sqlite3_finalize(stmt);
}

@end






