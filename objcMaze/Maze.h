//
//  Maze.h
//  objcMaze
//
//  Created by Brenden Knauss on 4/14/13.
//  Copyright (c) 2013 Brenden Knauss. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Room.h"



@interface Maze : NSObject

@property NSMutableArray *rooms;
@property int dimension;

-(id) initWithDimension: (int) dimension;

-(id) getRoom: (int) index;
-(id) getRoom: (int) current inDirection:(char)dir;
-(BOOL) validNorth: (int) index;
-(BOOL) validSouth: (int) index;
-(BOOL) validEast:  (int) index;
-(BOOL) validWest:  (int) index;
-(BOOL) isGoal: (int) roomIndex;
-(void) reset;
-(NSIndexSet *) getRowIndices: (int)row;
-(NSArray *) getRow: (int)row;
-(void) print;

@end
