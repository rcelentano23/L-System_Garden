# L-System_Garden

L-System_Garden is a project to create randomized computer-generated scenes that mimic how the real world, especially plant life is formed.
## Usage
### Tree Generator Menu
The fields in the .exe file inside of V10 for L-System_Trees work as follows:

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

Render Count:
This is the number of renders that will be created when the rendering process is started.

Width Divisor:
This is the number that the height is divided by to create the width of the branches; bigger numbers = thinner branches.

### L-System Render Window
This window can be controlled with the following keys/shortcuts:

Enter begins the rendering process: 
Once you have begun rendering you cannot stop so you should do a test run with a render count of 1 before doing any larger series of renders.

1 toggles live view:
Live view is a mode that controls whether or not the trees are displayed as they are rendered.
This mode also takes more ram so it should be turned off if making bigger trees.

2 toggles exponential mode:
This is a mode that controls whether or not the scaling factor is multiplied by itself for each iteration.
This usually makes it take more iterations to hit the limit set by the min length field on the Tree Generator Menu.

3 toggles angle scaling:
This is a mode that similar to exponential mode controls whether or not angles are multiplied times the scaling factor for each iteration.
This makes the range that the angles fall into larger with each iteration.

## Contributing
Pull requests are welcome! At the moment this project is done by one person so help would be a tremendous addition.
