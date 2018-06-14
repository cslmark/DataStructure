//
//  SLElement.h
//  OC数据结构
//
//  Created by IanChen on 2018/6/13.
//  Copyright © 2018年 IanChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLComparable.h"

@interface SLElement : NSObject<SLComparable>
@property (nonatomic, strong) id value;
-(instancetype) initWithValue: (id) value;
@end
