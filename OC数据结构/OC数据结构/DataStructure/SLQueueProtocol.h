//
//  SLQueueProtocol.h
//  OC数据结构
//
//  Created by IanChen on 2018/6/13.
//  Copyright © 2018年 IanChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SLQueueProtocol <NSObject>
-(NSInteger) size;
-(BOOL) isEmpty;
-(void) enqueue:(id) e;
-(id) dequeue;
-(id) getFront;
@end
