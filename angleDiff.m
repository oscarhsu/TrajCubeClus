function result = angleDiff(a,b)
    result = abs(a - b);
    if length(a) > 1
        index = find(result > 180);
        result(index) = 360 - result(index);
    else
        if result > 180
                result = 360 - result;
        end
    end
end