 %% funcion caso simple
function [HNS,sumaENS,sumaENA] = calculopuntosVS(demanda,generacion,capacidadMax,rendOut,rendIn)

capacidadMin = capacidadMax*0.2;
capInicial = capacidadMax*0.8;
almacenamiento = zeros([8760 1]);
ENS = zeros([8760 1]);
ENA = zeros([8760 1]);

%% calcular primer punto con parámetros iniciales
n=1;
if generacion(n) >= demanda(n)
    almacenamiento(n) = min(capInicial + (generacion(n) - demanda(n))*rendIn , capacidadMax);
elseif generacion(n) < demanda(n)
    almacenamiento(n) = max(capacidadMin, capInicial - (demanda(n) - generacion(n))/rendOut);
else
    disp('ERROR en datos de generacion/demanda');
    return;
end

if demanda(n) < generacion(n)
    ENS(n) = 0;
else    
    ENS(n) = demanda(n) - generacion(n) + (almacenamiento(n)-capInicial)*rendOut;
end

if almacenamiento(n) < capacidadMax
    ENA(n) = 0;
else    
    ENA(n) = (generacion(n) - demanda(n))*rendIn - (almacenamiento(n) - capInicial);
end

%% calcular resto de puntos
for n = 2:8760
    if generacion(n) >= demanda(n)
            almacenamiento(n) = min(capacidadMax, almacenamiento(n-1) + (generacion(n) - demanda(n))*rendIn);
    elseif generacion(n) < demanda(n)
        almacenamiento(n) = max(capacidadMin, almacenamiento(n-1) - (demanda(n) - generacion(n))/rendOut);
    else
        disp('ERROR en datos de generacion/demanda');
        return;
    end
    
    if demanda(n) < generacion(n)
        ENS(n) = 0;
    else    
        ENS(n) = demanda(n) - generacion(n) + (almacenamiento(n) - almacenamiento(n-1))*rendOut;
    end
    
    if almacenamiento(n) < capacidadMax
        ENA(n) = 0;
    else    
        ENA(n) = (generacion(n) - demanda(n))*rendIn - (almacenamiento(n) - almacenamiento(n-1));
    end
  
end
%% Saca resultados totales

HNS=0;
for i = 1:8760
    if ENS(i) > 0.01
        HNS = HNS+1;
    else
        HNS = HNS;
    end
end

clear i;
clear n;

sumaENS = sum(ENS)/1000;
sumaENA = sum(ENA)/1000;
