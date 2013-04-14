//
//  main.m
//  objcMaze
//
//  Created by Brenden Knauss on 4/14/13.
//  Copyright (c) 2013 Brenden Knauss. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSMutableArray+NSMutableArray_Queueing.h"
#import "Room.h"
#import "Maze.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSURL *urlMaze = [NSURL fileURLWithPath:@"/Users/brendenknauss/Sites/objcMaze/objcMaze/maze5.txt"];
        NSString *contents = [NSString stringWithContentsOfURL:urlMaze
                                       encoding:NSUTF8StringEncoding error:nil];
        NSScanner *scan = [NSScanner scannerWithString:contents];
        int dim = 0;
        [scan scanInt:&dim];
        Maze *theMaze = [[Maze alloc] initWithDimension:dim];
        for (int i = 0; i < (dim*dim); i++) {
            int n, s, e, w;
            [scan scanInt:&n];
            [scan scanInt:&s];
            [scan scanInt:&e];
            [scan scanInt:&w];
            Room *r = [[Room alloc] initWithData:n doorSouth:s doorEast:e doorWest:w];
            [theMaze addRoom:r];
            
        }
        [theMaze print];
        NSMutableArray *queue = [[NSMutableArray alloc] init];
        [queue enqueue: [NSNumber numberWithInt:0]];
        [[theMaze getRoom:0] setVisited:TRUE];
        BOOL pathFound = FALSE;
        int currentRoom = 0;
        while (![[theMaze rooms] isEmpty] && !pathFound) {
            currentRoom = [[queue dequeue] intValue];
            if ([theMaze isGoal:currentRoom]) {
                pathFound = TRUE;
            }
            if ([theMaze validNorth:currentRoom]) {
                int room = [theMaze getRoomIndex:currentRoom inDirection:'n'];
                [[theMaze getRoom:room] visit:currentRoom];
                [queue enqueue:[NSNumber numberWithInt:room]];
            }
            if ([theMaze validSouth:currentRoom]) {
                int room = [theMaze getRoomIndex:currentRoom inDirection:'s'];
                [[theMaze getRoom:room] visit:currentRoom];
                [queue enqueue:[NSNumber numberWithInt:room]];
            }
            if ([theMaze validEast:currentRoom]) {
                int room = [theMaze getRoomIndex:currentRoom inDirection:'e'];
                [[theMaze getRoom:room] visit:currentRoom];
                [queue enqueue:[NSNumber numberWithInt:room]];
            }
            if ([theMaze validWest:currentRoom]) {
                int room = [theMaze getRoomIndex:currentRoom inDirection:'w'];
                [[theMaze getRoom:room] visit:currentRoom];
                [queue enqueue:[NSNumber numberWithInt:room]];
            }
        }
        
        [theMaze solve];
        
        
    }
    return 0;
}

