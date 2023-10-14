(* Dado un vector de enteros de a lo sumo 500 valores, realice un módulo que reciba dicho vector y un valor
n y retorne si n se encuentra en el vector o no.
b. Modifique el módulo del inciso a. considerando ahora que el vector se encuentra ordenado de manera
ascendente 
a*)

(*program ej1;
const
  dimF = 8;
type
  rango = 1..dimF;
  vector = array [rango] of integer;

procedure cargar (var v: vector; var dimL: integer);
  begin
    dimL:= 1;
    writeln('ingrese numeros para cargar el vector: '); readln(v[dimL]);
    while (dimL < dimF) and (v[dimL] <> 0) do
      begin
        dimL:= dimL + 1;
        readln(v[dimL]);
      end;
  end;
  
function esta (v: vector; dimL, n: integer): boolean;
var ok: boolean; i: integer;
    begin
      ok:= false; i:= 1;
      while (i <= dimL) and (not ok) do
        begin
          if (v[i] = n) then
            ok:= true
          else
            i:= i + 1;
        end;
    esta:= ok;
    end;

var
  v: vector;
  diml, n: integer;
begin
  cargar(v, dimL);
  writeln('que valor buscas?'); readln(n);
  writeln(esta(v,dimL,n));
end.
b *)
program ej1;
const
  dimF = 10;
type
  rango = 1..dimF;
  vector = array [rango] of integer;

procedure cargar (var v: vector; var dimL: integer);
  begin
    dimL:= 1;
    writeln('ingrese numeros para cargar el vector: '); readln(v[dimL]);
    while (dimL < dimF) and (v[dimL] <> 0) do
      begin
        dimL:= dimL + 1;
        readln(v[dimL]);
      end;
  end;
  
function esta (v: vector; dimL, n: integer): boolean;
var i: integer;
  begin
    i:= 1;
    while (i <= dimL) and (v[i] < n) do
      begin
        i:= i + 1;
        if (i <= dimL) and (v[i] = n) then
          esta:= true
        else
          esta:= false;
      end;
  end;

var
  v: vector;
  diml, n: integer;
begin
  cargar(v, dimL);
  writeln('que valor buscas?'); readln(n);
  writeln(esta(v,dimL,n));
end.