//
//  Person.m
//  RuntimeNSCoding
//
//  Created by 李艳敏 on 2018/12/30.
//  Copyright © 2018年 李艳敏. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
@implementation Person
+ (BOOL)supportsSecureCoding {
    return YES;
}
// 解档
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        unsigned int count = 0;
        Ivar *ivarLists = class_copyIvarList([Person class], &count);
        for (int i = 0; i < count; i++) {
            const char *name = ivar_getName(ivarLists[i]);
            NSString *strName = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
            id value = [aDecoder decodeObjectForKey:strName];
            [self setValue:value forKey:strName];
        }
        free(ivarLists);
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name age:(NSString *)age {
    if (self = [super init]) {
        _name = name;
        _age = age;
    }
    return self;
}

// 归档
- (void)encodeWithCoder:(NSCoder *)aCoder {
    unsigned int count = 0;
    Ivar *ivarLists = class_copyIvarList([Person class], &count);
    for (int i = 0; i < count; i++) {
        const char *name = ivar_getName(ivarLists[i]);
        NSString *strName = [NSString stringWithUTF8String:name];
        [aCoder encodeObject:[self valueForKey:strName] forKey:strName];
    }
    free(ivarLists);
}

- (NSString *)description {
    return [NSString stringWithFormat:@"name:%@ age:%@",self.name,self.age];
}
@end
