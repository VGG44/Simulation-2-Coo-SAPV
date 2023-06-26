function [genera] = aleatorio4(generacion2)

% Inicializa la celda de subvectores
year4 = cell(1, 12);

% Define los tamaños de los subvectores
tam_meses = [744 672 744 720 744 720 744 744 720 744 720 744];

% Divide el vector original en subvectores de distinto tamaño
ind4 = 1;
for i = 1:12
    year4{i} = generacion2(ind4:ind4+tam_meses(i)-1);
    ind4 = ind4 + tam_meses(i);
    
    % Divide cada subvector en subvectores de tamaño fijo
    hora_dia = 24;
    mes = cell(1, length(year4{i})/hora_dia);
    for j = 1:length(mes)
        inicio = (j-1)*hora_dia + 1;
        fin = j*hora_dia;
        mes{j} = year4{i}(inicio:fin);
    end
    year4{i} = mes;
end

% Desordena los valores de los subvectores
for w = 1:12
    year4{w} = year4{w}(randperm(length(year4{w})));
end


year4 = extract_cell_arrays(year4);

genera = vertcat(year4{:});

clear i;
clear n;
clear w;
