close all;

vr = VideoReader("Milk.mp4");
N = vr.NumFrames;

ref_frame = readFrame(vr);

vw = VideoWriter('mi_r.mp4', 'MPEG-4');
open(vw);

vr.CurrentTime = 0;

for i = 1 : N
    f = readFrame(vr);
    [frame, percent] = levelMilk(f, ref_frame);
    
    writeVideo(vw, double(frame));
    
    fprintf('frame: %d, filled: %d%%\n', i, percent);
end

close(vw);

return;
frames = read(vr, [1, Inf]);

%implay(frames);
