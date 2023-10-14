(* 3.- Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
diciembre de 2022. De cada película se conoce: código de película, código de género (1: acción,
2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror) y puntaje
promedio otorgado por las críticas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de
género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el
código de la película -1.
b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje
obtenido entre todas las críticas, a partir de la estructura generada en a)..
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos
métodos vistos en la teoría.
d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje,
del vector obtenido en el punto c). *)



program ej3;
const 
	fin = -1;
	ocho = 8;
type
	long = 1..ocho;
  
	pelicula = record 
		cod: integer;
    genero: long;
    puntaje: real;
  end;
  
	Lista = ^Nodo;
  
	Nodo = record
  	dato: pelicula;
    sig: Lista;
  end;
  
  vector = array [long] of Lista;
  vector2 = array [long] of integer;

procedure Leer (var p: pelicula);
begin 
	readln (p.cod);
  if (p.cod<>fin) then begin   
		readln (p.genero);
  	readln (p.puntaje);
	end;  
end;

procedure agregarAtras (var L: Lista; p: pelicula);
var	nue, act: Lista;
begin
	new(nue); nue^.dato:= p; nue^.sig:= nil;
  if (L = nil) then
 		L:= nue
  else begin 
  	act:= L;
    while (act <> nil) do  
    	act:= act^.sig;
    act^.sig:= nue;
  end;
end;

procedure Inicializar (var v: vector);
var i: integer;
begin
	for i:= 1 to ocho do  
  	v[i]:= nil;
end;

procedure Procesar (var v: vector);
var 
	p: pelicula;
begin 
	Leer (p);
  while (p.cod <> fin) do begin
  	agregarAtras (v[p.genero], p);
    Leer (p);
	end;
end;

function Recorrer (v: vector; max:real; i:integer): integer;
var 
  codMax: integer;
begin	
	while (v[i] <> nil) do begin 
  	if (v[i]^.dato.puntaje > max) then begin
    	max:= v[i]^.dato.puntaje;
      codMax:= v[i]^.dato.cod;      
    end;
    v[i]:= v[i]^.sig;
  end;
  Recorrer:= codMax;  
end;

procedure IncisoB (var v2: vector2; v: vector);
var maxPunt: real; i: integer;
begin 
  for i:= 1 to ocho do begin 
  	maxPunt:= -1;
		v2[i]:= Recorrer (v,maxPunt,i);
  end;
end;

procedure IncisoC (var v2: vector2);
var i, j, item: integer;
begin
	for i:= 2 to 8 do begin 														//  (dimL)
  	item:= v2[i];
    j:= i - 1;
    while ((j>0) and (v2[j]>item)) do begin 
    	v2[j+1]:= v2[j];
      j:= j - 1;
    end;
    v2[j+1]:= item;
  end;
end;

procedure IncisoD (v: vector; max, min: real; codMax, codMin: integer);
var i: integer;
begin 
	for i:= 1 to ocho do
  	while (v[i] <> nil) do begin
  		if (v[i]^.dato.puntaje > max) then begin
    		max:= v[i]^.dato.puntaje;
        codMax:= v[i]^.dato.cod;
      end
      else 
      	if (v[i]^.dato.puntaje < min) then begin
        	min:= v[i]^.dato.puntaje;
          codMin:= v[i]^.dato.cod;
        end;
      v[i]:= v[i]^.sig;
  	end;
  writeln (codMax,codMin);
end;

var
	v: vector;
	v2: vector2;
  max, min: real;
  codMax, codMin: integer;
  
begin
  Inicializar (v);
  Procesar (v);
  IncisoB (v2,v);
  IncisoC (v2);
  max:= -1; min:= 9999;
  IncisoD (v,max,min,codMax,codMin);
end.
