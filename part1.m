close all;

vr = VideoReader("Milk.mp4");
N = vr.NumFrames;

ref_frame = readFrame(vr);

%figure
c = [560, 580, 580, 560];
r = [320, 320, 830, 830];
mask = roipoly(ref_frame, c, r);

vw = VideoWriter('part1_result.mp4', 'MPEG-4');
open(vw);

vr.CurrentTime = 0;

for i = 1 : N
    f = readFrame(vr);
    [frame, percent] = levelMilk(f, ref_frame, mask);

    writeVideo(vw, double(frame));

    fprintf('frame: %d, filled: %d%%\n', i, percent);
end

close(vw);
