//
//  Room.m
//  objcMaze
//
//  Created by Brenden Knauss on 4/14/13.
//  Copyright (c) 2013 Brenden Knauss. All rights reserved.
//

#import "Room.h"

@implementation Room

-(id) initWithData: (int)doorNorth doorSouth:(int)s doorEast:(int)e doorWest:(int)w{
    self = [super init];
    if (self) {
        _north = doorNorth;
        _south = s;
        _east = e;
        _west = w;
        _visited = FALSE;
        _parent = -1;
    }
    return self;
}

-(void) visit: (int)parentIndex {
    _visited = TRUE;
    _parent = parentIndex;
}

-(void) reset {
    _visited = FALSE;
    _parent = -1;
}

-(BOOL) hasParent{
    if (_parent < 0) {
        return FALSE;
    }
    return TRUE;
}


@end
