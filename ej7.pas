(* 7. Realizar un programa que lea información de centros de investigación de Universidades Nacionales. De cada centro se lee su nombre abreviado (ej. LIDI, LIFIA, LINTI), la universidad a la que pertenece, la cantidad de investigadores y la cantidad de becarios que poseen. La información se lee de forma consecutiva por universidad y la lectura finaliza al leer un centro con 0 investigadores, que no debe procesarse. Informar:
- Cantidad total de centros para cada universidad.
- Universidad con mayor cantidad de investigadores en sus centros.
- Los dos centros con menor cantidad de becarios. *)

program ej7;
type
  centro = record
  nombre: string;
  universidad: string;
  cantInv: integer;
  cantBec: integer;
  end;

  minCentro = record
  nombre: string;
  cantBec: integer;
  end;

  maxCentro = record
  universidad: string;
  cantInv: integer;
  end;  

procedure leer(var c: centro);
  begin
    writeln('nombre: '); readln(c.nombre);
    writeln('universidad: '); readln(c.universidad);
    writeln('cantidad de becarios: '); readln(c.cantBec);
  end;

procedure calcularMin(c: centro; var min1, min2: minCentro);
begin
    if (c.cantBec < min1.cantBec) then
      begin
        min2.cantBec:= min1.cantBec;
        min2.nombre:= min1.nombre;
        min1.cantBec:= c.cantBec;
        min1.nombre:= c.nombre;
      end
    else if (c.cantBec < min2.cantBec) then
      begin
        min2.cantBec:= c.cantBec;
        min2.nombre:= c.nombre;
      end;
end;

procedure calcularMax(c: centro; var max: maxCentro);
begin
  if (c.cantInv > max.cantInv) then
    begin
      max.cantInv:= c.cantInv;
      max.universidad:= c.universidad;
    end;
end;

var
c: centro;
max: maxCentro;
univActual: string;
cantCentros: integer;
min1, min2: minCentro;

begin 
  max.universidad:= '';
  max.cantInv:= -1;
  min1.nombre:= '';
  min2.nombre:= '';
  min1.cantBec:= 9997;
  min2.cantBec:= 9999;

  writeln('cantidad de investigadores: '); readln(c.cantInv);
  while (c.cantInv <> 0) do
  begin
    leer(c);
    cantCentros:= 0;
    univActual:= c.universidad;
    while (c.cantInv <> 0) and (univActual = c.universidad) do
      begin
        cantCentros:= cantCentros + 1;
        calcularMin(c,min1, min2);
        calcularMax(c,max);
        writeln('cantidad de investigadores: '); readln(c.cantInv);
        leer(c);
      end;
    writeln('la cantidad de centros de la universidad ', univActual ,' fue de ' , cantCentros);
  end;
  writeln('la universidad con mayor cantidad de investigadores en sus centros fue ' , max.universidad , ' y los dos centros con menor cantidad de becarios fueron los de ', min1.nombre , min2.nombre);
end.