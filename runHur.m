function runHur()
    %Hurricane
    angDiffConst = 30;
    distX = 5;
    distY = 5;
    distTime = 30; % 30 days == 1 month
    %distTime = 365;
    dictionary = 'hur';
    p = 0.9999;
    isElng = -1;

    traj = getTraj( dictionary, distX, distY , distTime );
    traj = traj(traj(:,2) >= 171 & traj(:,2) <= 200,:);
    areaHur = getOverlap( traj,distX,distY ,distTime,angDiffConst,false);
    cubes = getRepresentLine( areaHur,traj,p );
    cubes = get2points(cubes,distX,distY);
    cubes(:,7) = cubes(:,7) * isElng;
    cubes(:,9) = cubes(:,9) * isElng;
    traj(:,3) = traj(:,3) * isElng;
    drawMap(cubes,traj); 
    % draw0127(cubes,[]); %show only arrow
end
