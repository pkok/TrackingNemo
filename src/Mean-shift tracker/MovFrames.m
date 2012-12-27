function MovFrames()
    vid='IMG_2277.MOV';
    M=VideoReader(vid);
    frames=read(M);
    for i=1:size(frames,4)
        frm=frames(:,:,:,i);
        pth=strcat('sid/image',num2str(100+i),'.jpg');
        imwrite(frm,pth);
    end
end