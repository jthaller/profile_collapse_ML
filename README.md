# profile_collapse_auto
A matlab function to end the world's most boring video game (as coined by Kate Jensen)

As part of my undergraduate thesis, I used fluorescent confocal microscopy to map the outline of tiny beads of sand sunk into silicone. One step of the process was to collapse a 3d image into a 2d side profile (add picture). Part of the tidium involved navigating to the exact best position that showcased this profile. The goal of this project is to replace this process with an automated one.

## Design
My first thought was, why don't I just apply gradient descent to it? But it's a much more complicated problem. There is no correct solution against which you can compare the current position. Instead, you are trying to find the optimal solution - where all the data points are nice and close to each other and allow you to clearly see the outline of the bead.

# In Progress ...

## Defining a Loss Function
This is really the hardest part of the problem, and is something I've been ruminating on for a few days. Clearly the loss function needs to encapsulate how close together the points are to one another, but only how close they are to the points they are supposed to be next to. So my first approach will to sum the distances of each point to its nearest neighbor on the r axis (xy collapsed) and then on the z axis.  With this loss function defined I may be able to manipulate into an more tensorial form with which I can apply some machine learning like gradient descent. 

### Update
This is turning out now to be a good way to measure loss. I've found that worse guesses often have a smaller loss than good guesses. I think this is because a bad guess might spead points with a similiar z value out across xy, but that's not being encapsulated in the calculation. It's only seeing how close the nearest z neighbor. It's a pain in the ass, but I think I'll need to do binning.
