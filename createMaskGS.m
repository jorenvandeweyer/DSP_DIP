function [mask, coords] = createMaskGS(frame, xi, yi)
    color_mask = roipoly(frame,xi,yi);
    
%     figure; imshow(frame);
    ind = find(color_mask);
    red = immultiply(color_mask, frame(:,:,1));
    green = immultiply(color_mask, frame(:,:,2));
    blue = immultiply(color_mask, frame(:,:,3));

    median = [mean(double(red(ind))) mean(double(green(ind))) mean(double(blue(ind)))];
    standd = [std(double(red(ind))) std(double(green(ind))) std(double(blue(ind)))];

    mask = colorseg('euclidean', frame, 27*max(standd), median);

    y1 = find(any(mask, 2), 1, 'first');
    y2 = find(any(mask, 2), 1, 'last');
    x1 = find(any(mask, 1), 1, 'first');
    x2 = find(any(mask, 1), 1, 'last');
    
%     figure; imshow(mask);
%     hold on;
%     plot(x1, y1, '-+r', 'MarkerSize', 50, 'LineWidth', 5);
%     plot(x1, y2, '-+r', 'MarkerSize', 50, 'LineWidth', 5);
%     plot(x2, y1, '-+r', 'MarkerSize', 50, 'LineWidth', 5);
%     plot(x2, y2, '-+r', 'MarkerSize', 50, 'LineWidth', 5);

    coords = [x1 x2; y1 y2];
    mask = cat(3, mask, mask, mask);
    
%     figure;
%     plot3(red(ind),green(ind), blue(ind),'*')
%     xlim([0,256])
%     ylim([0,256])
%     zlim([0,256])
end

