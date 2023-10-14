{ La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales lanzadas
al espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la misión
(cantidad de meses que permanecerá activa), el costo de construcción, el costo de mantenimiento mensual y
rango del espectro electromagnético sobre el que realizará estudios. Dicho rango se divide en 7 categorías:
1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma
Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura finaliza al
ingresar la sonda llamada “GAIA”, que debe procesarse.
Una vez finalizada la lectura, informar:
a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.
Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse la menor cantidad de veces posible }

program ej6;
const
  categ = 7;
type
  rango = 1..7;
  vector = array [rango] of integer;

  sonda = record
    nom: string;
    dur: integer;
    costoCon: real;
    costoMan: real;
    cat: rango;
  end;

  lista = ^nodo;
  nodo = record
    dato: sonda;
    sig: lista;
  end;

procedure agregarAdelante (var l: lista; s: sonda);
var aux: lista;
begin
  new(aux);
  aux^.dato:= s;
  aux^.sig:= l;
  l:= aux;
end;

procedure leerSonda (var s: sonda);
begin
    writeln('nombre de la sonda: '); readln(s.nom);
    writeln('duracion: '); readln(s.dur);
    writeln('costo de construccion: '); readln(s.costoCon);
    writeln('costo de mantenimiento: '); readln(s.costoMan);
    writeln('categoria (1-7): '); readln(s.cat);
end;

procedure cargarLista (var l: lista);
var s: sonda;
begin
  repeat 
    leerSonda(s);
    agregarAdelante(l,s);
  until (s.nom = 'GAIA');
end;

procedure maximo (s: sonda; var max: real; var nomMax: string);
begin
  if ((s.costoCon + s.costoMan) > max) then begin
    max:= s.costoCon + s.costoMan;
    nomMax:= s.nom;
  end;
end;

procedure promedios (l: lista; var promDura: integer; var promCosto: real);
var cant, durTotal: integer; costoTotal: real;
begin
  cant:= 0; durTotal:= 0; costoTotal:= 0;
  while (l <> nil) do begin
    cant:= cant + 1;
    durTotal:= durTotal + l^.dato.dur;
    costoTotal:= costoTotal + l^.dato.costoCon;
    l:= l^.sig;
  end;
  promDura:= durTotal div cant;
  promCosto:= costoTotal / cant;
end;

procedure incisos (l: lista; v: vector);
var 
max, promCosto: real; 
nomMax: string;
cantDuracion, promDura, x: integer;
begin
  max:= -1; 
  cantDuracion:= 0;
  promedios(l, promDura, promCosto);

  while (l <> nil) do begin
    maximo(l^.dato, max, nomMax);                                                             // a)
    
    v[l^.dato.cat]:= v[l^.dato.cat] + 1;                                                      // b)

    if (l^.dato.dur > promDura) then  
      cantDuracion:= cantDuracion + 1;                                                        // c)
    if (l^.dato.costoCon > promCosto) then     
      writeln('la sonda ' ,l^.dato.nom, ' tiene un costo de construccion MAYOR al promedio'); // d)
    l:= l^.sig;
  end;

  writeln('sonda mas costosa: ' ,nomMax);
  writeln('cant de sondas cuya duracion supera la duracion promedio: ' ,cantDuracion);
  writeln('cant de sondas que realizaran estudios en el rango: ');
  for x:= 1 to categ do
    writeln(x, ':' , v[x]);
end;


var
  l: lista;
  v: vector;
  i: integer;
begin
  // inicializo
  l:= nil;
  for i:= 1 to 7 do
    v[i]:= 0;

  cargarLista(l);
  incisos(l, v);
end.