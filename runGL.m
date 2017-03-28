function runGL()
    %Geolife user 3
    angDiffConst = 30; % direction difference 30 degree
    distX = 0.00117; % Long distance 100 meters
    distY = 0.0009; % Lat distance 100 meters
    distTime = 3600; % time difference 3600 seconds
    dictionary = 'geolife';
    p = 0.1;
    isElng = 1;

    traj = getTraj( dictionary, distX, distY , distTime );
    areaHur = getOverlap( traj,distX,distY ,distTime,angDiffConst,false);
    cubes = getRepresentLine( areaHur,traj,p );
    cubes = get2points(cubes,distX,distY);
    cubes(:,7) = cubes(:,7) * isElng;
    cubes(:,9) = cubes(:,9) * isElng;
    traj(:,3) = traj(:,3) * isElng;
    drawMap(cubes,traj); 
    % draw0127(cubes,[]); %show only arrow
end
