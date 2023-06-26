%% main

x = 1:100;
soc2 =0.2;
soc3 =0.3;
soc4 =0.4;
soc5 =0.5;

PgBase1 = max(generacionmax1);
PgBase2 = max(generacionmax2);

LOLP01 = zeros([100 1]);
LOLE01 = zeros([100 1]);
LOLP02 = zeros([100 1]);
LOLE02 = zeros([100 1]);
LOLP2 = zeros([100 1]);
LOLE2 = zeros([100 1]);
LOLP3 = zeros([100 1]);
LOLE3 = zeros([100 1]);
LOLP4 = zeros([100 1]);
LOLE4 = zeros([100 1]);
LOLP5 = zeros([100 1]);
LOLE5 = zeros([100 1]);
LOLP21 = zeros([100 1]);
LOLE21 = zeros([100 1]);
LOLP31 = zeros([100 1]);
LOLE31 = zeros([100 1]);
LOLP41 = zeros([100 1]);
LOLE41 = zeros([100 1]);
LOLP51 = zeros([100 1]);
LOLE51 = zeros([100 1]);
LOLP22 = zeros([100 1]);
LOLE22 = zeros([100 1]);
LOLP32 = zeros([100 1]);
LOLE32 = zeros([100 1]);
LOLP42 = zeros([100 1]);
LOLE42 = zeros([100 1]);
LOLP52 = zeros([100 1]);
LOLE52 = zeros([100 1]);


media_acumuladap01 = zeros([100 1]);
media_acumuladae01 = zeros([100 1]);
media_acumuladap02 = zeros([100 1]);
media_acumuladae02 = zeros([100 1]);
media_acumuladap2 = zeros([100 1]);
media_acumuladae2 = zeros([100 1]);
media_acumuladap3 = zeros([100 1]);
media_acumuladae3 = zeros([100 1]);
media_acumuladap4 = zeros([100 1]);
media_acumuladae4 = zeros([100 1]);
media_acumuladap5 = zeros([100 1]);
media_acumuladae5 = zeros([100 1]);
media_acumuladap21 = zeros([100 1]);
media_acumuladae21 = zeros([100 1]);
media_acumuladap31 = zeros([100 1]);
media_acumuladae31 = zeros([100 1]);
media_acumuladap41 = zeros([100 1]);
media_acumuladae41 = zeros([100 1]);
media_acumuladap51 = zeros([100 1]);
media_acumuladae51 = zeros([100 1]);
media_acumuladap22 = zeros([100 1]);
media_acumuladae22 = zeros([100 1]);
media_acumuladap32 = zeros([100 1]);
media_acumuladae32 = zeros([100 1]);
media_acumuladap42 = zeros([100 1]);
media_acumuladae42 = zeros([100 1]);
media_acumuladap52 = zeros([100 1]);
media_acumuladae52 = zeros([100 1]);

adicENS01 = zeros([100 1]);
media_acumuladaENS01 = zeros([100 1]);
adicENS02 = zeros([100 1]);
media_acumuladaENS02 = zeros([100 1]);
adicENS2 = zeros([100 1]);
media_acumuladaENS2 = zeros([100 1]);
adicENS3 = zeros([100 1]);
media_acumuladaENS3 = zeros([100 1]);
adicENS4 = zeros([100 1]);
media_acumuladaENS4 = zeros([100 1]);
adicENS5 = zeros([100 1]);
media_acumuladaENS5 = zeros([100 1]);
adicENS21 = zeros([100 1]);
media_acumuladaENS21 = zeros([100 1]);
adicENS31 = zeros([100 1]);
media_acumuladaENS31 = zeros([100 1]);
adicENS41 = zeros([100 1]);
media_acumuladaENS41 = zeros([100 1]);
adicENS51 = zeros([100 1]);
media_acumuladaENS51 = zeros([100 1]);
adicENS22 = zeros([100 1]);
media_acumuladaENS22 = zeros([100 1]);
adicENS32 = zeros([100 1]);
media_acumuladaENS32 = zeros([100 1]);
adicENS42 = zeros([100 1]);
media_acumuladaENS42 = zeros([100 1]);
adicENS52 = zeros([100 1]);
media_acumuladaENS52 = zeros([100 1]);

adicENA01 = zeros([100 1]);
media_acumuladaENA01 = zeros([100 1]);
adicENA02 = zeros([100 1]);
media_acumuladaENA02 = zeros([100 1]);
adicENA2 = zeros([100 1]);
media_acumuladaENA2 = zeros([100 1]);
adicENA3 = zeros([100 1]);
media_acumuladaENA3 = zeros([100 1]);
adicENA4 = zeros([100 1]);
media_acumuladaENA4 = zeros([100 1]);
adicENA5 = zeros([100 1]);
media_acumuladaENA5 = zeros([100 1]);
adicENA21 = zeros([100 1]);
media_acumuladaENA21 = zeros([100 1]);
adicENA31 = zeros([100 1]);
media_acumuladaENA31 = zeros([100 1]);
adicENA41 = zeros([100 1]);
media_acumuladaENA41 = zeros([100 1]);
adicENA51 = zeros([100 1]);
media_acumuladaENA51 = zeros([100 1]);
adicENA22 = zeros([100 1]);
media_acumuladaENA22 = zeros([100 1]);
adicENA32 = zeros([100 1]);
media_acumuladaENA32 = zeros([100 1]);
adicENA42 = zeros([100 1]);
media_acumuladaENA42 = zeros([100 1]);
adicENA52 = zeros([100 1]);
media_acumuladaENA52 = zeros([100 1]);


for k = 1:100

    if k ~= 1
        [generacionmax1]=aleatorio(generacionmax1);
        [generacionmax2]=aleatorio(generacionmax2);
        [demanda1]=aleatorio(demanda1);
        [demanda2]=aleatorio(demanda2);
        [ONOFF]=aleafoto(TTF,TTR);
    end
 % normalizar valores de datos a la instalacion de ensayo

generacion1=generacionmax1.*ONOFF*PgBasemax1/PgBase1;
generacion2=2*generacionmax2.*ONOFF*PgBasemax2/PgBase2;

    if k ==1
    [year1d,year2d,yearg] = estaciones(demanda1,demanda2,generacion1);
    y = 1:96;

    figure
    plot(y, year1d);
    hold on;  % Mantener los ejes actuales
    plot(y, year2d);
    hold on
    plot(y, yearg);

    % Configurar etiquetas y leyenda
    xlabel('Hora(h:mm)');
    ylabel('Potencia(W)');
    legend('D1', 'D2', 'G');

    semanad1 = demanda1(1:168);
    semanad2 = demanda2(1:168);
    semanag1 = generacion1(1:168);
    semanag2 = generacion2(1:168);
    z = 1:168;

    figure
    plot(z, semanad1);
    hold on;  % Mantener los ejes actuales
    plot(z, semanad2);
    hold on
    plot(z, semanag1);
    hold on
    plot(z, semanag2);

    % Configurar etiquetas y leyenda
    xlabel('Fecha(dd/mm/aaaa)');
    ylabel('Potencia(W)');
    legend('D1', 'D2', 'G1', 'G2');
    end

[HNS01,sumaENS01,sumaENA01] = calculopuntosVS(demanda1,generacion1,capacidadMax1,rendOut1,rendIn1);
[HNS02,sumaENS02,sumaENA02] = calculopuntosVS(demanda2,generacion2,capacidadMax2,rendOut2,rendIn2);
[HNS2,HNS21,HNS22,sumaENS2,sumaENA2,sumaENS21,sumaENA21,sumaENS22,sumaENA22] = calculopuntosVC(soc2,demanda1,generacion1,demanda2,generacion2,capacidadMax1,capacidadMax2,rendOut1,rendIn1,rendOut2,rendIn2,CoefPerd);
[HNS3,HNS31,HNS32,sumaENS3,sumaENA3,sumaENS31,sumaENA31,sumaENS32,sumaENA32] = calculopuntosVC(soc3,demanda1,generacion1,demanda2,generacion2,capacidadMax1,capacidadMax2,rendOut1,rendIn1,rendOut2,rendIn2,CoefPerd);
[HNS4,HNS41,HNS42,sumaENS4,sumaENA4,sumaENS41,sumaENA41,sumaENS42,sumaENA42] = calculopuntosVC(soc4,demanda1,generacion1,demanda2,generacion2,capacidadMax1,capacidadMax2,rendOut1,rendIn1,rendOut2,rendIn2,CoefPerd);
[HNS5,HNS51,HNS52,sumaENS5,sumaENA5,sumaENS51,sumaENA51,sumaENS52,sumaENA52] = calculopuntosVC(soc5,demanda1,generacion1,demanda2,generacion2,capacidadMax1,capacidadMax2,rendOut1,rendIn1,rendOut2,rendIn2,CoefPerd);


LOLE01(k)=HNS01;
LOLP01(k) = HNS01/87.6;

sumap01 = sum(LOLP01);
media_acumuladap01(k) = sumap01/k;

sumae01 = sum(LOLE01);
media_acumuladae01(k) = sumae01/k;

adicENS01(k) = sumaENS01;
media_acumuladaENS01(k) = sum(adicENS01)/k;

adicENA01(k) = sumaENA01;
media_acumuladaENA01(k) = sum(adicENA01)/k;

LOLE02(k) = HNS02;
LOLP02(k) = HNS02/87.6;

sumap02 = sum(LOLP02);
media_acumuladap02(k) = sumap02/k;

sumae02 = sum(LOLE02);
media_acumuladae02(k) = sumae02/k;

adicENS02(k) = sumaENS02;
media_acumuladaENS02(k) = sum(adicENS02)/k;

adicENA02(k) = sumaENA02;
media_acumuladaENA02(k) = sum(adicENA02)/k;

LOLE2(k) = HNS2;
LOLP2(k) = HNS2/87.6;

sumap2 = sum(LOLP2);
media_acumuladap2(k) = sumap2/k;

sumae2 = sum(LOLE2);
media_acumuladae2(k) = sumae2/k;

adicENS2(k) = sumaENS2;
media_acumuladaENS2(k) = sum(adicENS2)/k;

adicENA2(k) = sumaENA2;
media_acumuladaENA2(k) = sum(adicENA2)/k;

LOLE3(k) = HNS3;
LOLP3(k) = HNS3/87.6;

sumap3 = sum(LOLP3);
media_acumuladap3(k) = sumap3/k;

sumae3 = sum(LOLE3);
media_acumuladae3(k) = sumae3/k;

adicENS3(k) = sumaENS3;
media_acumuladaENS3(k) = sum(adicENS3)/k;

adicENA3(k) = sumaENA3;
media_acumuladaENA3(k) = sum(adicENA3)/k;

LOLE4(k) = HNS4;
LOLP4(k) = HNS4/87.6;

sumap4 = sum(LOLP4);
media_acumuladap4(k) = sumap4/k;

sumae4 = sum(LOLE4);
media_acumuladae4(k) = sumae4/k;

adicENS4(k) = sumaENS4;
media_acumuladaENS4(k) = sum(adicENS4)/k;

adicENA4(k) = sumaENA4;
media_acumuladaENA4(k) = sum(adicENA4)/k;

LOLE5(k) = HNS5;
LOLP5(k) = HNS5/87.6;

sumap5 = sum(LOLP5);
media_acumuladap5(k) = sumap5/k;

sumae5 = sum(LOLE5);
media_acumuladae5(k) = sumae5/k;

adicENS5(k) = sumaENS5;
media_acumuladaENS5(k) = sum(adicENS5)/k;

adicENA5(k) = sumaENA5;
media_acumuladaENA5(k) = sum(adicENA5)/k;

LOLE21(k) = HNS21;
LOLP21(k) = HNS21/87.6;

sumap21 = sum(LOLP21);
media_acumuladap21(k) = sumap21/k;

sumae21 = sum(LOLE21);
media_acumuladae21(k) = sumae21/k;

adicENS21(k) = sumaENS21;
media_acumuladaENS21(k) = sum(adicENS21)/k;

adicENA21(k) = sumaENA21;
media_acumuladaENA21(k) = sum(adicENA21)/k;

LOLE31(k) = HNS31;
LOLP31(k) = HNS31/87.6;

sumap31 = sum(LOLP31);
media_acumuladap31(k) = sumap31/k;

sumae31 = sum(LOLE31);
media_acumuladae31(k) = sumae31/k;

adicENS31(k) = sumaENS31;
media_acumuladaENS31(k) = sum(adicENS31)/k;

adicENA31(k) = sumaENA31;
media_acumuladaENA31(k) = sum(adicENA31)/k;

LOLE41(k) = HNS41;
LOLP41(k) = HNS41/87.6;

sumap41 = sum(LOLP41);
media_acumuladap41(k) = sumap41/k;

sumae41 = sum(LOLE41);
media_acumuladae41(k) = sumae41/k;

adicENS41(k) = sumaENS41;
media_acumuladaENS41(k) = sum(adicENS41)/k;

adicENA41(k) = sumaENA41;
media_acumuladaENA41(k) = sum(adicENA41)/k;

LOLE51(k) = HNS51;
LOLP51(k) = HNS51/87.6;

sumap51 = sum(LOLP51);
media_acumuladap51(k) = sumap51/k;

sumae51 = sum(LOLE51);
media_acumuladae51(k) = sumae51/k;

adicENS51(k) = sumaENS51;
media_acumuladaENS51(k) = sum(adicENS51)/k;

adicENA51(k) = sumaENA51;
media_acumuladaENA51(k) = sum(adicENA51)/k;

LOLE22(k) = HNS22;
LOLP22(k) = HNS22/87.6;

sumap22 = sum(LOLP22);
media_acumuladap22(k) = sumap22/k;

sumae22 = sum(LOLE22);
media_acumuladae22(k) = sumae22/k;

adicENS22(k) = sumaENS22;
media_acumuladaENS22(k) = sum(adicENS22)/k;

adicENA22(k) = sumaENA22;
media_acumuladaENA22(k) = sum(adicENA22)/k;

LOLE32(k) = HNS32;
LOLP32(k) = HNS32/87.6;

sumap32 = sum(LOLP32);
media_acumuladap32(k) = sumap32/k;

sumae32 = sum(LOLE32);
media_acumuladae32(k) = sumae32/k;

adicENS32(k) = sumaENS32;
media_acumuladaENS32(k) = sum(adicENS32)/k;

adicENA32(k) = sumaENA32;
media_acumuladaENA32(k) = sum(adicENA32)/k;

LOLE42(k) = HNS42;
LOLP42(k) = HNS42/87.6;

sumap42 = sum(LOLP42);
media_acumuladap42(k) = sumap42/k;

sumae42 = sum(LOLE42);
media_acumuladae42(k) = sumae42/k;

adicENS42(k) = sumaENS42;
media_acumuladaENS42(k) = sum(adicENS42)/k;

adicENA42(k) = sumaENA42;
media_acumuladaENA42(k) = sum(adicENA42)/k;

LOLE52(k) = HNS52;
LOLP52(k) = HNS52/87.6;

sumap52 = sum(LOLP52);
media_acumuladap52(k) = sumap52/k;

sumae52 = sum(LOLE52);
media_acumuladae52(k) = sumae52/k;

adicENS52(k) = sumaENS52;
media_acumuladaENS52(k) = sum(adicENS52)/k;

adicENA52(k) = sumaENA52;
media_acumuladaENA52(k) = sum(adicENA52)/k;



end


figure
plot(x, media_acumuladap01);
hold on;  % Mantener los ejes actuales
plot(x, media_acumuladap2);
hold on
plot(x, media_acumuladap3);
hold on
plot(x, media_acumuladap4);
hold on
plot(x, media_acumuladap5);

% Configurar etiquetas y leyenda
xlabel('Simulaciones');
ylabel('LOLP %');
legend('LOLP S1', 'LOLP S2_2_0', 'LOLP S2_3_0', 'LOLP S2_4_0', 'LOLP S2_5_0');

figure
plot(x, media_acumuladae01);
hold on;  % Mantener los ejes actuales
plot(x, media_acumuladae2);
hold on
plot(x, media_acumuladae3);
hold on
plot(x, media_acumuladae4);
hold on
plot(x, media_acumuladae5);

% Configurar etiquetas y leyenda
xlabel('Simulaciones');
ylabel('LOLE (h/año)');
legend('LOLE S1', 'LOLE S2_2_0', 'LOLE S2_3_0', 'LOLE S2_4_0', 'LOLE S2_5_0');

figure
plot(x, media_acumuladaENS01);
hold on;  % Mantener los ejes actuales
plot(x, media_acumuladaENS2);
hold on
plot(x, media_acumuladaENS3);
hold on
plot(x, media_acumuladaENS4);
hold on
plot(x, media_acumuladaENS5);

% Configurar etiquetas y leyenda
xlabel('Simulaciones');
ylabel('LOEE (kWh/año)');
legend('LOEE S1', 'LOEE S2_2_0', 'LOEE S2_3_0', 'LOEE S2_4_0', 'LOEE S2_5_0');

figure
plot(x, media_acumuladaENA01);
hold on;  % Mantener los ejes actuales
plot(x, media_acumuladaENA2);
hold on
plot(x, media_acumuladaENA3);
hold on
plot(x, media_acumuladaENA4);
hold on
plot(x, media_acumuladaENA5);

% Configurar etiquetas y leyenda
xlabel('Simulaciones');
ylabel('ENA (kWh/año)');
legend('ENA S1', 'ENA S2_2_0', 'ENA S2_3_0', 'ENA S2_4_0', 'ENA S2_5_0');

figure
plot(x, media_acumuladap01);
hold on;  % Mantener los ejes actuales
plot(x, media_acumuladap21);
hold on
plot(x, media_acumuladap31);
hold on
plot(x, media_acumuladap41);
hold on
plot(x, media_acumuladap51);

% Configurar etiquetas y leyenda
xlabel('Simulaciones');
ylabel('LOLP %');
legend('LOLP S1 D1', 'LOLP S2_2_0 D1', 'LOLP S2_3_0 D1', 'LOLP S2_4_0 D1', 'LOLP S2_5_0 D1');

figure
plot(x, media_acumuladap02);
hold on;  % Mantener los ejes actuales
plot(x, media_acumuladap22);
hold on
plot(x, media_acumuladap32);
hold on
plot(x, media_acumuladap42);
hold on
plot(x, media_acumuladap52);

% Configurar etiquetas y leyenda
xlabel('Simulaciones');
ylabel('LOLP %');
legend('LOLP S1 D2', 'LOLP S2_2_0 D2', 'LOLP S2_3_0 D2', 'LOLP S2_4_0 D2', 'LOLP S2_5_0 D2');

figure
plot(x, media_acumuladae01);
hold on;  % Mantener los ejes actuales
plot(x, media_acumuladae21);
hold on
plot(x, media_acumuladae31);
hold on
plot(x, media_acumuladae41);
hold on
plot(x, media_acumuladae51);

% Configurar etiquetas y leyenda
xlabel('Simulaciones');
ylabel('LOLE (h/año)');
legend('LOLE S1 D1', 'LOLE S2_2_0 D1', 'LOLE S2_3_0 D1', 'LOLE S2_4_0 D1', 'LOLE S2_5_0 D1');

figure
plot(x, media_acumuladae02);
hold on;  % Mantener los ejes actuales
plot(x, media_acumuladae22);
hold on
plot(x, media_acumuladae32);
hold on
plot(x, media_acumuladae42);
hold on
plot(x, media_acumuladae52);

% Configurar etiquetas y leyenda
xlabel('Simulaciones');
ylabel('LOLE (h/año)');
legend('LOLE S1 D2', 'LOLE S2_2_0 D2', 'LOLE S2_3_0 D2', 'LOLE S2_4_0 D2', 'LOLE S2_5_0 D2');


figure
plot(x, media_acumuladaENS01);
hold on;  % Mantener los ejes actuales
plot(x, media_acumuladaENS21);
hold on
plot(x, media_acumuladaENS31);
hold on
plot(x, media_acumuladaENS41);
hold on
plot(x, media_acumuladaENS51);

% Configurar etiquetas y leyenda
xlabel('Simulaciones');
ylabel('LOEE (kWh/año)');
legend('LOEE S1 D1', 'LOEE S2_2_0 D1', 'LOEE S2_3_0 D1', 'LOEE S2_4_0 D1', 'LOEE S2_5_0 D1');

figure
plot(x, media_acumuladaENS02);
hold on;  % Mantener los ejes actuales
plot(x, media_acumuladaENS22);
hold on
plot(x, media_acumuladaENS32);
hold on
plot(x, media_acumuladaENS42);
hold on
plot(x, media_acumuladaENS52);

% Configurar etiquetas y leyenda
xlabel('Simulaciones');
ylabel('LOEE (kWh/año)');
legend('LOEE S1 D2', 'LOEE S2_2_0 D2', 'LOEE S2_3_0 D2', 'LOEE S2_4_0 D2', 'LOEE S2_5_0 D2');

figure
plot(x, media_acumuladaENA01);
hold on;  % Mantener los ejes actuales
plot(x, media_acumuladaENA21);
hold on
plot(x, media_acumuladaENA31);
hold on
plot(x, media_acumuladaENA41);
hold on
plot(x, media_acumuladaENA51);

% Configurar etiquetas y leyenda
xlabel('Simulaciones');
ylabel('ENA (kWh/año)');
legend('ENA S1 D1', 'ENA S2_2_0 D1', 'ENA S2_3_0 D1', 'ENA S2_4_0 D1', 'ENA S2_5_0 D1');

figure
plot(x, media_acumuladaENA02);
hold on;  % Mantener los ejes actuales
plot(x, media_acumuladaENA22);
hold on
plot(x, media_acumuladaENA32);
hold on
plot(x, media_acumuladaENA42);
hold on
plot(x, media_acumuladaENA52);

% Configurar etiquetas y leyenda
xlabel('Simulaciones');
ylabel('ENA (kWh/año)');
legend('ENA S1 D2', 'ENA S2_2_0 D2', 'ENA S2_3_0 D2', 'ENA S2_4_0 D2', 'ENA S2_5_0 D2');

sumageneracion1 = sum(generacion1)
mediageneracion1 = mean(generacion1)
sumageneracion2 = sum(generacion2)
mediageneracion2 = mean(generacion2)
sumademanda1 = sum(demanda1)
mediademanda1 = mean(demanda1)
sumademanda2 = sum(demanda2)
mediademanda2 = mean(demanda2)

