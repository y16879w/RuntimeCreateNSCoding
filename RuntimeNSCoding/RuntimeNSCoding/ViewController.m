//
//  ViewController.m
//  RuntimeNSCoding
//
//  Created by 李艳敏 on 2018/12/30.
//  Copyright © 2018年 李艳敏. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Person *me = [[Person alloc] init];
    me.name = @"Tom";
    me.age = @"18";
    BOOL result = [self stortDatas:me];
    if (result) {
        NSLog(@"成功存入");
    }
    
    // 读取数据
    Person *newMe = (Person *)[self getDatas];
    NSLog(@"%@",newMe.name);
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSString *)getDocunmentsFilePath {
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [docDir stringByAppendingPathComponent:@"myFile"];
    return filePath;
}

/**
 归档

 @param object 遵循NSCoding的对象
 @return YES/NO
 */
- (BOOL)stortDatas:(id)object {
    NSError *error;
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:object requiringSecureCoding:YES error:&error];
    BOOL result = [data writeToFile:[self getDocunmentsFilePath] atomically:YES];
    return result;
}

- (id)getDatas {
    NSData *data = [NSData dataWithContentsOfFile:[self getDocunmentsFilePath]];
    NSError *error;
    return [NSKeyedUnarchiver unarchivedObjectOfClass:Person.class fromData:data error:&error];
}


@end
