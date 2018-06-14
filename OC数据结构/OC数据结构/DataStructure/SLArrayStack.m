//
//  SLArrayStack.m
//  OC数据结构
//
//  Created by IanChen on 2018/6/13.
//  Copyright © 2018年 IanChen. All rights reserved.
//

#import "SLArrayStack.h"


@interface SLArrayStack(){
    NSMutableArray<id> * _array;
}
@end

@implementation SLArrayStack
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

// 重写Descption方法
-(NSString*) description{
    NSMutableString* res = [[NSMutableString alloc] initWithCapacity:10];
    [res appendString:@"stack:"];
    [res appendString:@"["];
    NSInteger length = _array.count;
    for (int i = 0; i < length; i++) {
        NSString* tempStr = [NSString stringWithFormat:@"%@", _array[i]];
         [res appendString:tempStr];
        if (i != (length - 1))
        {
            [res appendString:@","];
        }
    }
    [res appendString:@"] top"];
    return res;
}

#pragma mark SLStackProtocol
-(NSInteger) size{
    return _array.count;
}

-(BOOL) isEmpty{
    return (_array.count == 0);
}

-(void) push:(id) e{
    [_array addObject:e];
}

-(id) pop{
    id lastObject = [_array lastObject];
    [_array removeLastObject];
    return lastObject;
}

-(id) peek{
    id lastObject = [_array lastObject];
    return lastObject;
}
@end
