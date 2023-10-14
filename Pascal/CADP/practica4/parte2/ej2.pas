(* Realice un programa que resuelva los siguientes incisos:
a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza
cuando se lee el nombre ‘ZZZ’, que no debe procesarse.
b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.
c. Lea un nombre y lo inserte en la posición 4 del vector.
d. Lea un nombre y lo agregue al vector.
Nota: Realizar todas las validaciones necesarias. *)

program ej2;
const
  dimF = 10; // 500 dale dale ahi va
type
  rango = 1..dimF;
  vector = array [rango] of string;

procedure cargar (var v: vector; var dimL: integer);
var pibe: string;
  begin
    dimL:= 1;
    readln(pibe); 
    while (dimL < dimF) and (pibe <> 'ZZZ') do 
      begin
        v[dimL]:= pibe;
        dimL:= dimL + 1;
        readln(pibe); 
      end;
  end;

procedure imprimir (v: vector; dimL: integer);
var i: integer;
  begin
    writeln('asi te quedo: ');
    for i:= 1 to dimL do 
      write(v[i], ' ');
  end;

function posicion (v: vector; dimL: integer; nom: string): integer;
var ok: boolean; i, aux: integer;
    begin
      ok:= false; i:= 1;
      while (i <= dimL) and (not ok) do
        begin
          if (v[i] = nom) then
            begin
              ok:= true;
              aux:= i
            end
          else
            begin
              i:= i + 1;
              aux:= 0;
            end;
        end;
    posicion:= aux;
    end;

procedure eliminar (var v: vector; var dimL: integer; var ok: boolean);
var nom: string; i, pos: integer;
  begin
    ok:= false;
    writeln('nombre a eliminar: '); readln(nom);
    pos:= posicion(v, dimL, nom);

    if (pos >= 1) and (pos <= dimL) then
      begin
        for i:= pos to (dimL - 1) do
          v[i]:= v[i + 1];
        ok:= true;
        dimL:= dimL - 1;
      end;
  end; 

procedure insertar (var v: vector; var dimL: integer; pos: integer; var ok: boolean);
var i: integer; nom: string;
  begin
    ok:= false;
    writeln('nombre a insertar: '); readln(nom);
    if ((dimL + 1) <= dimF) and (pos >= 1) and (pos <= dimL) then 
      begin
        for i:= dimL downto pos do
          v[i + 1]:= v[i];
        ok:= true;
        v[pos]:= nom;
        dimL:= dimL + 1;
      end;
  end;

procedure agregar (var v: vector; var dimL: integer; var ok: boolean);
var nom: string;
  begin
    ok:= false;
    writeln('nombre a agregar: '); readln(nom);
    if ((dimL + 1) <= dimF) then
      begin
        ok:= true;
        dimL:= dimL + 1;
        v[dimL]:= nom;
      end;
  end;

var
  v: vector;
  dimL, pos: integer;
  ok: boolean;
begin
  //a)
  cargar(v, dimL);
  //b) 
  eliminar(v, dimL, ok);
  //c) 
  pos:= 4;
  insertar(v, dimL, pos, ok);
  //d) 
  agregar(v, dimL, ok);
  //
  imprimir(v, dimL);
end.
