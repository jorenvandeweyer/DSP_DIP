close all;

vr_gr = VideoReader("GreenScreen.mp4");
vr_mi = VideoReader("Milk.mp4");

N_gr = vr_gr.NumFrames;
N_mi = vr_mi.NumFrames;

ref_frame = readFrame(vr_gr);

mask = createMaskGS(ref_frame, [50 50 555 555], [50 555 555 50]);

vw = VideoWriter('gs_r.mp4', 'MPEG-4');
vw.Quality = 30;
open(vw);

vr_gr.CurrentTime = 0;
vr_mi.CurrentTime = 0;

for i = 1 : N_gr
    fprintf('calculating frame: %d\n', i);
    
    if (vr_mi.CurrentTime == vr_mi.Duration) 
        vr_mi.CurrentTime = 0;
    end
    
    f1 = readFrame(vr_gr);
    f2 = readFrame(vr_mi);
    
    frame = greenscreen(f1, f2, mask);
    
    writeVideo(vw,frame);
end

close(vw);

return;