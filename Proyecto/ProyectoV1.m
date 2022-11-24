
%Se cierran las ventanas, se borran las variables y cerca el objeto que
%contiene los parametros de la cartas.
close all;
clear all;
clc;
load('adt.mat');


%El Script0 corresponde a la captura de la imagen desde la fuente.
Script0;


%El script image_rotation realizará una rotación de la carta.
ImgGray=rgb2gray(frame);


% Se aplica el filtro de erosión usando como elemento estructurante (strel)
% un diamante con itensidad 0.
SE=strel('diamond',0);
Imorph=(imerode(ImgGray,SE));


%Aplicación del Filtro Morfológico Roberts.
ImgRoberts=edge(Imorph,'roberts');

%Binarización de la Imagen (Quita la escala de grises y lo deja en terminos
%de 1 y 0.
BW2=imbinarize(Imorph);

%Complemento de la imagen (intercambia los blancos y negros)
J=imcomplement(BW2);


%Genera las propiedades de todos los objetos dentro la carta
stats=regionprops(J,'BoundingBox','Area','EulerNumber');

%Detecta el número de objetos en la carta
[L,num]=bwlabel(J,4);
objetos=num-1;


%Encuentra el numero y el objeto. Crea un BoundingBox alreder de los
%mismos.
for k = 2:4
    thisBB = stats(k).BoundingBox;
    rectangle('Position',thisBB,'EdgeColor','b','LineWidth',1);
end


%Se busca el valor del área del objeto 3 dentro de las propiedades el cual
%corresponde al simbolo de la tarjeta.
area3=stats(3).Area;


%Este ciclo contiene el rango de áreas de los 4 simbolos. Buscara
%identificar el valor de la variable 'area' dentro de los 4 rangos. Como
%resultado se obtendrá el tipo de carta.

for i=1:4
    amin=adt(i).Amin;
    amax=adt(i).Amax ;   
    if (amin<=area3) && (area3<=amax)
        resultado=adt(i).nombre;
    end 
end



%Para diferenciar entre las cartas del 1 al 10 y las J, Q y K, se utiliza
%el parámetro 'num'. Una carta del 1 al 10 tendrá como máximo 17 objetos.
%Por tanto, cualquier tarjeta con un 'num' arriba de 17, será una J, Q o K.
%Se realizaron 2 scripts:

if or(area3 <2000, area3>4500)
    fprintf('No es posible detectar el simbolo de la carta')
else
    if num<=17 && num>=5
        Script1
    else
        Script2
    end
end

