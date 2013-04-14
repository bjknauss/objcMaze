//
//  NSMutableArray+NSMutableArray_Queueing.h
//  objcMaze
//
//  Created by Brenden Knauss on 4/14/13.
//  Copyright (c) 2013 Brenden Knauss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (NSMutableArray_Queueing)

- (id) dequeue;
- (void) queue: (id) obj;

@end
