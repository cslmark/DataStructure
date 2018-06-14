//
//  SLBST.h
//  OC数据结构
//
//  Created by IanChen on 2018/6/13.
//  Copyright © 2018年 IanChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLComparable.h"

@interface SLNode : NSObject
{
@public
    id<SLComparable> ele;
    SLNode* left;
    SLNode* right;
}
-(instancetype) initWithEle:(id<SLComparable>) ele;
@end

// 这里定义BST就是从 左边小 右边大 目前不处理重复的元素
@interface SLBST : NSObject
{
    @private
    SLNode* _root;
    NSInteger _size;
}
-(NSInteger) size;
-(void) add:(id<SLComparable>) ele;
-(BOOL) contains:(id<SLComparable>) ele;
-(void) preOrder;
-(void) inOrder;
-(void) postOrder;
-(void) levelOrder;
-(id<SLComparable>) maxinum;
-(id<SLComparable>) mininum;
-(void) removeEle:(id<SLComparable>) ele;
@end
