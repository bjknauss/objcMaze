objcMaze
========

A program that finds a path through a maze using breadth-first search.

Door Direction:
---------
* door 0: North
* door 1: South
* door 2: East
* door 3: West

Door Value:
---
* "0" => Door Open 
* "1" => Door Closed

Ex: "0 1 0 0" would mean that the south door is closed, the rest are open

File Format
----
Where n is the dimension of the square maze and m = (n^2 -1) rooms  

    [ value of n ]  
    [door 0 in room 0] [door 1 in room 0] [door 2 in room 0] [door 3 in room 0]  
    [door 0 in room 1] [door 1 in room 1] [door 2 in room 1] [door 3 in room 1]  
    [door 0 in room 2] [door 1 in room 2] [door 2 in room 2] [door 3 in room 2]  
    .  
    .  
    [ door 0 in room m ] [ door 1 in room m ] [ door 2 in room m ] [ door 3 in room m ] 
