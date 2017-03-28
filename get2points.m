function cubes = get2points( cubes, distX, distY )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    distX = distX / 2;
    distY = distY / 2;
    [n,~] = size(cubes);
    for i = 1:n
        p = [0 0 0 0];
        if cubes(i,4) == 0
            p(1) = cubes(i,2) - distX;
            p(2) = cubes(i,3);
            p(3) = cubes(i,2) + distX;
            p(4) = cubes(i,3);
        elseif 45 > cubes(i,4) && cubes(i,4) > 0
            d = distX * tand(cubes(i,4));
            p(1) = cubes(i,2) - distX;
            p(2) = cubes(i,3) - d;
            p(3) = cubes(i,2) + distX;
            p(4) = cubes(i,3) + d;
        elseif cubes(i,4) == 45
            p(1) = cubes(i,2) - distX;
            p(2) = cubes(i,3) - distY;
            p(3) = cubes(i,2) + distX;
            p(4) = cubes(i,3) + distY;            
        elseif 90 > cubes(i,4) && cubes(i,4) > 45
            d = distY / tand(cubes(i,4));
            p(1) = cubes(i,2) - d;
            p(2) = cubes(i,3) - distY;
            p(3) = cubes(i,2) + d;
            p(4) = cubes(i,3) + distY;
        elseif cubes(i,4) == 90
            p(1) = cubes(i,2);
            p(2) = cubes(i,3) - distY;
            p(3) = cubes(i,2);
            p(4) = cubes(i,3) + distY;    
        elseif 135 > cubes(i,4) && cubes(i,4) > 90
            d = distY / tand(cubes(i,4));
            p(1) = cubes(i,2) - d;
            p(2) = cubes(i,3) - distY;
            p(3) = cubes(i,2) + d;
            p(4) = cubes(i,3) + distY;
        elseif cubes(i,4) == 135            
            p(1) = cubes(i,2) + distX;
            p(2) = cubes(i,3) - distY;
            p(3) = cubes(i,2) - distX;
            p(4) = cubes(i,3) + distY;  
        elseif 180 > cubes(i,4) && cubes(i,4) > 135
            d = distX * tand(cubes(i,4));
            p(1) = cubes(i,2) + distX;
            p(2) = cubes(i,3) + d;
            p(3) = cubes(i,2) - distX;
            p(4) = cubes(i,3) - d;
        elseif cubes(i,4) == 180 || cubes(i,4) == -180          
            p(1) = cubes(i,2) + distX;
            p(2) = cubes(i,3);
            p(3) = cubes(i,2) - distX;
            p(4) = cubes(i,3);
        elseif -135 > cubes(i,4) && cubes(i,4) > -180
            d = distX * tand(cubes(i,4));
            p(1) = cubes(i,2) + distX;
            p(2) = cubes(i,3) + d;
            p(3) = cubes(i,2) - distX;
            p(4) = cubes(i,3) - d;
        elseif cubes(i,4) == -135
            p(1) = cubes(i,2) + distX;
            p(2) = cubes(i,3) + distY;
            p(3) = cubes(i,2) - distX;
            p(4) = cubes(i,3) - distY;  
        elseif -90 > cubes(i,4) && cubes(i,4) > -135
            d = distY / tand(cubes(i,4));
            p(1) = cubes(i,2) + d;
            p(2) = cubes(i,3) + distY;
            p(3) = cubes(i,2) - d;
            p(4) = cubes(i,3) - distY;
        elseif cubes(i,4) == -90
            p(1) = cubes(i,2);
            p(2) = cubes(i,3) + distY;
            p(3) = cubes(i,2);
            p(4) = cubes(i,3) - distY;   
        elseif -45 > cubes(i,4) && cubes(i,4) > -90
            d = distY / tand(cubes(i,4));
            p(1) = cubes(i,2) + d;
            p(2) = cubes(i,3) + distY;
            p(3) = cubes(i,2) - d;
            p(4) = cubes(i,3) - distY;
        elseif cubes(i,4) == -45
            p(1) = cubes(i,2) - distX;
            p(2) = cubes(i,3) + distY;
            p(3) = cubes(i,2) + distX;
            p(4) = cubes(i,3) - distY;  
        elseif 0 > cubes(i,4) && cubes(i,4) > -45
            d = distX * tand(cubes(i,4));
            p(1) = cubes(i,2) - distX;
            p(2) = cubes(i,3) - d;
            p(3) = cubes(i,2) + distX;
            p(4) = cubes(i,3) + d;
        else
            disp('ERROR');
            continue;
        end
        cubes(i,7:10) = p;
    end
end

