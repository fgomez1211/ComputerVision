
%Inicia la medición del tiempo del ciclo.
tic

%Ejecuta el Script0. Este se encarga de realizar la captura de las
%imagenes.
Script0


%Se convierta la imagen a escala de grises.
ImgGray=im2gray(frame);

% Se aplica el filtro de erosión usando como elemento estructurante (strel)
% un diamante con itensidad 0.
SE=strel('diamond',0);
Imorph=(imerode(ImgGray,SE));

%Binarización de la Imagen (Quita la escala de grises y lo deja en terminos
%de 1 y 0.
BW=imbinarize(Imorph);

%Complemento de la imagen (intercambia los blancos y negros)
J=imcomplement(BW);

%Se eliminan los puntos que tengan formen un conjunto menor a 3 pixeles y
%se vuelve a complementar la imagen.
BW2=bwareaopen(J,3);
J=imcomplement(BW2);


%Genera las propiedades de todos los objetos dentro la carta y numera cada
%uno de los objetos, almacenandolos en L,num. Como también detecta el fondo
%como un objeto, el conteo de objetos reales se almacena en 'objetos;.
stats=regionprops(BW2,'BoundingBox','Area','EulerNumber');
[L,num]=bwlabel(BW2,4);
objetos=num-1;



%Generacion de propiedades en la imagen binarizada. Se realiza para
%encontrar la ubicación de la carta completa y no solo los objetos dentro
%de la misma. Se utilizará para obtener la imagen de la carta dentro de la
%imagen original.
stats2=regionprops(J,'BoundingBox','Area');
carta=imcrop(frame,stats2(1).BoundingBox);
J2=imcrop(J,stats2(1).BoundingBox);


%Encuentra el numero y el objeto. Crea un BoundingBox alreder de los
%mismos.
for k = 2:length(stats)
    thisBB = stats(k).BoundingBox;
    rectangle('Position',thisBB,'EdgeColor','b','LineWidth',1)
end


%Se busca el valor del área del objeto 3 dentro de las propiedades el cual
%corresponde al simbolo de la tarjeta.
area3=stats(3).Area;


%Se realiza una validación dentro de la estructura 'adt.m'. Se toma el
%valor de 'area3' y se compara con los valores maximos y minimos y de
%acuerdo a donde se encuentre, retornará el símbolo de la carta.
for i=1:4
    amin=adt(i).Amin;
    amax=adt(i).Amax ;   
    if (amin<=area3) && (area3<=amax)
        simbolo=adt(i).nombre;
    end 
end


%Para diferenciar entre las cartas del 1 al 10 y las J, Q y K, se utiliza
%el parámetro 'num'. Una carta del 1 al 10 tendrá como máximo 17 objetos.
%Por tanto, cualquier tarjeta con un 'num' arriba de 17, será una J, Q o K.
%Se realizaron 2 scripts:

%Script1 valida cartas del 1 al 10.
%Script2 valida las cartas J, Q y K.

if or(area3 <2000, area3>4500)
    fprintf('No es posible detectar el simbolo de la carta')
else
    if num<=17 && num>=5
        Script1
        ncarta=num2str(ncarta)
        Resultado=[ncarta ' de' simbolo];
    else
        Script2
        Resultado=[lcarta ' de' simbolo];
    end
end



%Realiza un plot de la imagen original almacenada en 'frame' con el título
%'Imagen Original' y como subplot la imagen recortada donde se encuentra la
%carta con el título de 'Resultado'.
subplot(2,2,1), imshow(frame);
title('Imagen Original');
subplot(2,2,2), imshow(ImgGray);
title('Imagen en Escala de Grises');
subplot(2,2,3), imshow(J2);
title('Imagen Procesada');
subplot(2,2,4), imshow(carta);
title(Resultado);

%Finaliza el tiempo de medición del tiempo del ciclo.
tiempo=toc;


