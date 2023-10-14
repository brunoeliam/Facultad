{ El Portal de Revistas de la UNLP está estudiando el uso de sus sistemas de edición electrónica por parte de
los usuarios. Para ello, se dispone de información sobre los 3600 usuarios que utilizan el portal. De cada
usuario se conoce su email, su rol (1: Editor; 2. Autor; 3. Revisor; 4. Lector), revista en la que participa y
cantidad de días desde el último acceso.
a. Imprimir el nombre de usuario y la cantidad de días desde el último acceso de todos los usuarios de la
revista Económica. El listado debe ordenarse a partir de la cantidad de días desde el último acceso (orden
ascendente).
b. Informar la cantidad de usuarios por cada rol para todas las revistas del portal.
c. Informar los emails de los dos usuarios que hace más tiempo que no ingresan al portal. }

program ej13;
const
  dimF = 3;                //    3600 va aca
  rolesUsuario = 4;
type
  rangoC = 1..rolesUsuario;

  contador = array [rangoC] of integer;

  usuario = record
  email: string;
  rol: rangoC;
  revista: string;
  cantD: integer;
  end;

  vector = array [1..dimF] of usuario;

  lista = ^nodo;

  nodo = record
  dato: usuario;
  sig: lista;
  end;

procedure inicializar (var c: contador);
var j: rangoC;
  begin
    for j:= 1 to rolesUsuario do
      c[j]:= 0;
  end;

procedure leerUsuario (var u: usuario);
  begin
    writeln('email: '); readln(u.email);
    writeln('rol (1-4): '); readln(u.rol);
    writeln('nombre de revista: '); readln(u.revista);
    writeln('cantidad de dias desde su ultimo acceso: '); readln(u.cantD);
  end;

procedure cargarVector (var v: vector);
var i: integer;
  begin
    for i:= 1 to dimF do
      leerUsuario(v[i]);
  end;

procedure insertarOrdenado (var l: lista; u: usuario);
var nue, ant, act: lista;
  begin
    new(nue); nue^.dato:= u;
    act:= l; ant:= l;
    while (act <> nil) and (act^.dato.cantD < u.cantD) do begin
      ant:= act;
      act:= act^.sig;
    end;
    if (ant = act) then
      l:= nue
    else
      ant^.sig:= nue;
    nue^.sig:= act;
  end;

procedure maximos (email: string; cant: integer; var mailMax1, mailMax2: string; var max1, max2: integer);
  begin
    if (cant > max1) then begin
      max2:= max1;
      mailMax2:= mailMax1;
      max1:= cant;
      mailMax1:= email;
    end 
    else if (cant > max2) then begin
      max2:= cant;
      mailMax2:= email;
    end;
  end;
  
procedure imprimir (l: lista; mailMax1, mailMax2: string; c: contador);
var t: integer;
  begin
    if (l <> nil) then
      writeln('usuarios de revista "Economica": ');
    while (l <> nil) do begin
      writeln('email: '  ,l^.dato.email, ' cant dias: ' ,l^.dato.cantD);
      l:= l^.sig;
    end;
    for t:= 1 to rolesUsuario do
      writeln('cantidad de usuarios del rol ' ,t, ' : ' ,c[t]);
    writeln('el usuario que hace mas tiempo no ingresa es: ' ,mailMax1, ' y el segundo es: ' ,mailMax2);
  end;

procedure incisos (var l: lista; v: vector; c: contador);
var max1, max2, k: integer; 
    mailMax1, mailMax2: string;
  begin
    max1:= -15; max2:= -15;
    for k:= 1 to dimF do begin
      if (v[k].revista = 'Economica') then
        insertarOrdenado(l, v[k]);
      maximos(v[k].email, v[k].cantD, mailMax1, mailMax2, max1, max2);
      c[v[k].rol]:= c[v[k].rol] + 1;
    end; 
    imprimir(l, mailMax1, mailMax2, c)
  end;

var
  l: lista;
  v: vector;
  c: contador;
begin
  inicializar(c);
  l:= nil;
  cargarVector(v);
  incisos(l, v, c);
end.