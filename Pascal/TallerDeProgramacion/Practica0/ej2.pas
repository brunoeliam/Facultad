{ Implementar un programa que procese información de propiedades que están a la venta 
en una inmobiliaria.  Se pide:
a)  Implementar  un  módulo  para  almacenar  en  una  estructura  adecuada,  las  propiedades 
agrupadas por zona. Las propiedades de una misma zona deben quedar almacenadas 
ordenadas por tipo de propiedad. Para cada propiedad debe almacenarse el código, el tipo de 
propiedad y el precio total. De cada propiedad se lee: zona (1 a 5), código de propiedad, tipo 
de  propiedad,  cantidad  de  metros  cuadrados  y  precio  del  metro  cuadrado.  La  lectura  finaliza 
cuando se ingresa el precio del metro cuadrado -1. 
b)  Implementar  un  módulo  que  reciba  la  estructura  generada  en  a),  un  número  de  zona  y  un  tipo  de 
propiedad y retorne los códigos de las propiedades de la zona recibida y del tipo recibido. }

program ej2;
const
	fin = -1;
  max = 5;
type
	long = 1..5;
	
	propiedad = record
  	zona: long;
    cod: integer;
    tipo: integer;
    metros: real;
    precio: real;
	end;
  
  lista = ^nodo;
  
  nodo = record
  	dato: propiedad;
    sig: lista;
  end;

  vector = array [long] of lista;

  listaN = ^nodoN;
  
  nodoN = record
  	codigo: integer;
    sig: listaN;
  end;

{ ------------------------------------------ }

procedure inicializar (var v: vector);  
var i: long;
begin
  for i:= 1 to max do 
    v[i]:= nil;
end;

procedure LeerPropiedad (var p: propiedad);
begin
    readln (p.precio);
    if (p.precio <> fin) then begin 
      readln (p.zona);
  		readln (p.cod);
      readln (p.tipo);        
      readln (p.metros);
    end;
end;

procedure insertarOrdenado (var L: lista; p: propiedad);                              
var ant, act, nue: lista;
begin
	new (nue);
  nue^.dato:= p;
  act:= L;
  while ((act <> nil) and (act^.dato.tipo < p.tipo)) do begin
  	ant:= act;
    act:= act^.sig;
  end;
  if (act = L) then 
  	L:= nue
  else 
  	ant^.sig:= nue;
  nue^.sig:= act;
end;
	
procedure cargarVector (var v: vector);
var p: propiedad;
begin
	LeerPropiedad (p);
  while (p.precio <> fin) do begin 
  	insertarOrdenado (v[p.zona], p);  
  	LeerPropiedad (p);	
  end;
end;

procedure agregarAdelante (var ln: listaN; cod: integer);
var nuev: listaN;
begin
  new(nuev);
  nuev^.codigo:= cod;
  nuev^.sig:= ln;
  ln:= nuev;
end;

procedure incisoB (v: vector; var ln: listaN);
var numZona, numTipo: integer;
begin
  writeln ('zona en donde buscar:'); readln (numZona);
  writeln ('tipo de propiedad a buscar:'); readln (numTipo);  
  while (v[numZona] <> nil) do begin 
    if (v[numZona]^.dato.tipo = numTipo) then 
      agregarAdelante(ln, v[numZona]^.dato.cod);
    v[numZona]:= v[numZona]^.sig;
  end;
end;
  
var 
	v: vector; ln: listaN;
begin 
  inicializar(v);
	cargarVector(v);
  ln:= nil;
	incisoB(v, ln);	
end.
