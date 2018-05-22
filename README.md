# TrajCubeClus

To analyse Geolife dataset(user3), run "runGL.m"
To analyse Hurricane dataset, run "runHur.m"

Each run-file include following 6 parameters which can be change.
--------------------------------------------------------------------
    angDiffConst = 30; % Theta, direction difference 30 degree
    distX = 0.00117; % Epsilon_x, Long distance 100 meters
    distY = 0.0009; % Epsilon_y, Lat distance 100 meters
    distTime = 3600; % Tau, time difference 3600 seconds
    p = 0.1; % p
    is2Ddraw = true; %draw on 2D plot to clearly see arrow.
--------------------------------------------------------------------

Relate to paper:
Algorithm 1 preprocessing => points2cubes(), call by getTraj2()
Algorithm 2 hypercubes-intersection => getOverlap()
Algorithm 3 common sub-trajectories clustering => getRepresentLine2()
