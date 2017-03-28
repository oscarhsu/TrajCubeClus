function coreCount = corecube( trajList, overlap )
%count track number each cube intersect
%coreCount = corecube(user3trajList(:,[5 1]), totalArea2);
    [n,~] = size(trajList);
    coreCount = zeros(n,5);
    coreCount(:,1:2) = trajList;
    coreCount(:,3) = (1:n)';
        
    for i = 1:n
        t = coreCount(i,1);
        c = coreCount(i,2);
        count = length(unique(overlap(overlap(:,1) == t & overlap(:,2) == c,3)));
        count = count + length(unique(overlap( overlap(:,3) == t & overlap(:,4) == c,1)));
        coreCount(i,4) = count;
    end
end