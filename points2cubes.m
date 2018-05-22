function  [resultMat,mapping]  = points2cubes( myMat,distX,distY,distTime )
% Algorithm 1 preprocessing in paper
%   input: myMat, points sequence of a trajectory.
%          distX, Epsilon_x in paper, longitude distance.
%          distY, Epsilon_y in paper, latitude distance.
%          distTime, Tau in paper, time distance.

     LongColNum = 3;
     LatColNum  = 4;

    [n,~] = size(myMat);
    myMat2 = zeros(n,10);
    indexTop = 1;

     mapping = zeros(n,4);
     mapping(:,3) = (1:n)';
     mapping(1,4) = 1;
     
     myStart = 1;
     minX = myMat(1,LongColNum);
     maxX = myMat(1,LongColNum);
     minY = myMat(1,LatColNum);
     maxY = myMat(1,LatColNum);
     minTime = myMat(1,2);
     maxTime = myMat(1,2);     
     newMinX = minX;
     newMaxX = maxX;
     newMinY = minY;
     newMaxY = maxY;
     newMinTime = minTime;
     newMaxTime = maxTime;
     
     for i = 2:n
         flag = 1;
         if (myMat(i,2) - myMat(myStart,2)) > distTime
             flag = 0;
         end
   
         if flag
         if myMat(i,LongColNum) > maxX 
            if myMat(i,LongColNum) - minX < distX
                newMaxX = myMat(i,LongColNum);
            else
                flag = 0;
            end
         elseif myMat(i,LongColNum) < minX 
             if maxX - myMat(i,LongColNum) < distX
                 newMinX = myMat(i,LongColNum);
             else
                 flag = 0;
             end
         end
         end
         
         if flag
             if myMat(i,LatColNum) > maxY 
                if myMat(i,LatColNum) - minY < distY
                    newMaxY = myMat(i,LatColNum);
                else
                    flag = 0;
                end
             elseif myMat(i,LatColNum) < minY
                 if maxY - myMat(i,LatColNum) < distY
                     newMinY = myMat(i,LatColNum);
                 else
                     flag = 0;
                 end
             end
         end

         if flag
             minX = newMinX;
             maxX = newMaxX;
             minY = newMinY;
             maxY = newMaxY;             
             mapping(i,4) = indexTop;
         else

            myEnd = i - 1;
            if myEnd == myStart
             if myStart == 1
                 myEnd = 2;
             elseif myStart < n
                 myEnd = i;
             end
            end
            myMat2(indexTop,9) = myMat(myStart,2);
            myMat2(indexTop,10) = myMat(myEnd,2);
            myMat2(indexTop,11) = myMat(myStart,3);
            myMat2(indexTop,12) = myMat(myEnd,3);
            myMat2(indexTop,13) = myMat(myStart,4);
            myMat2(indexTop,14) = myMat(myEnd,4);     

            myMat2(indexTop,2) = (myMat2(indexTop,9) + myMat2(indexTop,10)) / 2;
            myMat2(indexTop,3) = (minX + maxX) / 2;
            myMat2(indexTop,4) = (minY + maxY) / 2;                 

            myMat2(indexTop,6) = getDistance( myMat(myStart,LatColNum), myMat(myEnd,LongColNum)  ,myMat(myStart,LatColNum) ,myMat(myStart,LongColNum) );
            if ( myMat(myEnd,LongColNum) - myMat(myStart,LongColNum) ) < 0
                myMat2(indexTop,6) = - myMat2(indexTop,6);
            end
            myMat2(indexTop,7) = getDistance( myMat(myEnd,LatColNum) ,  myMat(myStart,LongColNum),myMat(myStart,LatColNum) ,myMat(myStart,LongColNum));
            if (myMat(myEnd,LatColNum) - myMat(myStart,LatColNum)) < 0
                myMat2(indexTop,7) = - myMat2(indexTop,7);
            end
            myMat2(indexTop,8) = round( atan2d( myMat2(indexTop,7) , myMat2(indexTop,6) ) );

            minX = myMat(i,LongColNum);
            maxX = myMat(i,LongColNum);
            minY = myMat(i,LatColNum);
            maxY = myMat(i,LatColNum);
            minTime = myMat(i,2);
            maxTime = myMat(i,2);    
             newMinX = minX;
             newMaxX = maxX;
             newMinY = minY;
             newMaxY = maxY;
             
            indexTop = indexTop + 1;
             
             mapping(i,4) = indexTop;
             
             myStart = i;
         end

     end

     if n == myStart && myStart > 1
         myEnd = n;
         myStart = n-1;   
     else
         myEnd = n;
     end
    myMat2(indexTop,6) = myMat(myEnd,LongColNum) - myMat(myStart,LongColNum);
    myMat2(indexTop,7) = myMat(myEnd,LatColNum) - myMat(myStart,LatColNum);
    myMat2(indexTop,8) = round( atan2d( myMat2(indexTop,7) , myMat2(indexTop,6) ) );   

    myMat2(indexTop,9) = myMat(myStart,2);
    myMat2(indexTop,10) = myMat(myEnd,2);
    myMat2(indexTop,11) = myMat(myStart,3);
    myMat2(indexTop,12) = myMat(myEnd,3);
    myMat2(indexTop,13) = myMat(myStart,4);
    myMat2(indexTop,14) = myMat(myEnd,4);     

    myMat2(indexTop,2) = (myMat2(indexTop,9) + myMat2(indexTop,10)) / 2;             

     myMat2(indexTop,3) = (minX + maxX) / 2;
     myMat2(indexTop,4) = (minY + maxY) / 2;
     
     resultMat = myMat2( 1:indexTop ,: );
end

