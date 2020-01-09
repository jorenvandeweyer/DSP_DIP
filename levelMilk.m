function [frame, percent] = levelMilk(frame, ref, mask)
    ref_gray = rgb2gray(ref);
    fig_gray = rgb2gray(frame);

    frame = fig_gray - ref_gray;

%     figure; imshow(frame);
    frame = imadjust(frame);
%     figure; imshow(frame);
    
%     frame = frame - ref;
%     frame = rgb2gray(frame);
%     frame = imadjust(frame);

    frame = imbinarize(frame, 'global');
%     figure; imshow(frame);

    se=strel('disk',5);
    frame = imopen(frame, se);
    se=strel('disk',10);
    frame = imclose(frame, se);

    selected = frame & mask;
    percent = uint8( sum(selected(:)) / sum(mask(:)) * 100);
end
