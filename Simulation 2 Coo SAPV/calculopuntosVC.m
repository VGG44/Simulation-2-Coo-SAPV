 %% funcion caso doble
function [HNS,HNS1,HNS2,sumaENS,sumaENA,sumaENS1,sumaENA1,sumaENS2,sumaENA2] = calculopuntosVC(soc,demanda1,generacion1,demanda2,generacion2,capacidadMax1,capacidadMax2,rendOut1,rendIn1,rendOut2,rendIn2,CoefPerd)

capacidadMin1 = capacidadMax1*0.2;
capInicial1 = capacidadMax1*0.8;
capacidadMin2 = capacidadMax2*0.2;
capInicial2 = capacidadMax2*0.8;

almacenamiento1 = zeros([8760 1]);
almacenamiento2 = zeros([8760 1]);
ENS1 = zeros([8760 1]);
ENS2 = zeros([8760 1]);
ENS = zeros([8760 1]);
ENA2 = zeros([8760 1]);
ENA1 = zeros([8760 1]);
ENA = zeros([8760 1]);
Def1 = zeros([8760 1]);
Def2 = zeros([8760 1]);
Aux1 = zeros([8760 1]);
Aux2 = zeros([8760 1]);
Pool1 = zeros([8760 1]);
Pool2 = zeros([8760 1]);
PerAux1 = zeros([8760 1]);
PerAux2 = zeros([8760 1]);
Ayud1 = zeros([8760 1]);
Ayud2 = zeros([8760 1]);
Exce1 = zeros([8760 1]);
Exce2 = zeros([8760 1]);
PerAyu1 = zeros([8760 1]);
PerAyu2 = zeros([8760 1]);

n=1;

%% almacenamiento
if generacion1(n) >= demanda1(n)
    almacenamiento1(n) = min(capInicial1 + (generacion1(n) - demanda1(n))*rendIn1 , capacidadMax1);
elseif generacion1(n) < demanda1(n)
    almacenamiento1(n) = max(capacidadMin1, capInicial1 - (demanda1(n) - generacion1(n))/rendOut1);
else
    disp('ERROR en datos de generacion/demanda');
    return;
end

if generacion2(n) >= demanda2(n)
    almacenamiento2(n) = min(capInicial2 + (generacion2(n) - demanda2(n))*rendIn2 , capacidadMax2);
elseif generacion2(n) < demanda2(n)
    almacenamiento2(n) = max(capacidadMin2, capInicial2 - (demanda2(n) - generacion2(n))/rendOut2);
else
    disp('ERROR en datos de generacion/demanda');
    return;
end

%% Def
if demanda1(n) < generacion1(n)
    Def1(n) = 0;
else    
    Def1(n) = demanda1(n) - generacion1(n) + (almacenamiento1(n)-capInicial1)*rendOut1;
end

if demanda2(n) < generacion2(n)
    Def2(n) = 0;
else    
    Def2(n) = demanda2(n) - generacion2(n) + (almacenamiento2(n)-capInicial2)*rendOut2;
end


%% Pool
Pool1(n) = max(almacenamiento1(n)-(soc*capacidadMax1), 0);
Pool2(n) = max(almacenamiento2(n)-(soc*capacidadMax2), 0);

%% Aux
if Def1(n) > 0
    Aux1(n)=min(Def1(n), Pool2(n));
else    
  Aux1(n) = 0;
end

if Def2(n) > 0
    Aux2(n)=min(Def2(n), Pool1(n));
else    
  Aux2(n) = 0;
end

%% ENS
ENS1(n) = Def1(n)- Aux1(n);
ENS2(n) = Def2(n)- Aux2(n);

%% PerAux
PerAux1(n) = CoefPerd* Aux1(n)^2;
PerAux2(n) = CoefPerd* Aux2(n)^2;

%% Exce
    Exce1(n) = 0;
    Exce2(n) = 0;

%% Ayud
Ayud1(n) = 0;
Ayud2(n) = 0;

%% PerAyu
PerAyu1(n) = CoefPerd* Ayud1(n)^2;
PerAyu2(n) = CoefPerd* Ayud2(n)^2;

%% ENA
ENA1(n) = 0;
ENA2(n) = 0;




%% calcular resto de puntos
for n = 2:8760

%% Almacenamiento
if generacion1(n) >= demanda1(n)
    almacenamiento1(n) = min(almacenamiento1(n-1) + (generacion1(n) - demanda1(n) + Ayud1(n-1) - PerAyu1(n-1))*rendIn1 - (Aux2(n-1) + PerAux2(n-1))/rendOut1, capacidadMax1);
elseif generacion1(n) < demanda1(n)
    almacenamiento1(n) = max(capacidadMin1, almacenamiento1(n-1) - (demanda1(n) - generacion1(n) + Aux2(n-1) + PerAux2(n-1))/rendOut1);
else
    disp('ERROR en datos de generacion/demanda');
    return;
end


if generacion2(n) >= demanda2(n)
    almacenamiento2(n) = min(almacenamiento2(n-1) + (generacion2(n) - demanda2(n) + Ayud2(n-1) - PerAyu2(n-1))*rendIn2 - (Aux1(n-1) + PerAux1(n-1))/rendOut2, capacidadMax2);
elseif generacion2(n) < demanda2(n)
    almacenamiento2(n) = max(capacidadMin2, almacenamiento2(n-1) - (demanda2(n) - generacion2(n) + Aux1(n-1) + PerAux1(n-1))/rendOut2);
else
    disp('ERROR en datos de generacion/demanda');
    return;
end

%% Def
if demanda1(n) < generacion1(n)
    Def1(n) = 0;
else    
    Def1(n) = demanda1(n) - generacion1(n) + (almacenamiento1(n)-almacenamiento1(n-1))*rendOut1 + Aux2(n-1) + PerAux2(n-1);
end

if demanda2(n) < generacion2(n)
    Def2(n) = 0;
else    
    Def2(n) = demanda2(n) - generacion2(n) + (almacenamiento2(n)-almacenamiento2(n-1))*rendOut2 + Aux1(n-1) + PerAux1(n-1);
end

%% Pool
Pool1(n) = max(almacenamiento1(n)-(soc*capacidadMax1), 0);
Pool2(n) = max(almacenamiento2(n)-(soc*capacidadMax2), 0);

%% Aux
if Def1(n) > 0
    Aux1(n) = min(Def1(n), Pool2(n));
else    
  Aux1(n) = 0;
end

if Def2(n) > 0
    Aux2(n)=min(Def2(n), Pool1(n));
else    
  Aux2(n) = 0;
end


%% PerAux
PerAux1(n) = CoefPerd* Aux1(n)^2;
PerAux2(n) = CoefPerd* Aux2(n)^2;

%% Exce
if generacion1(n)-demanda1(n) > 0
    Exce1(n) = max(capacidadMax1, almacenamiento1(n-1)+(generacion1(n)-demanda1(n))*rendIn1) -capacidadMax1;
else
    Exce1(n) = 0;
end

if generacion2(n)-demanda2(n) > 0
    Exce2(n) = max(capacidadMax2, almacenamiento2(n-1)+(generacion2(n)-demanda2(n))*rendIn2) -capacidadMax2;
else
    Exce2(n) = 0;
end

%% Ayud
Ayud1(n) = min(Exce2(n), (capacidadMax1-almacenamiento1(n))/rendOut1);
Ayud2(n) = min(Exce1(n), (capacidadMax2-almacenamiento2(n))/rendOut2);

%% PerAyu
PerAyu1(n) = CoefPerd* Ayud1(n)^2;
PerAyu2(n) = CoefPerd* Ayud2(n)^2;

%% ENS
ENS1(n) = Def1(n)- Aux1(n);
ENS2(n) = Def2(n)- Aux2(n);

%% ENA
ENA1(n) = Exce1(n)- Ayud2(n);
ENA2(n) = Exce2(n)- Ayud1(n);

end

%% Saca resultados totales

ENS = ENS1 + ENS2;
ENA = ENA1 + ENA2;

HNS=0;
HNS1=0;
HNS2=0;
for i = 1:8760
    if ENS(i) > 0.01
        HNS = HNS+1;
    else
        HNS = HNS;
    end
end

for i = 1:8760
    if ENS1(i) > 0.01
        HNS1 = HNS1+1;
    else
        HNS1 = HNS1;
    end
end

for i = 1:8760
    if ENS2(i) > 0.01
        HNS2 = HNS2+1;
    else
        HNS2 = HNS2;
    end
end

clear i;
clear n;

sumaENS = sum(ENS)/1000;
sumaENA = sum(ENA)/1000;
sumaENS1 = sum(ENS1)/1000;
sumaENA1 = sum(ENA1)/1000;
sumaENS2 = sum(ENS2)/1000;
sumaENA2 = sum(ENA2)/1000;

