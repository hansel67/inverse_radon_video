function InvRadonVideo
   
    filename  = 'input';
    im = double(imread(strcat(filename,'.jpg')))/255; % IMAGE
    num_frames = 180;
    s = size(im,1);
    
    R = im(:,:,1);
    G = im(:,:,2);
    B = im(:,:,3);
    
    r = VideoWriter('output.mp4','MPEG-4');
    
    open(r);
    
    for i = 1:num_frames
        
        RI = iradon(radon(R,1:i),1:i);
        GI = iradon(radon(G,1:i),1:i);
        BI = iradon(radon(B,1:i),1:i);
        
        mR = min(min(RI));
        mG = min(min(GI));
        mB = min(min(BI));
        
        MR = max(max(RI));
        MG = max(max(GI));
        MB = max(max(BI));
        
        im(1:s,1:s,1) = (RI(1:s,1:s)-mR)/(MR-mR);
        im(1:s,1:s,2) = (GI(1:s,1:s)-mG)/(MG-mG);
        im(1:s,1:s,3) = (BI(1:s,1:s)-mB)/(MB-mB);
        
        writeVideo(r,im);
        
        i
    end
    
    close(r);
    
end
