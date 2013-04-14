//
//  Room.h
//  objcMaze
//
//  Created by Brenden Knauss on 4/14/13.
//  Copyright (c) 2013 Brenden Knauss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Room : NSObject

@property BOOL north, south, east, west, visited;
@property int parent;

-(id) initWithData: (int)doorNorth doorSouth:(int)s doorEast:(int)e doorWest:(int)w;

-(void) visit: (int) parentIndex;
-(BOOL) hasParent;
-(void) reset;

@end
