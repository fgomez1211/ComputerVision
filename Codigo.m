#Adquisición de Imagenes

imaqhwinfo('macvideo')

vid = videoinput('macvideo',1,'YCbCr422_1920x1080')
vid.ReturnedColorspace = 'rgb';
src = getselectedsource(vid);
vid.FramesPerTrigger = 1;

figure; 
for i=0:1
    frame=getsnapshot(vid);
    imshow(frame)
    pause(0.001);
end

#