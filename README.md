objcMaze
========

A program that finds a path through a maze using breadth-first search.

### Maze File Format ###
The maze only supports maze dimensions of n-by-n (square). 
Doors:
  door 0 - North, 1 - South, 2 - East, 3 - West
Value: "0" => Door Open, "1" => Door Closed

Ex: "0 1 0 0" would mean that the south door is closed, the rest are open

<value of n>
<door 0 in room 0> <door 1 in room 0> <door 2 in room 0> <door 3 in room 0>
<door 0 in room 1> <door 1 in room 1> <door 2 in room 1> <door 3 in room 1>
<door 0 in room 2> <door 1 in room 2><door 2 in room 2> <door 3 in room 2>
.
.
.
