

%Se obtiene la fuente de Video.
vid = videoinput('macvideo','1','YCbCr422_1920x1080');
vid.ReturnedColorspace = 'rgb';
src = getselectedsource(vid);
vid.FramesPerTrigger = 1;


%Se crea la ventana y se realiza la captura, almacenandola en 'frame'
for i=0:1
    frame=getsnapshot(vid);
    pause(0.01);
end


% %Se se utilizar con imagenes previamente capturadas, comentar la sección
% %anterior y descomentar las siguientes 2 lineas
% frame=imread('');


