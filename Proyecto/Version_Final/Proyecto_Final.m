
%Proyecto_Final.m
%Este módulo tiene como objetivo identificar cartas de juego (número y
%símbolo). Este archivo es el principal del proyecto, que a su vez necesita
%los archivos 'Script_main.m', 'Script0.m', 'Script1.m' y 'Script2.m'.


%Se cierran las ventanas, se borran las variables y cerca el objeto que
%contiene los parametros de la cartas.
close all;
clear all;


%La estructura adt.mat contiene máximos, minimos que servirán para realizar
%la comparación entre los objetos para lograr el reconocimiento.
load('adt.mat');

%Se abre una figura para la proyección de las capturas a realizar y los
%respectivos resultados.
figure;

%El siguiente código realiza un ciclo para procesar una cierta cantidad de
%imagenes. Esta cantidad esta almacenada en la variable 'scan'. Una vez el
%ciclo alcance el valor establecido se finalizará la captura y
%reconocimiento de imagenes.
scan=5;

for l=1:scan;
    Script_main
    resultados(l).carta=carta;
    resultados(l).resultado=Resultado;
    resultados(l).tiempo=tiempo;
    pause(5);
    if l==scan;
        fprintf('Ciclo finalizado. Se han procesado %f cartas:',scan)
        for m=1:length(resultados)
            resultados(m).resultado
        end
        tpromedio=mean([resultados.tiempo]);
        fprintf('Tiempo promedio de reconocimiento: %f',tpromedio);
    end
end
