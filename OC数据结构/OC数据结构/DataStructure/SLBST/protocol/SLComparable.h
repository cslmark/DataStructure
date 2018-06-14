//
//  SLComparable.h
//  OC数据结构
//
//  Created by IanChen on 2018/6/13.
//  Copyright © 2018年 IanChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SLComparable <NSObject>
// NSOrderedAscending = -1L, NSOrderedSame, NSOrderedDescending
-(NSComparisonResult)compareTo:(id) e;
@end

