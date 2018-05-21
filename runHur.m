function runHur()
    %Hurricane
    angDiffConst = 30; % Theta, direction difference 30 degree
    distX = 5; %  Epsilon_x,5 longitude
    distY = 5; % Epsilon_y,5 latitude
    distTime = 30; %  Tau, 30 days == 1 month
    p = 0.9999; % p
    is2Ddraw = false; %draw on 3D plot to watch temporal dimension.
    
    dictionary = 'hur';
    isElng = -1;

    [traj,trajOri] = getTraj2( dictionary, distX, distY , distTime );
    traj = traj(traj(:,2) >= 171 & traj(:,2) <= 200,:);
    trajOri = trajOri(trajOri(:,2) >= 171 & trajOri(:,2) <= 200,:);
    areaHur = getOverlap( traj,distX,distY ,distTime,angDiffConst,false);
    cubes = getRepresentLine2( areaHur,traj,p );
    cubes = get2points(cubes,distX,distY);
    cubes(:,7) = cubes(:,7) * isElng;
    cubes(:,9) = cubes(:,9) * isElng;
    trajOri(:,3) = trajOri(:,3) * isElng;
    if is2Ddraw
        draw2D(cubes,trajOri);
    else
        draw3D(cubes,trajOri); 
    end
end
