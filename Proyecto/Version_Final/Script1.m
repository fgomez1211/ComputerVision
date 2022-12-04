


%Este ciclo identifica la carta en base a la cantidad de objetos.
for n = 1:num
    if n==num
        ncarta=objetos-4;
        if ncarta==1
            ncarta = 'As';
        elseif ncarta==12
            ncarta = 10;
        end
    end
end

