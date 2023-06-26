function [year1d,year2d,year] = estaciones(demanda1,demanda2,generacion)
invierno1 = demanda1(8544:8567);
primavera1 = demanda1(1897:1920);
verano1 = demanda1(4104:4127);
autumn1 = demanda1(6360:6383);
year1d = vertcat(invierno1,primavera1,verano1,autumn1);

invierno2 = demanda2(8544:8567);
primavera2 = demanda2(1897:1920);
verano2 = demanda2(4104:4127);
autumn2 = demanda2(6360:6383);
year2d = vertcat(invierno2,primavera2,verano2,autumn2);

invierno = generacion(8544:8567);
primavera = generacion(1897:1920);
verano = generacion(4104:4127);
autumn = generacion(6360:6383);
year = vertcat(invierno,primavera,verano,autumn);