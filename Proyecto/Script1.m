


%Este ciclo identifica la carta en base a la cantidad de objetos.
for n = 1:num
    if n==num
        ncarta=objetos-4;
        if ncarta==1
            ncarta = 'As';
            fprintf('La carta es un %s de %s',floor(ncarta),resultado)
        elseif ncarta==12
            ncarta = 10;
            fprintf('La carta es un %f de %s',floor(ncarta),resultado)
        else
            fprintf('La carta es un %f de %s',floor(ncarta),resultado)
        end
    end
end