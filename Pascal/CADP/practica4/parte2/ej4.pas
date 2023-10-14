(* Una cátedra dispone de información de sus alumnos (a lo sumo 1000). De cada alumno se conoce nro de
alumno, apellido y nombre y cantidad de asistencias a clase. Dicha información se encuentra ordenada por
nro de alumno de manera ascendente. Se pide:
a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El
alumno seguro existe.
b. Un módulo que reciba un alumno y lo inserte en el vector.
c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.
d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector.
e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.
Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos con datos
leídos de teclado. *)

program ej4;
const 
  dimF = 1000;
type
  alumno = record
  nro: integer;
  nomYApe: string;
  asist: integer;
  end;

  vector = array [1..dimF] of alumno;

procedure leer (var alu: alumno);
begin
  writeln('numero de alumno: '); readln(alu.nro);
  if (alu.nro <> -1) then
   begin
    writeln('nombre y apellido: '); readln(alu.nomYApe);
    writeln('cantidad de asistencias: '); readln(alu.asist);
   end;
end;

procedure cargar (var v: vector; var dimL: integer);
var a: alumno;
begin 
  dimL:= 0;
  leer(a);
  while (dimL < dimF) and (a.nro <> -1) do 
    begin
      dimL:= dimL + 1;
      v[dimL]:= a;
      leer(a);
    end;
end;

function posicion (v: vector; dimL, num: integer): integer;
var pos, aux: integer; sigo: boolean;
begin
  sigo:= true; pos:= 1;
  while (pos <= dimL) and (sigo) do 
  begin
    if (v[pos].nro = num) then
      begin
        aux:= pos;
        sigo:= false;
      end
    else
      pos:= pos + 1;
  end;
posicion:= aux;
end;

procedure insertar (var v: vector; var dimL: integer);
var i, pos: integer; alumnoIns: alumno;
begin
  writeln('alumno a insertar: '); leer(alumnoIns);
  writeln('posicion: '); readln(pos);
  if ((dimL + 1) <= dimF) and (pos >= 1) and (pos <= dimL) then
    begin
      for i:= dimL downto pos do
        v[i + 1]:= v[i];
      v[pos]:= alumnoIns;
      dimL:= dimL + 1;
    end;
end;

procedure eliminar (var v: vector; var dimL: integer);
var i, pos: integer;
begin
  writeln('posicion del alumno a eliminar: '); readln(pos);
  if (pos >= 1) and (pos <= dimL) then
    begin
      for i:= pos to (dimL - 1) do
        v[i]:= v[i + 1];
      dimL:= dimL - 1;
    end;
end;

procedure eliminarCNum (var v: vector; var dimL: integer);
var i, pos, num: integer;
begin
  writeln('ingrese el numero del alumno a eliminar: '); readln(num);
  pos:= posicion(v, dimL, num);
  if (pos >= 1) and (pos <= dimL) then
    begin
      for i:= pos to (dimL - 1) do
        v[i]:= v[i + 1];
      dimL:= dimL - 1;
    end;
end;

procedure eliminarTodos (var v: vector; var dimL: integer);
var i, pos, a: integer;
begin
  for i:= 1 to dimL do
    begin
      if (v[i].asist = 0) then
        begin
          pos:= i;
          if (pos <= dimL) and (pos >= 1) then
            begin
              for a:= pos to (dimL - 1) do
                v[a]:= v[a + 1];
              dimL:= dimL - 1;
            end;
        end;
    end;
end;

var
  v, b: vector;
  numBusqueda, pos, dimL, dimL2, j, h: integer;
  alu: alumno;
begin
  cargar(v, dimL);                 //  se dispone pero lo hago para probar
  b:= v; dimL2:= dimL;
  // a)
  writeln('numero de alumno a buscar: '); readln(numBusqueda);
  pos:= posicion(v, dimL, numBusqueda);
  // b)
  insertar(v, dimL);
  // c)
  eliminar(v, dimL);
  // d)
  eliminarCNum(v, dimL);
  // e)
  eliminarTodos(v, dimL);
  // prueba
  writeln('vector original (b): ');
  for j:= 1 to dimL2 do
    write(b[j].nomYApe); write(' ');
  writeln('vector modificado (v): '); 
  for h:= 1 to dimL do
    write(v[h].nomYApe); write(' ');
end.