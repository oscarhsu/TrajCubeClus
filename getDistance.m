%get distance by chord fomula from GPS coordinate
%return in meter
function d = getDistance(Lat1,Long1,Lat2,Long2)
    deltaX = cosd(Lat2)*cosd(Long2) - cosd(Lat1) * cosd(Long1);
    deltaY = cosd(Lat2)*sind(Long2) - cosd(Lat1) * sind(Long1);
    deltaZ = sind(Lat2) - sind(Lat1);
    C = norm([deltaX deltaY deltaZ],2);
    deltaSigma = 2 * asin(C/2);
    d = round( 6371 * 1000 * deltaSigma );
end
