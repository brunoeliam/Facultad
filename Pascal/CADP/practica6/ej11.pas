{ La Facultad de Informática debe seleccionar los 10 egresados con mejor promedio a los que la UNLP les
entregará el premio Joaquín V. González. De cada egresado se conoce su número de alumno, apellido y el
promedio obtenido durante toda su carrera.
Implementar un programa que:
a. Lea la información de todos los egresados, hasta ingresar el código 0, el cual no debe procesarse.
b. Una vez ingresada la información de los egresados, informe el apellido y número de alumno de los
egresados que recibirán el premio. La información debe imprimirse ordenada según el promedio del egresado
(de mayor a menor). }

program ej11;
const
  dimF = 10;
type
  egresado = record
  num: integer;
  apellido: string;
  promedio: real;
  end;

  lista = ^nodo;

  nodo = record
  dato: egresado;
  sig: lista;
  end;

  vector = array [1..dimF] of egresado;

procedure insertarOrdenado (var l: lista; e: egresado);
var nue, ant, act: lista;
  begin
    new(nue); nue^.dato:= e;
    act:= l; ant:= l;
    while (act <> nil) and (act^.dato.promedio > e.promedio) do begin
      ant:= act;
      act:= act^.sig;
    end;
    if (ant = act) then
      l:= nue
    else
      ant^.sig:= nue;
    nue^.sig:= act;
  end;

procedure leerEgresado (var e: egresado);
  begin
    writeln('numero de alumno: '); readln(e.num);
    if (e.num <> 0) then begin
      writeln('apellido: '); readln(e.apellido);
      writeln('promedio: '); readln(e.promedio);
    end;
  end;

procedure cargarLista (var l: lista);
var e: egresado;
  begin
    leerEgresado(e);
    while (e.num <> 0) do begin
      insertarOrdenado(l, e);
      leerEgresado(e)
    end;
  end;

procedure incisoB (l: lista);
var x, y: integer; v: vector;
  begin
    for x:= 1 to dimF do
      begin
        v[x].promedio:= 0;
        v[x].numAlumno:= 0;
        v[x].apellido:= 'Vacio';
      end;
      
    while (l <> nil) do
      begin
        x:= 1;
        while (v[x].promedio > l^.dato.promedio) and (x <= dimF) do
          x:= x + 1;
        
        if (x <= dimF) then
          begin
            if (x = dimF) then
              v[x]:= l^.dato
            else
              begin
                for y:= dimF downto x do
                  v[y]:= v[y - 1];
                v[y]:= l^.dato;
              end;
          end;
        l:= l^.sig;
      end;
    for x:= 1 to dimF do
      writeln (v[x].apellido,' ',v[x].num);
  end;

var
  l: lista
begin
  l:= nil;
  cargarLista(l);
  incisoB(l);
end.


// REVISAR EL PROCEDURE DEL B