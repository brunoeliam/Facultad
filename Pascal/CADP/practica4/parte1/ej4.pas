(* Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector,
o el valor -1 en caso de no encontrarse.
b) intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector
donde se intercambiaron los valores de las posiciones x e y.
c) sumaVector: retorna la suma de todos los elementos del vector.
d) promedio: devuelve el valor promedio de los elementos del vector.
e) elementoMaximo: retorna la posición del mayor elemento del vector
f) elementoMinimo: retorna la posicion del menor elemento del vector *)

program ej4;
const
  full = 10;
type
  vector = array [1..full] of integer;

procedure cargar (var v: vector);
var i: integer;
  begin
    writeln('ingresate unos valores para cargarlo pa ');
    for i:= 1 to full do 
      begin
        readln(v[i]);
      end;
  end;

function posicion (v: vector): integer;
var
	pos, x, termine:integer;
	seguir:boolean;
begin
	pos:= 1;
	seguir:= true;
  writeln('ingresa el valor a buscar en el vector: '); readln(x);
	while (seguir) and (pos < full) do
    begin
      if (v[pos] = x) then 
        seguir:= false
      else
        pos:= pos + 1;
    end;
	if (seguir = false) then 
		termine:= pos
	else
		termine:= -1;
  posicion:= termine;
end;

procedure intercambio (var v: vector);
var x, y, aux: integer;
  begin
    writeln('posicion x: '); readln(x);
    writeln('posicion y: '); readln(y);
    aux:= v[x];
    v[x]:= v[y];
    v[y]:= aux;
  end;

function sumaVector (v: vector): integer;
var suma, i: integer;
  begin
    suma:= 0;
    for i:= 1 to full do
        suma:= suma + v[i];
    sumaVector:= suma;
  end;

function promedio (v: vector): integer;
var suma, i: integer;
  begin
    suma:= 0;
    for i:= 1 to full do
        suma:= suma + v[i];
  promedio:= suma div 10;
  end;

function elementoMaximo(v: vector): integer;
var i, max, pos: integer;
  begin
    max:= -999;
    for i:= 1 to full do
      begin
        if (v[i] > max) then begin
          max:= v[i];
          pos:= i;
        end;
      end;
    elementoMaximo:= pos;
  end;

function elementoMinimo(v: vector): integer;
var i, min, pos: integer;
  begin
    min:= 999;
    for i:= 1 to full do
      begin
        if (v[i] < min) then begin
          min:= v[i];
          pos:= i;
        end;
      end;
    elementoMinimo:= pos;
  end;

var
  v: vector;
  dimL: integer;
begin
  cargar(v);
  writeln('el elemento max esta en la posicion ',elementoMaximo(v), ' y el elemento min esta en la posicion ' ,elementoMinimo(v));
end.



