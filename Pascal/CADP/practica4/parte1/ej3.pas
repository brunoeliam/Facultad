(* Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.
a) Realizar un módulo que imprima el vector desde la primera posición hasta la última.
b) Realizar un módulo que imprima el vector desde la última posición hasta la primera.
c) Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y
desde la mitad más uno hacia la última posición.
d) Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la
posición X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere
que, dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.
e) Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c. *)

program ej3;
const
  full = 15;
type
  vector = array [1..full] of integer;

procedure cargar (var v: vector; var dimL: integer);
var n: integer;
  begin
    dimL:= 0;
    read(n);
    while (n <> 0) and (dimL < full) do
      begin
        dimL:= dimL + 1;
        v[dimL]:= n;
        readln(n);
      end;
  end;

procedure imprimirDesdeUno(v: vector; dimL: integer);
var i: integer;
begin
  writeln('imprimo');
	for i:= 1 to dimL do
		writeln(v[i]);
end;

procedure imprimirDesdeAtras(v: vector; dimL: integer);
var i: integer;
begin 
  writeln('imprimo');
  for i:= dimL downto 1 do
    writeln(v[i]);
end;

procedure imprimirDesdeMitad(v: vector; dimL: integer);
var i, mitad, boca: integer;
begin
  mitad:= dimL DIV 2;
  boca:= mitad + 1;
  writeln('imprimo');
  (*for i:= mitad downto 1 do
    writeln(v[i]);*)
  for i:= boca to dimL do
    writeln(v[i]);
end;

procedure jodido(v: vector);
var x, y, i: integer;
begin
  writeln('ingrese una posicion x'); readln(x);
  writeln('ingrese una posicion y'); readln(y);
  if (y > x) then       // principio-fin
    begin
      for i:= x to y do
        write(v[i]);
    end
  else                  // fin-principio
    begin
      for i:= x downto y do
        write(v[i]);
    end
end;

var
v: vector;
dimF, dimL: integer;

begin
  cargar(v, dimL);
  (* imprimirDesdeUno(v, dimL); *)
  (* imprimirDesdeAtras(v, dimL); *)
  (*imprimirDesdeMitad(v, dimL);*)
  jodido(v);
end.
