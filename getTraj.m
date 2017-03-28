function cellTraj = getTraj( dictionary, distX, distY , distTime )
%UNTITLED 
    filelist = ls(dictionary);
    [n,~] = size(filelist);
    fprintf('%i trajectories\n',n-2);
    cellTraj = [];
    j = 0;
    for i = 3:n
        filename = sprintf('%s\\%s',dictionary,filelist(i,:) );
        traj = readVector( filename );
        traj2 = traj;
        [traj,~] = points2cubes(traj2,distX,distY,distTime); 
        j = j + 1;
        traj(:,5) = j; %add traj number
        [n2,~] = size(traj);
        traj(:,1) = (1:n2)';   
        cellTraj = vertcat(cellTraj,traj);
    end
end

