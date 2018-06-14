//
//  SLStackProtocol.h
//  OC数据结构
//
//  Created by IanChen on 2018/6/13.
//  Copyright © 2018年 IanChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SLStackProtocol <NSObject>
-(NSInteger) size;
-(BOOL) isEmpty;
-(void) push:(id) e;
-(id) pop;
-(id) peek;
@end
