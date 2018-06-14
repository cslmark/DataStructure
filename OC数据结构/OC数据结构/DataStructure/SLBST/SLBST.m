//
//  SLBST.m
//  OC数据结构
//
//  Created by IanChen on 2018/6/13.
//  Copyright © 2018年 IanChen. All rights reserved.
//

#import "SLBST.h"
// 为了层序遍历的方便
#import "SLArrayQueue.h"

@implementation SLNode
//重写init方法和对应的desc方法
-(instancetype) init{
    self = [super init];
    if(self) {
        left = nil;
        right = nil;
    }
    return self;
}

-(instancetype) initWithEle:(id<SLComparable>) element{
    self = [super init];
    if(self) {
        ele = element;
        left = nil;
        right = nil;
    }
    return self;
}
@end

@implementation SLBST
#pragma mark - 重写init方法以及desc方法
-(instancetype) init{
    self = [super init];
    if(self) {
        _root = nil;
        _size = 0;
    }
    return self;
}

-(NSString *)description{
    NSMutableString* res = [NSMutableString string];
    [self generateString:_root withDepth:0 mutableStr:res];
    return res;
}

// 通过递归的方式打印对应的数据内容
-(void) generateString:(SLNode *)node withDepth:(NSInteger) depth mutableStr:(NSMutableString *) res {
    if (node == nil) {
        return;
    }
    [res appendString:@"\n"];
    NSString* depthStr = [self generateStringWithDepth:depth];
    [res appendFormat:@"%@%@\n",depthStr, node->ele];
    if (node->left != nil) {
        [self generateString:node->left withDepth:depth+1 mutableStr:res];
    }
    if (node->right != nil){
        [self generateString:node->right withDepth:depth+1 mutableStr:res];
    }
}

-(NSString *) generateStringWithDepth:(NSInteger) depth{
    NSMutableString* tempStr = [NSMutableString string];
    for (NSInteger i = 0; i < depth; i++) {
        [tempStr appendString:@"--"];
    }
    return tempStr;
}

#pragma mark - BST里面用到的方法
-(NSInteger) size{
    return _size;
}

-(BOOL) isEmpty{
    return _size == 0;
}

// 向二分搜索树中添加新的元素e
-(void) add:(id<SLComparable>) ele{
//    if(_root == nil) {
//        _root = [[SLNode alloc] initWithEle:ele];
//        _size++;
//    } else {
//        _root = [self addNode:_root withEle:ele];
//    }
    _root = [self addNode:_root withEle:ele];
}

// 使用递归的方式，往node为根的二分搜索树中插入元素 ele
-(SLNode *) addNode:(SLNode *) node withEle:(id<SLComparable>) ele{
//    if ([ele compareTo:node->ele] == NSOrderedSame) {  // 重复这里的处理去除 如果不把该种情况归类，会出错
//        return node;
//    } else {
        if (node == nil) {
           SLNode* newNode = [[SLNode alloc] initWithEle:ele];
            _size++;
            return newNode;
        }
//        if ([ele compareTo:node->ele] == NSOrderedAscending && node->left == nil) {
//            SLNode* newNode = [[SLNode alloc] initWithEle:ele];
//            node->left = newNode;
//            _size++;
//            return;
//        }
//        if ([ele compareTo:node->ele] == NSOrderedDescending && node->right == nil) {
//            SLNode* newNode = [[SLNode alloc] initWithEle:ele];
//            node->right = newNode;
//            _size++;
//            return;
//        }
        if ([ele compareTo:node->ele] == NSOrderedAscending) {   // 也就是小于的情况
            node->left = [self addNode:node->left withEle:ele];
        } else {  // NSOrderedDescending
            node->right = [self addNode:node->right withEle:ele];
        }
//    }
    return node;
}

-(BOOL) contains:(id<SLComparable>) ele{
    return [self isNode:_root containsEle:ele];
}

// 看以node为根的二分搜索树中是否包含元素e,递归算法
-(BOOL) isNode:(SLNode *) node containsEle:(id<SLComparable>) ele {
    if (node == nil) {
        return NO;
    }
    if([ele compareTo:node->ele] == NSOrderedSame) {
        return YES;
    }
    if ([ele compareTo:node->ele] == NSOrderedAscending) {   // 也就是小于的情况
        return [self isNode:node->left containsEle:ele];
    } else {  // NSOrderedDescending
        return [self isNode:node->right containsEle:ele];
    }
}

// 二叉树的前序遍历 先遍历 节点 再左右
-(void) preOrder{
    [self preOrderWithNode:_root];
}

-(void) preOrderWithNode:(SLNode *) node{
    if (node == nil) {
        return;
    }
    NSLog(@"%@", node->ele);
    [self preOrderWithNode:node->left];
    [self preOrderWithNode:node->right];
}

// 二叉树的中序遍历
-(void) inOrder{
    [self inOrderWithNode:_root];
}

-(void) inOrderWithNode:(SLNode *) node{
    if (node == nil) {
        return;
    }
    [self preOrderWithNode:node->left];
    NSLog(@"%@", node->ele);
    [self preOrderWithNode:node->right];
}

// 二叉树的后续遍历
-(void) postOrder{
    [self inOrderWithNode:_root];
}

-(void) postOrderWithNode:(SLNode *) node{
    if (node == nil) {
        return;
    }
    [self preOrderWithNode:node->left];
    [self preOrderWithNode:node->right];
    NSLog(@"%@", node->ele);
}

// 二叉树的层序遍历
-(void) levelOrder{
    [self levelOrderWithNode:_root];
}

-(void) levelOrderWithNode:(SLNode *) node{
    if (node == nil) {
        return;
    }
    SLArrayQueue* queue = [[SLArrayQueue alloc] initWithCapacity:10];
    [queue enqueue:node];
    while(![queue isEmpty]) {
        SLNode* cur = [queue dequeue];
        NSLog(@"%@", cur->ele);
        
        if(cur->left != nil) {
            [queue enqueue:cur->left];
        }
        if (cur->right != nil) {
            [queue enqueue:cur->right];
        }
    }
}

// 寻找二分搜索树的最大元素
-(id<SLComparable>) maxinum{
    if (_size == 0) {
        @throw [[NSException alloc] initWithName:@"illgaArgument" reason:@"BST is empty" userInfo:nil];
    }
    return [self maxinumWithNode:_root]->ele;
}

-(SLNode *) maxinumWithNode: (SLNode *) node{
    if (node->right == nil) {
        return node;
    }
    return [self maxinumWithNode:node->right];
}

// 寻找二分搜索树中最小元素
-(id<SLComparable>) mininum {
    if (_size == 0) {
         @throw [[NSException alloc] initWithName:@"illgaArgument" reason:@"BST is empty" userInfo:nil];
    }
    return [self minnumWithNode:_root]->ele;
}

-(SLNode *) minnumWithNode:(SLNode *) node{
    if (node->left == nil) {
        return node;
    }
    return [self minnumWithNode:node->left];
}

// 从二分搜索树中删除最小值所在的节点，返回最小值
-(id<SLComparable>) removeMin{
    id<SLComparable> ele = [self mininum];
    _root = [self removeMinwithNode:_root];
    return ele;
}

-(SLNode *) removeMinwithNode:(SLNode *) node{
    if(node->left == nil) {
        SLNode* rightNode = node->right;
        node->right = nil;
        _size--;
        return rightNode;
    }
    node->left = [self removeMinwithNode:node->left];
    return node;
}

// 从搜索二叉树中删除最大值所在的节点，返回最大值
-(id<SLComparable>) removeMax {
    id<SLComparable> ele = [self maxinum];
    _root = [self removeMaxWithNode:_root];
    return ele;
}

-(SLNode *) removeMaxWithNode:(SLNode *) node{
    if(node->right == nil) {
        SLNode* leftNode = node->left;
        node->left = nil;
        return leftNode;
    }
    node->right = [self removeMaxWithNode:node->right];
    return node;
}

// 从二分搜索树中删除元素为e的元素
-(void) removeEle:(id<SLComparable>) ele{
    _root = [self node:_root removeEle:ele];
}

-(SLNode *) node:(SLNode *) node removeEle:(id<SLComparable>) ele{
    if (node == nil) {
        return nil;
    }
    // 比左子数小，说明该树在左边
    if ([ele compareTo:node->ele] == NSOrderedAscending) {
        node->left = [self node:node->left removeEle:ele];
        return node;
    } else if ([ele compareTo:node->ele] == NSOrderedDescending) {  // 说明在右子树
        node->right = [self node:node->right removeEle:ele];
        return node;
    } else {
        // 如果是不存在右子树
        if(node->right == nil) {
            SLNode* leftNode = node->left;
            node->left = nil;
            _size--;
            return leftNode;
        }
        if(node->left == nil) {
            SLNode* rightNode = node->right;
            node->right = nil;
            _size--;
            return rightNode;
        }
        // 如果是左右子树都不为空的IQ那个卡㝎，可以采用采用右子树中最小的数 来替代 该删除的节点
        // 注意只需要元素，干掉和原来树的关系
        SLNode* rightMinNode = [[SLNode alloc] initWithEle:[self removeMax]];
        rightMinNode->left = node->left;
        rightMinNode->right = node->right;
        node->left = nil;
        node->right = nil;
        return rightMinNode;
    }
}






@end
