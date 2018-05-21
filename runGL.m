function runGL()
    %Geolife user 3
    angDiffConst = 30; % Theta, direction difference 30 degree
    distX = 0.00117; % Epsilon_x, Long distance 100 meters
    distY = 0.0009; % Epsilon_y, Lat distance 100 meters
    distTime = 3600; % Tau, time difference 3600 seconds
    p = 0.1; % p
    is2Ddraw = true; %draw on 2D plot to clearly see arrow.

    dictionary = 'geolife';

    [traj,trajOri] = getTraj2( dictionary, distX, distY , distTime );
    areaHur = getOverlap( traj,distX,distY ,distTime,angDiffConst,false);
    cubes = getRepresentLine2( areaHur,traj,p );
    cubes = get2points(cubes,distX,distY);
    if is2Ddraw
        draw2D(cubes,trajOri);
    else
        draw3D(cubes,trajOri); 
    end
end
