//
//  NSMutableArray+NSMutableArray_Queueing.m
//  objcMaze
//
//  Created by Brenden Knauss on 4/14/13.
//  Copyright (c) 2013 Brenden Knauss. All rights reserved.
//

#import "NSMutableArray+NSMutableArray_Queueing.h"

@implementation NSMutableArray (NSMutableArray_Queueing)

- (id) dequeue{
    if ([self count] == 0) {
        return nil;
    }
    id obj = [self objectAtIndex:0];
    [self removeObjectAtIndex:0];
    return obj;
}
- (void) enqueue : (id) obj {
    [self addObject:obj];
}

- (BOOL) isEmpty {
    return ([self count] == 0);
}

@end
