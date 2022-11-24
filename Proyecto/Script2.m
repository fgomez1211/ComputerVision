
%Obtiene el Número de Euler del objeto 2, que corresponde a la letra de la
%carta. Asimismo, el área del mismo objeto. Como resultado se obtiene la
%letra de la carta
neuler=stats(2).EulerNumber;
area2=stats(2).Area;

if num>17
    if neuler==-1
        ncarta='Q';
        fprintf('La carta es una %s de %s',ncarta,resultado)
    else
    for i=5:6
        val3=adt(i).Amin;
        val4=adt(i).Amax;   
        if (val3<=area2) && (area2<=val4)
            lcarta=adt(i).nombre;
            fprintf('La carta es una %s de %s',lcarta,resultado)
        end
    end
    end
end
