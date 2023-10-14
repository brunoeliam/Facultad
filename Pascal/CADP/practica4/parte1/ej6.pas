(* 6. Dado que en la solución anterior se recorre dos veces el vector (una para calcular el elemento máximo y
otra para el mínimo), implementar un único módulo que recorra una única vez el vector y devuelva ambas
posiciones. *)

program ej6;
const
full = 10;
type
  rango = 1..full;
  vector = array [rango] of integer;

procedure cargar (var v: vector; var dimL: integer);
var n: integer;
  begin
    dimL:= 0;
    writeln('ingresate unos valores para cargarlo '); readln(n);
    while (n <> 0) and (dimL < 10) do
      begin
        dimL:= dimL + 1;
        v[dimL]:= n;
        readln(n);
      end;
  end;

procedure minYMax(v: vector; var posMax, posMin, max, min: integer; dimL: integer);
var i: integer;
  begin
    max:= -999;
    min:= 999;
    for i:= 1 to dimL do
      begin
        if (v[i] > max) then
         begin
          max:= v[i];
          posMax:= i
         end;
        if (v[i] < min) then
         begin
          min:= v[i];
          posMin:= i;
         end;
      end;
  end;

procedure intercambio (var v: vector; posMax, posMin: integer);
var x, y, aux: integer;
  begin
    x:= posMax;
    y:= posMin;
    aux:= v[x];
    v[x]:= v[y];
    v[y]:= aux;
  end;


var
v: vector;
dimL, max, min, posMax, posMin, g: integer;

begin
  cargar(v, dimL);
  writeln('asi te quedo al principio ');
  for g:= 1 to dimL do
    writeln(v[g]);
  minYMax(v, posMax, posMin, max, min, dimL);
  intercambio(v, posMax, posMin);

  writeln('El elemento maximo ' ,max, ' que se encontraba en la posicion ' ,posMax,
' fue intercambiado con el elemento minimo ' ,min, ' que se encontraba en la posicion ' ,posMin);
  writeln('asi te quedo al final ');
  for g:= 1 to dimL do
    writeln(v[g]);
end.
