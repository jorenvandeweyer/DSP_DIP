function frame = greenscreen(f1, f2, mask)    
    x1 = 20;
    x2 = 1296;
    y1 = 18;
    y2 = 785;    

    f2 = imresize(f2, (y2-y1)/1080);

    [h1, w1, l1] = size(f1);
    [h2, w2, ~] = size(f2);

    blank = zeros(h1, w1, l1, 'uint8');

    blank(y1:y1+h2-1,x1:x1+w2-1,:) = f2;

    f2 = blank;

    f1 = times(f1, uint8(~mask));
    f2 = times(f2, uint8(mask));

    frame = plus(f1, f2);
end

