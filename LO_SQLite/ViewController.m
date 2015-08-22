//
//  ViewController.m
//  LO_SQLite
//
//  Created by fuxiaohui on 15/8/18.
//  Copyright (c) 2015年 Henan Lanou Technology Co. Ltd. All rights reserved.
//

#import "ViewController.h"
#import "LO_SQLiteManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)openDataBase:(id)sender {
    [[LO_SQLiteManager sharedManager] open];
}

- (IBAction)createTable:(id)sender {
    [[LO_SQLiteManager sharedManager] create];
}

- (IBAction)insertData:(id)sender {
    [[LO_SQLiteManager sharedManager] insert];
}

- (IBAction)updateData:(id)sender {
    [[LO_SQLiteManager sharedManager] update];
}

- (IBAction)selectData:(id)sender {
    [[LO_SQLiteManager sharedManager] select];
}

- (IBAction)deleteData:(id)sender {
    [[LO_SQLiteManager sharedManager] deleteData];
}

- (IBAction)closeDataBase:(id)sender {
    [[LO_SQLiteManager sharedManager] close];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //数据持久化的方式
    //1.文件读写(NSString, NSArray, NSDictionary, NSData)
    //2.归档
    //3.NSUserDefaults
    //4.SQLite
    
    //在iOS中实现SQLite数据库的操作
    //1.导入框架libsqlite3.0.dylib
    //2.导入头文件<sqlite3.h>
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
