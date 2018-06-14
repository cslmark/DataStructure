//
//  main.m
//  OC数据结构
//
//  Created by IanChen on 2018/6/12.
//  Copyright © 2018年 IanChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLGlobleData.h"
#import "SLArrayStack.h"
#import "SLArrayQueue.h"
#import "SLBST.h"
#import "SLElement.h"
// 使用import的原因，本身就能避免循环引用
BOOL isVaildStr(NSString *testStr) {
    SLArrayStack* stack = [[SLArrayStack alloc] initWithCapacity:10];
    NSInteger length = testStr.length;
    for (NSInteger i = 0; i < length; i++) {
        char ch = [testStr characterAtIndex:i];
        if(ch == '(' || ch == '[' || ch == '{'){
            [stack push:@(ch)];
        } else {
            if ([stack isEmpty]){
                return NO;
            }
            
            char topChar = [[stack pop] charValue];
            if (ch == ')' && topChar != '(') {
                return NO;
            }
            if (ch == ']' && topChar != '[') {
                return NO;
            }
            if (ch == '}' && topChar != '{') {
                return NO;
            }
        }
    }
    return [stack isEmpty];
}

void testStack(){
    SLArrayStack* stack = [[SLArrayStack alloc] initWithCapacity:10];
    for(int i = 0 ; i < 5 ; i ++){
        [stack push:@(i)];
        NSLog(@"%@", stack);
    }
    [stack pop];
    NSLog(@"%@", stack);
    
    NSLog(@"()[]{} ==== %d", isVaildStr(@"()[]{}"));
    NSLog(@"([)] ==== %d", isVaildStr(@"([)]"));
}

void testQueue() {
    SLArrayQueue* queue = [[SLArrayQueue alloc] initWithCapacity:10];
    for(int i = 0 ; i < 5 ; i ++){
        [queue enqueue:@(i)];
        NSLog(@"%@", queue);
    }
    [queue dequeue];
    NSLog(@"%@", queue);
}

// 增加对于二叉搜索树的验证
void testBST(){
    SLBST* slBst = [[SLBST alloc] init];
    NSArray* array = @[@5, @3, @6, @8, @4, @2];
    for (NSInteger i = 0; i < array.count; i++) {
        NSNumber* num = array[i];
        SLElement* element = [[SLElement alloc] initWithValue:num];
        [slBst add:element];
    }
    NSLog(@"%@", slBst);
    SLElement* element = [[SLElement alloc] initWithValue:@9];
    NSLog(@"9 contains %d", [slBst contains:element]);
    NSLog(@"=================前序遍历=======================");
    [slBst preOrder];
    NSLog(@"=================中序遍历=======================");
    [slBst inOrder];
    NSLog(@"=================后序遍历=======================");
    [slBst postOrder];
    NSLog(@"=================层序遍历=======================");
    [slBst levelOrder];
    NSLog(@"=================最大的数======================");
    NSLog(@"%@", [slBst maxinum]);
    NSLog(@"=================最小的数======================");
    NSLog(@"%@", [slBst mininum]);
    NSLog(@"=================删除一个元素======================");
    SLElement* removeEle = [[SLElement alloc] initWithValue:@(8)];
    [slBst removeEle:removeEle];
    NSLog(@"=================后序遍历=======================");
    [slBst postOrder];
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        testStack();
//        testQueue();
        testBST();
    }
    return 0;
}


