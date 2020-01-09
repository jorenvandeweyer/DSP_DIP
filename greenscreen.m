function frame = greenscreen(f1, f2, mask, coords)    
    x1 = coords(1,1);
    x2 = coords(1,2);
    y1 = coords(2,1);
    y2 = coords(2,2);    

%     figure; imshow(f1);
%     figure; imshow(f2);

    f2 = imresize(f2, (y2 - y1)/1080);
    
%     f2_wrong = imtranslate(f2, [x1, y1]);

    [h1, w1, l1] = size(f1);
    [h2, w2, ~] = size(f2);

    blank = zeros(h1, w1, l1, 'uint8');

    blank(y1:y1+h2-1,x1:x1+w2-1,:) = f2;

    f2 = blank;

    f1 = times(f1, uint8(~mask));
    f2 = times(f2, uint8(mask));
%     figure; imshow(f1);
%     figure; imshow(f2);

    frame = plus(f1, f2);
%     figure; imshow(frame);
end

