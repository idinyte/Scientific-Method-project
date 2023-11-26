# Testing complete area exploration algorithms for mobile robots in simulated environments

## Abstract
Mobile robots are becoming increasingly accessible to customers and are therefore finding their way into more and more households. For example, there are vacuum cleaning robots that attempt to clean all areas of a room while avoiding obstacles. For the most sustainable use and the best customer satisfaction, the robot should cover the entire room in the fastest possible time. However, this depends heavily on the algorithm used to move the robot. In this paper, we compare different non-sensor-based algorithms to overcome this challenge. We hypothesise that an A* Orientation algorithm is superior to other stochastic and deterministic algorithms. We expect that this algorithm performs best when it comes to the time to cover all areas of different test environments, the total accumulated rotation, and the error as a measure of areas already explored. To test and evaluate the algorithms, we introduce a grid-based simulation using Pygame and various test environments. As a result, the A* Orientation algorithm provides the best performance, which is why we transferred its path generated in the simulation to a Lego Mindstorms EV3 robot. This allows a successful robot exploration in a known real-world environment.


## Additional information about the code and generated data
This is the implementation of a comparable analysis of a scientific project, which was conducted in November 2023 at the University of Southern Denmark (SDU) in Odense in the lecture Scientific Methods.

The study involved the implementation of a simulation resembling a grid-based game with dimensions of 30x30 cells. 
Initially, all cells were set to black, except for predefined red obstacles. Movement of a virtual "robot" resulted in the transformation of cells to white. 

This simulation aimed to emulate scenarios comparable to those encountered by a vacuum cleaner robot navigating a room with obstacles, represented as a grid. 
The primary objective was to optimize the robot's coverage of the entire area, minimizing the number of revisits to each grid cell. 


## Data
The data is in the following format:
{units_traveled},{error},{rotation_accumulator},{time_taken},{algorithm.value},{map.value}

The algorithm choices include:

0: Random

1: Semirandom

2: A* Random

3: A* Orientation

4: A* Sequential

The environmental maps comprised:
0: Empty
1: Room
2: Spiral maze
3: Complex maze

A description of these can be seen in the paper.


## This repository includes:
main.py:
    Main code that contains the implemented simulation as a pygame, all compared algorithms and the different maps.
    The code provides many comments that aim to help understanding the code. With this, it should be able to reproduce the results explained in the paper.

draw_obstacle_map.py:
    Code used to generate different environments. Here it is possible to select red grid cells with a mouse click. The output can be used in the main.py file to add a new obstacle_map.

requirements.txt:
    Contains the versions of the two libraries numpy and pygame that have been used.

ev3_path.txt:
    Textfile that contains the commands used to navigate the Lego Mindstorm robot EV3 and to test the movement of the virtual "robot" in the simulation.

data_0_0.txt:
    Data file for the stochastic algorithms. The study employed each algorithm with 25 deliberately selected different starting positions on each of the four maps. 

data_compare_astar.txt:
    Data file for the deterministic algorithms.
