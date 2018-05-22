function totalArea = getOverlap(trajList ,distX,distY ,dtime,angDiffConst,withSameTrack)
% Algorithm 2 hypercubes-intersection in paper.
%   input: trajList, cubes.
%          distX, Epsilon_x in paper, longitude distance.
%          distY, Epsilon_y in paper, latitude distance.
%          dtime, Tau in paper, time distance.
%          angDiffConst, Theta in paper, direction difference threshold.
%          withSameTrack, if two intersecting hypercubes were from the same trajectory, is it count?
    AREA_COL = 6;
    [n,~] = size(trajList);
    INCREASE_SIZE_FOR_TOTALAREA = n*floor(sqrt(n));
    totalArea = zeros(INCREASE_SIZE_FOR_TOTALAREA,AREA_COL);
    totalAreaSize = INCREASE_SIZE_FOR_TOTALAREA;
    indexTotalAreaTop = 0;
    trajList(:,9) = (1:n)';
    nt = unique(trajList(:,5))';
    
    for i = nt
            t1 = find(trajList(:,5) == i);
            
            if withSameTrack
             area2 = getOverlaySameTrack(i,trajList(t1,:),dtime,distX,distY,angDiffConst);
             [nArea2,~] = size(area2);
             if nArea2 > 0
                 totalArea((indexTotalAreaTop+1):(indexTotalAreaTop+nArea2),:) = area2;
                 indexTotalAreaTop = indexTotalAreaTop + nArea2;
             end            
            end
            
            trajList2 = trajList(trajList(:,5) ~= i,:);
            area = getOverlayAreaTime(i,trajList(t1,:),trajList2,dtime,distX,distY,angDiffConst);
            if isempty(area)
                trajList = trajList2;
                 continue;
            end
            [nArea,~] = size(area);
            if (nArea + nArea + indexTotalAreaTop) > totalAreaSize
                    totalArea = vertcat(totalArea,zeros(INCREASE_SIZE_FOR_TOTALAREA,AREA_COL));
                    totalAreaSize = totalAreaSize + INCREASE_SIZE_FOR_TOTALAREA;
            end            
            totalArea((indexTotalAreaTop+1):(indexTotalAreaTop+nArea),:) = area;
            indexTotalAreaTop = indexTotalAreaTop + nArea;
            
            trajList = trajList2;
            

    end
    
    totalArea = totalArea(1:indexTotalAreaTop,:);
end

function area = getOverlaySameTrack(trajNo,trajList,dtime,distX,distY,angDiffConst)
    [n,~] = size(trajList);
    area = [];
    if n <= 1
        return;
    end
    for i = 1:(n-1)
        if angleDiff( trajList(i,8), trajList(i+1,8)) < angDiffConst
            area1 = [trajNo trajList(i,1) trajNo trajList(i+1,1) trajList(i,9 ) trajList(i+1,9);trajNo trajList(i+1,1) trajNo trajList(i,1) trajList(i+1,9) trajList(i,9)];
            area = vertcat(area,area1);
        end  
    end
end

function area = getOverlayAreaTime(trajNo,trajList1,trajList2,dtime,distX,distY,angDiffConst)
    maxTime = trajList1(end,2)+dtime;
    minTime = trajList1(1,2)-dtime;
    
    trajList3 = trajList2(trajList2(:,2) > minTime & trajList2(:,2) < maxTime,:);
    [n,~] = size(trajList1);
    area = [];
    for i = 1:n
        trajList4 = trajList3(abs(trajList3(:,2) - trajList1(i,2)) < dtime,:);
        trajList4 = trajList4(abs(trajList4(:,3) - trajList1(i,3)) < distX,:);
        trajList4 = trajList4(abs(trajList4(:,4) - trajList1(i,4)) < distY,:);
        trajList4 = trajList4(angleDiff(trajList4(:,8),trajList1(i,8)) < angDiffConst,:);
        [n1,~] = size(trajList4);
        area1 = [zeros(n1,1) zeros(n1,1) trajList4(:,5) trajList4(:,1) zeros(n1,1) trajList4(:,9)];
        area1(:,5) = trajList1(i,9);
        area1(:,1) = trajNo;
        area1(:,2) = i;        
        area = vertcat(area,area1);
    end
    
end

