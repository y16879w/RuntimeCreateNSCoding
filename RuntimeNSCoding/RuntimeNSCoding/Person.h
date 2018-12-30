//
//  Person.h
//  RuntimeNSCoding
//
//  Created by 李艳敏 on 2018/12/30.
//  Copyright © 2018年 李艳敏. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject<NSSecureCoding>
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *age;
- (instancetype)initWithName:(NSString *)name age:(NSString *)age;
@end

NS_ASSUME_NONNULL_END
