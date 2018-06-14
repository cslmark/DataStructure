//
//  SLArrayStack.h
//  OC数据结构
//
//  Created by IanChen on 2018/6/13.
//  Copyright © 2018年 IanChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLStackProtocol.h"

@interface SLArrayStack : NSObject<SLStackProtocol>
// 初始化的方法
-(instancetype) init;
-(instancetype) initWithCapacity:(NSInteger) capacity;
@end
