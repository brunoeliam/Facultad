(* Realizar un programa modularizado que lea información de alumnos de una facultad. Para cada alumno se lee: número de inscripción, apellido y nombre. La lectura finaliza cuando se ingresa el alumno con número de inscripción 1200, que debe procesarse. Se pide calcular e informar:
- Apellido de los dos alumnos con número de inscripción más chico.
- Nombre de los dos alumnos con número de inscripción más grande.
- Porcentaje de alumnos con nro de inscripción par.
*)
program ej9;

procedure masChico(nro: integer; apellido: string; var min1, min2: integer; var apeMin1, apeMin2: string);
  begin
    if (nro < min1) then
      begin
        min2:= min1;
        apeMin2:= apeMin1;
        min1:= nro;
        apeMin1:= apellido;
      end
    else if (nro < min2) then
      begin
        min2:= nro;
        apeMin2:= apellido;
      end;
  end;

procedure masGrande(nro: integer; nombre: string; var max1, max2: integer; var nomMax1, nomMax2: string);
  begin
    if (nro > max1) then
      begin
        max2:= max1;
        nomMax2:= nomMax1;
        max1:= nro;
        nomMax1:= nombre;
      end
    else if (nro > max2) then
      begin
        max2:= nro;
        nomMax2:= nombre;
      end;
  end;

function calcularPorcentaje(par, cant: integer): real;
  begin
    calcularPorcentaje:= ((par / cant) * 100);
  end;
var
  nro, min1, min2, max1, max2, cant, par: integer;
  nombre, apellido, apeMin1, apeMin2, nomMax1, nomMax2: string;
begin
  min1:= 9998;
  min2:= 9999;
  max1:= -1;
  max2:= -2;
  cant:= 0;
  par:= 0;

  repeat
    writeln('ingrese primero el numero de inscripcion, luego apellido y por ultimo nombre del alumno '); readln(nro); readln(apellido); readln(nombre);
    cant:= cant + 1;
    if ((nro mod 2) = 0) then
      par:= par + 1;
    masChico(nro, apellido, min1, min2, apeMin1, apeMin2);
    masGrande(nro, nombre, max1, max2, nomMax1, nomMax2);
  until (nro = 1200);
  writeln('el apellido de los dos alumnos con numero de inscripcion mas chico fue ' ,apeMin1, ' y ' ,apeMin2, ' . el nombre de los dos alumnos con numero de inscripcion mas grande fue ' ,nomMax1, ' y ' ,nomMax2, '. por otro lado, el porcentaje de alumnos con numero de inscripcion par fue de el ' ,calcularPorcentaje(par, cant):2:2, '%');
  writeln(' cant total te lo muestro primero ' ,cant, ' y ahora los pares ' ,par);
end.
