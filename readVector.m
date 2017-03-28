function A = readVector(filename)
    fileID = fopen(filename,'r');
    if fileID == -1
        A = [];
    else
        A = fscanf(fileID,'%d,%f,%f,%f',[4 Inf]);
        A = A';
    end
    fclose(fileID);
end