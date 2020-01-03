function [frame, percent] = levelMilk(frame, ref)
    diff = minus(frame, ref);
    gray = rgb2gray(diff);
    
    bw = imbinarize(gray, 'global');
    
    se=strel('disk',5);
    frame = imopen(bw, se);
    se=strel('disk',10);
    frame = imclose(frame, se);
    
    square = frame(320:830,560:580,:);
    line = square(:);
    percent = uint8(sum(line) / size(line, 1) * 100);
end

