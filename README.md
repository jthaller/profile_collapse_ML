# profile_collapse_auto
A matlab function to end the world's most boring video game (as coined by Kate Jensen)

As part of my undergraduate thesis, I used fluorescent confocal microscopy to map the outline of tiny beads of sand sunk into silicone. One step of the process was to collapse a 3d image into a 2d side profile (add picture). Part of the tidium involved navigating to the exact best position that showcased this profile. The goal of this project is to replace this process with an automated one.

## Design
My first thought was, why don't I just apply gradient descent to it? But it's a much more complicated problem. There is no correct solution against which you can compare the current position. Instead, you are trying to find the optimal solution - where all the data points are nice and close to each other and allow you to clearly see the outline of the bead.

# In Progress ...

## Defining a Loss Function
This is really the hardest part of the problem, and is something I've been ruminating on for a few days. Clearly the loss function needs to encapsulate how close together the points are to one another, but only how close they are to the points they are supposed to be next to. So my first approach will to sum the distances of each point to its nearest neighbor on the r axis (xy collapsed) and then on the z axis.  With this loss function defined I may be able to manipulate into an more tensorial form with which I can apply some machine learning like gradient descent. 

### First Attempt
So it seemed this was not a good way to measure loss at first...but then I added a break statement so that the points in the far field weren't screwing everything up and it improved quite a lot. It seemed like it was working, but when I automated the process with a nested for-loop to find the actual minimum loss, it never worked out. I tried sorting by z value and measure the xy distance between neast neighbors (both 1 neighbor and up to 5 neighbors), sorting by xy position and the measuring z distances (both alone and in adition to the xy distance sorted by z). None worked well enough. There was always a position with a lower measured loss than the actual optimal solution. Time to try something else. 

### Second Attempt
I went back to pen and paper to try and think what a better way to characterize loss would be. This will be a little bit complicated, but I think that if I fit a circle to the data and than measure the loss as the distance from the points to the circle, it will always be the case that a more collapsed side profile will result in a smaller loss value. Thus, it shouldn't get stuck in an uncollapsed posiition, because if its not collapsed, it'll be a poor circle fit AND that will result in larger residuals. So only in the case when the profile is collapsed well will it fit a nice circle and have the smallest residuals. 

I'm convinced this ***should*** work, but it will require some tricky implimentation, and will probably need the user to specify 3 points, instead of 1 (a small price to pay for not having to click x,y,d and enter thousands of times) *insert thanos meme*. 
