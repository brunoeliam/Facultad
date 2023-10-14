(*2. El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el año 2019. Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese año.
a) Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento.
b) Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el definido en el inciso a).
c) Implementar un programa que lea la fecha de todos los casamientos realizados en 2019. La lectura finaliza al
ingresar el año 2020, que no debe procesarse, e informe la cantidad de casamientos realizados durante los
meses de verano (enero, febrero y marzo) y la cantidad de casamientos realizados en los primeros 10 días de
cada mes. Nota: utilizar el módulo realizado en b) para la lectura de fecha.*)

program ej2;
type
  fecha = record
    dia: integer;
    mes: string;
    anio: integer;
  end;
procedure leer(var f: fecha);
  begin
    writeln('ingrese el anio de casamiento ');
    readln(f.anio);
    writeln('ingrese el dia de casamiento ');
    readln(f.dia);
    writeln('ingrese el mes de casamiento ');
    readln(f.mes);
    writeln('la fecha del casamiento fue el ',f.dia, ' de ' ,f.mes, ' de ' ,f.anio);
  end;

procedure casamientos(var f: fecha);
var
cantVerano, cantPrimeros: integer;
  begin
    cantVerano:= 0;
    cantPrimeros:= 0;
    leer(f);
    while (f.anio <> 2020) do
    begin
      if (f.mes = 'enero') or (f.mes = 'febrero') or (f.mes = 'marzo') then
        cantVerano:= cantVerano + 1;
      if (f.dia > 1) and (f.dia < 10) then
        cantPrimeros:= cantPrimeros + 1;
      leer(f);
    end;
    writeln('la cantidad de casamientos realizados durante los meses de verano fue de ' ,cantVerano, ' y la cantidad realizados en los primeros 10 dias de cada mes fue de ' ,cantPrimeros);
  end;

var
  f: fecha;
begin
  casamientos(f);
end.