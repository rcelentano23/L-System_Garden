# L-System_Garden

L-System_Garden is a project with the goal of creating randomized computer-generated scenes that mimic how the real world, especially plant life is formed.
## Usage

The fields in the .exe file inside of V07 for L-System_Trees work as follows:

Max Angle(degrees):
This field is responsible for the maximum angle that the L-system is allowed to turn on each iteration.

Min Length:
This is the length at which the fractal stops being generated and is then saved.

Start Length:
This is the maximum length that the first iteration can be; but, it is can be as much as half this distance when it is generated. Its distance when generated is randomized.

Branches(min, max):
These fields are the minimum and the maximum number of branches that can split off from the tree at a time.

Scaling Factor:
This is the number by which the length is multiplied and the angle is divided for each iteration. Note that it must be < 1.

## Contributing
Pull requests are welcome! At the moment this project is done by one person so help would be a tremendous addition.
