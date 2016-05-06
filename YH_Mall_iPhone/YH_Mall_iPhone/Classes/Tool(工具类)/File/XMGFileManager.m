//
//  XMGFileManager.m
//  BuDeJie
//
//  Created by xiaomage on 16/4/6.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "XMGFileManager.h"

@implementation XMGFileManager

+ (void)removeDirectoryPath:(NSString *)directoryPath
{
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    BOOL isDirectory;
    BOOL isExist = [mgr fileExistsAtPath:directoryPath isDirectory:&isDirectory];
    
    if (!isExist || !isDirectory) {
        // 报错:抛异常
        NSException *excp = [NSException exceptionWithName:@"filePathError" reason:@"传错,必须传文件夹路径" userInfo:nil];
        
        [excp raise];
        
    }

    NSArray *subpaths = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:directoryPath error:nil];
    
    for (NSString *subPath in subpaths) {
        
        NSString *filePath = [directoryPath stringByAppendingPathComponent:subPath];
        
        [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
    }
}

// 获取文件夹尺寸
+ (NSInteger)getDirectorySize:(NSString *)directoryPath
{
    // 获取文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    BOOL isDirectory;
    BOOL isExist = [mgr fileExistsAtPath:directoryPath isDirectory:&isDirectory];
    
    if (!isExist || !isDirectory) {
        // 报错:抛异常
        NSException *excp = [NSException exceptionWithName:@"filePathError" reason:@"笨蛋,传错,必须传文件夹路径" userInfo:nil];
        
        [excp raise];
        
    }

    
    /*
     获取这个文件夹中所有文件路径,然后累加 = 文件夹的尺寸
     */

   
    // 获取文件夹下所有的文件
    NSArray *subpaths = [mgr subpathsAtPath:directoryPath];
    NSInteger totalSize = 0;
    
    for (NSString *subpath in subpaths) {
        
        // 拼接文件全路径
        NSString *filePath = [directoryPath stringByAppendingPathComponent:subpath];
        
        // 排除文件夹
        BOOL isDirectory;
        BOOL isExist = [mgr fileExistsAtPath:filePath isDirectory:&isDirectory];
        if (!isExist || isDirectory) continue;
        
        // 隐藏文件
        if ([filePath containsString:@".DS"]) continue;
        
        // 指定路径获取这个路径的属性
        // attributesOfItemAtPath:只能获取文件属性
        NSDictionary *attr = [mgr attributesOfItemAtPath:filePath error:nil];
        NSInteger size = [attr fileSize];
        
        totalSize += size;
    }
    
    return totalSize;
    
}

@end
