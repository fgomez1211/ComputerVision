
%Elaborado por: Fernando Gómez
%Exámen Parcial: Visión por Computador

%El siguiente Script lee la imagen de un engranaje y la procesa para
%encontrar el numero de dientes y radio externo del mismo.

clear all;

%Lectura de imagen
frame=imread('Gear.png');
nexttile;
imshow(frame);
title('Imagen Original');

%Conversión de RGB a Gray
ImgGray=rgb2gray(frame);
nexttile;
imshow(ImgGray);
title('Imagen RGB a Escala de Grises');


%Binarización y Complemento de la imagen.
BW=bwareaopen(imbinarize(ImgGray),30);
nexttile;
imshow(BW);
title('Imagen Binarizada');

BW2=imcomplement(BW);
nexttile;
imshow(BW2);
title('Imagen Complementada');


%Cálculo del área y el radio externo.
area=bwarea(BW2);
radio=sqrt(area/pi);
radio;

%Aplicación de Convex Hull. Muestra la región máxima
%que puede ocupar la región de interés.
im2=bwconvhull(BW2,'objects');


%Erosión: Disk,10. Hace una erosión en forma de disco con una intensidad de
%25. 
im3=imerode(im2,strel('disk',20));
nexttile;
imshow(im3);
title('Sección a remover');


%Remoción del área para dejar solamente los dientes. A la hora de realizar
%la operación, se obtienen los dientes.
BW2(im3)=0;
nexttile;
imshow(BW2);
title('Dientes');


%Identificación de objetos.
[l,n]=bwlabel(BW2);

%Despliegue de resultados:
fprintf('El engranaje tiene %f dientes y un radio de %f pixeles',n,radio)
