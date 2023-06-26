[num, txt, raw] = xlsread('D:\TFG2\DATOS', 'Simulación');

encabezado = raw(:, 6);
indice_fila = find(strcmp('Demanda (W)', encabezado));
fila_inicio = indice_fila+1;

demanda1c = raw(fila_inicio:end, 6); 
demanda1 = cell2mat(demanda1c);
demanda1 = demanda1(1:8760);

demanda2c = raw(fila_inicio:end, 17); 
demanda2 = cell2mat(demanda2c);
demanda2 = demanda2(1:8760);

dataGeneracion1c = raw(fila_inicio:end, 8); 
generacionmax1 = cell2mat(dataGeneracion1c);
generacionmax1 = generacionmax1(1:8760);

dataGeneracion2c = raw(fila_inicio:end, 19); 
generacionmax2 = cell2mat(dataGeneracion2c);
generacionmax2 = generacionmax2(1:8760);

ONOFFc = raw(fila_inicio:end, 7); 
ONOFF = cell2mat(ONOFFc);
ONOFF = ONOFF(1:8760);

[num, txt, raw] = xlsread('D:\TFG2\DATOS', 'TTF y TTR');

TTFc = raw(2:end, 1);
TTF = cell2mat(TTFc);

TTRc = raw(2:end, 2);
TTR = cell2mat(TTRc);