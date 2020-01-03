function [mask] = createMaskGS(frame, xi, yi)
    color_mask = roipoly(frame,xi,yi);

    ind = find(color_mask);
    red = immultiply(color_mask, frame(:,:,1));
    green = immultiply(color_mask, frame(:,:,2));
    blue = immultiply(color_mask, frame(:,:,3));

    median = [mean(double(red(ind))) mean(double(green(ind))) mean(double(blue(ind)))];
    standd = [std(double(red(ind))) std(double(green(ind))) std(double(blue(ind)))];

    mask = colorseg('euclidean', frame, 25*max(standd), median);

    mask = cat(3, mask, mask, mask);
%     g=cat(3,red,green,blue);

%     figure; imshow(g)
%     figure; imshow(double(rgb2gray(f1))+5*double(mask),[]);

%     figure;
%     plot3(red(ind),green(ind), blue(ind),'*')
%     xlim([0,256])
%     ylim([0,256])
%     zlim([0,256])

%     figure; imshow(SEG);

end

