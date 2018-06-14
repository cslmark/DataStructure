//
//  SLElement.m
//  OC数据结构
//
//  Created by IanChen on 2018/6/13.
//  Copyright © 2018年 IanChen. All rights reserved.
//

#import "SLElement.h"


@implementation SLElement
#pragma mark - 重写构造方法
-(instancetype) initWithValue: (id) value{
    self = [super init];
    if (self) {
        self.value = value;
    }
    return self;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"%@", self.value];
}

#pragma mark - SLComparable
// NSOrderedAscending = -1L, NSOrderedSame, NSOrderedDescending 注意对Nil做处理
-(NSComparisonResult)compareTo:(SLElement*) e{
    if (e == nil && self == nil) {
        return NSOrderedSame;
    }
    if (e == nil && self != nil) {
        return NSOrderedDescending;
    }
    if (e != nil && self == nil) {
        return NSOrderedAscending;
    }
    return [self.value compare:e.value];
}
@end
