function [cellTraj,trajOri] = getTraj2( dictionary, distX, distY , distTime )
%UNTITLED 
    filelist = dir(dictionary);
    [n,~] = size(filelist);
    fprintf('%i trajectories\n',n-2);
    cellTraj = [];
    trajOri = [];
    j = 0;
    for i = 3:n
        filename = sprintf('%s\\%s',dictionary,filelist(i).name );
        traj = readVector( filename );
        traj2 = traj;
        [traj,~] = points2cubes(traj,distX,distY,distTime); 
        j = j + 1;
        traj(:,5) = j; %add traj number
        traj2(:,5) = j; %add traj number
        [n2,~] = size(traj);
        traj(:,1) = (1:n2)';   
        cellTraj = vertcat(cellTraj,traj);
        trajOri = vertcat(trajOri,traj2);
    end
end

