(* Utilizando los módulos implementados en el ejercicio 4, realizar un programa que lea números enteros
desde teclado (a lo sumo 100) y los almacene en un vector. La carga finaliza al leer el número 0. Al finalizar
la carga, se debe intercambiar la posición del mayor elemento por la del menor elemento, e informe la
operación realizada de la siguiente manera: “El elemento máximo ... que se encontraba en la posición ...
fue intercambiado con el elemento mínimo ... que se encontraba en la posición ...” *)

program ej5;
const
full = 10;
type
  rango = 1..full;
  vector = array [rango] of integer;

procedure cargar (var v: vector; var dimL: integer);
var n: integer;
  begin
    dimL:= 0;
    writeln('ingresate unos valores para cargarlo pa'); readln(n);
    while (n <> 0) and (dimL < full) do
      begin
        dimL:= dimL + 1;
        v[dimL]:= n;
        readln(n);
      end;
  end;

procedure elementoMaximo(v: vector; var max, posMax: integer; dimL: integer);
var i: integer;
  begin
    max:= -999;
    for i:= 1 to dimL do
      begin
        if (v[i] > max) then begin
          max:= v[i];
          posMax:= i;
        end;
      end;
  end;

procedure elementoMinimo(v: vector; var min, posMin: integer; dimL: integer);
var i: integer;
  begin
    min:= 999;
    for i:= 1 to dimL do
      begin
        if (v[i] < min) then begin
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
  elementoMaximo(v, max, posMax, dimL);
  elementoMinimo(v, min, posMin, dimL);
  intercambio(v, posMax, posMin);

  writeln('El elemento maximo ' ,max, ' que se encontraba en la posicion ' ,posMax,
' fue intercambiado con el elemento minimo ' ,min, ' que se encontraba en la posicion ' ,posMin);
  writeln('asi te quedo al final ');
  for g:= 1 to dimL do
    writeln(v[g]);
end.