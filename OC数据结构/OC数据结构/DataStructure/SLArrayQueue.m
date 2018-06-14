//
//  SLArrayQueue.m
//  OC数据结构
//
//  Created by IanChen on 2018/6/13.
//  Copyright © 2018年 IanChen. All rights reserved.
//

#import "SLArrayQueue.h"
@interface SLArrayQueue()
{
    NSMutableArray* _array;
}

@end

@implementation SLArrayQueue
-(instancetype) init{
    self = [super init];
    if (self) {
        if(_array == nil) {
            _array = [NSMutableArray arrayWithCapacity:10];
        }
    }
    return self;
}

-(instancetype) initWithCapacity:(NSInteger) capacity{
    self = [super init];
    if (self) {
        if(_array == nil) {
            _array = [NSMutableArray arrayWithCapacity:capacity];
        }
    }
    return self;
}

// 重写Desc方法
-(NSString *) description{
    NSMutableString* res = [[NSMutableString alloc] initWithCapacity:10];
    [res appendString:@"Queue:"];
    [res appendString:@"font ["];
    NSInteger length = _array.count;
    for (int i = 0; i < length; i++) {
        NSString* tempStr = [NSString stringWithFormat:@"%@", _array[i]];
        [res appendString:tempStr];
        if (i != (length - 1))
        {
            [res appendString:@","];
        }
    }
    [res appendString:@"] tail"];
    return res;
}

#pragma mark - SLQueueProtocol
-(NSInteger) size{
    return _array.count;
}

-(BOOL) isEmpty{
    return (_array.count == 0);
}

-(void) enqueue:(id) e{
    [_array addObject:e];
}

-(id) dequeue{
    id firstObject = [_array firstObject];
    [_array removeObject:firstObject];
    return firstObject;
}

-(id) getFront{
    return [_array firstObject];
}

@end
