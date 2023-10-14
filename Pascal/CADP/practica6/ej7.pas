(* El Programa Horizonte 2020 (H2020) de la Unión Europea ha publicado los criterios para financiar
proyectos de investigación avanzada. Para los proyectos de sondas espaciales vistos en el ejercicio anterior, se
han determinado los siguientes criterios:
- solo se financiaran proyectos cuyo costo de mantenimiento no supere el costo de construcción.
- no se financiaran proyectos espaciales que analicen ondas de radio, ya que esto puede realizarse desde la
superficie terrestre con grandes antenas.
A partir de la información disponible de las sondas espaciales (la lista generada en ejercicio 6), implementar
un programa que:
a) Invoque un módulo que reciba la información de una sonda espacial, y retorne si cumple o no con los
nuevos criterios H2020.
b) Utilizando el módulo desarrollado en a) implemente un módulo que procese la lista de sondas de la ESA y
retorne dos listados, uno con los proyectos que cumplen con los nuevos criterios y otro con aquellos que no
los cumplen.
c) Invoque a un módulo que reciba una lista de proyectos de sondas espaciales e informe la cantidad y el
costo total (construcción y mantenimiento) de los proyectos que no serán financiados por H2020. Para ello,
utilice el módulo realizado en b. *)

program ej7;
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

function cumple (s: sonda): boolean;               // a)
begin
  cumple:= (s.costoCon >= s.costoMan) and (s.cat <> 1);
end;

procedure nuevasListas (l: lista; var si, no: lista);   // b)
begin
  while (l <> nil) do begin                                                          
    if (cumple(l^.dato)) then                                                 
      agregarAdelante(si, l^.dato)
    else 
      agregarAdelante(no, l^.dato);
    l:= l^.sig;
  end;
end;

procedure ultimo (l: lista);
var 
si, no: lista; 
cant: integer; 
costoTotal: real;
begin
  si:= nil; no:= nil;
  cant:= 0;
  costoTotal:= 0.00;
  nuevasListas(l, si, no);
  while (no <> nil) do begin
    cant:= cant + 1;
    costoTotal:= costoTotal + no^.dato.costoCon + no^.dato.costoMan;
    no:= no^.sig;
  end;
  writeln('cantidad que no seran financiados: ' ,cant, ' costo total de estos proyectos: ' ,costoTotal:2:2);
end;

var
  l: lista;
begin
  // inicializo
  l:= nil;
  cargarLista(l);
  ultimo(l);
end.
