function result = getRepresentLine( area,trajHur,perc )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    result = [];
    coreCount = corecube(trajHur(:,[5 1]), area);
    m = max(coreCount(:,4));
    minIsec = getPerc(coreCount,perc);
    while m >= minIsec && ~isempty(m)
        tr = coreCount(coreCount(:,4) == m,:);

            i=1;
            a1 = find(area(:,1) == tr(i,1) & area(:,2) == tr(i,2));
            a = area(a1,6);
            b1 = find(area(:,3) == tr(i,1) & area(:,4) == tr(i,2));
            b = area(b1,5);
            a = unique(vertcat(tr(i,3),a,b));
            result = vertcat(result,getOne(trajHur(a,:)));
            a1 = unique(vertcat(a1,b1));
            area = removeArea(area,a);
            coreCount = corecube(trajHur(:,[5 1]), area);
        m = max(coreCount(:,4));
    end
    
end

function minIsec = getPerc(coreCount,perc)
    m = max(coreCount(:,4));
    countHist = hist(coreCount(:,4),0:m);
    sumCount = sum(countHist);
    countHist2 = zeros(1,m+1);
    countHist2(1) = countHist(1);
    perc2 = 1-perc;
    sumCount2 = sumCount*perc2;
    for i = 1:m
        countHist2(i+1) = countHist2(i) + countHist(i+1);
        if countHist2(i+1) >= sumCount2
            minIsec = i;
            break;
        end
    end
end

function area = removeArea(area,a)
    [n,~] = size(a);
    for i = 1:n
        area(area(:,5) == a(i) | area(:,6) == a(i),:) = [];
    end
end

function result = getOne(trajHur)
    result = zeros(1,4);
    result(1) = mean(trajHur(:,9));
    result(6) = mean(trajHur(:,10));
    result(2) = mean(trajHur(:,3));
    result(3) = mean(trajHur(:,4));
    result(4) = avgAngle(trajHur(:,8));
    result(5) = length(trajHur(:,8));

end

function result = avgAngle(angles)
    y = sum(sind(angles)); 
    x= sum(cosd(angles));
    result = round(atan2d(y,x));
end