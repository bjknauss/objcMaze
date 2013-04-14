//
//  Maze.m
//  objcMaze
//
//  Created by Brenden Knauss on 4/14/13.
//  Copyright (c) 2013 Brenden Knauss. All rights reserved.
//

#import "Maze.h"

@implementation Maze

-(id) initWithDimension:(int)dimension{
    self = [super init];
    if (self) {
        _dimension = dimension;
    }
    return self;
}

-(id) getRoom:(int)index{
    return [_rooms objectAtIndex:index];
}

-(BOOL) validNorth: (int)index {
    Room *current = [self getRoom:index];
    if ([current north]) {
        return FALSE;
    }
    int northIndex = index - _dimension;
    if (northIndex < 0) {
        return FALSE;
    }
    Room *rNorth = [self getRoom:northIndex];
    if ([rNorth south] || [rNorth visited]) {
        return FALSE;
    }
    return TRUE;
}

-(BOOL) validSouth: (int)index {
    Room *current = [self getRoom:index];
    if ([current south]) {
        return FALSE;
    }
    int checkIndex = index + _dimension;
    if (checkIndex > [_rooms count]) {
        return FALSE;
    }
    Room *rCheck = [self getRoom:checkIndex];
    if ([rCheck north] || [rCheck visited]) {
        return FALSE;
    }
    return TRUE;
}

-(BOOL) validEast: (int)index {
    Room *current = [self getRoom:index];
    if ([current east]) {
        return FALSE;
    }
    int checkIndex = index + 1;
    if (checkIndex > [_rooms count]) {
        return FALSE;
    }
    Room *rCheck = [self getRoom:checkIndex];
    if ([rCheck west] || [rCheck visited]) {
        return FALSE;
    }
    return TRUE;
}

-(BOOL) validWest: (int)index {
    Room *current = [self getRoom:index];
    if ([current west]) {
        return FALSE;
    }
    int checkIndex = index - 1;
    if (checkIndex < 0) {
        return FALSE;
    }
    Room *rCheck = [self getRoom:checkIndex];
    if ([rCheck east] || [rCheck visited]) {
        return FALSE;
    }
    return TRUE;
}

-(id) getRoom:(int)current inDirection:(char)dir {
    switch (dir) {
        case 'n':
            return [self getRoom:(current - _dimension)];
            break;
        case 's':
            return [self getRoom:(current + _dimension)];
            break;
        case 'e':
            return [self getRoom:(current + 1)];
            break;
        case 'w':
            return [self getRoom:(current - 1)];
        default:
            break;
    }
    return nil;
}

-(BOOL) isGoal:(int)roomIndex {
    if (([_rooms count]-1) == roomIndex) {
        return TRUE;
    }
    return FALSE;
}

-(void) reset{
    for (Room *r in _rooms) {
        [r reset];
    }
}

-(NSIndexSet *) getRowIndices:(int)row {
    row = row * _dimension;
    return [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(row, (_dimension-1))];
}

-(NSArray *) getRow: (int) row {
    return [_rooms objectsAtIndexes:[self getRowIndices:row]];
}

-(void) print {
    for (int rowNum = 0; rowNum < _dimension; rowNum++) {
        NSArray *row = [self getRow:rowNum];
        NSMutableString *northOutput = [NSMutableString init];
        for (Room *r in row) {
            if ([r north]) {
                [northOutput appendString:@" ____ "];
            }else{
                [northOutput appendString:@"      "];
            }
        }
        NSLog(northOutput);
        NSMutableString *midOutput = [NSMutableString init];
        for (Room *r in row) {
            if ([r west]) {
                [midOutput appendString:@"|    "];
            }else{
                [midOutput appendString:@"     "];
            }
            if ([r east]) {
                [midOutput appendString:@"|"];
            }else{
                [midOutput appendString:@" "];
            }
        }
        NSLog(midOutput);
        NSMutableString *btmOutput = [NSMutableString init];
        for (Room *r in row) {
            if ([r west]) {
                [btmOutput appendString:@"|"];
            }else{
                [btmOutput appendString:@" "];
            }
            if ([r south]) {
                [btmOutput appendString:@"____"];
            }else{
                [btmOutput  appendString:@"    "];
            }
            if ([r east]) {
                [btmOutput appendString:@"|"];
            }else{
                [btmOutput appendString:@" "];
            }
        }
        NSLog(btmOutput);
    }
}

@end
