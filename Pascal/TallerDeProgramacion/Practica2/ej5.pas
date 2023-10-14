(* Implementar un módulo que realice una búsqueda dicotómica en un vector, utilizando el
siguiente encabezado:
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
en el vector. *)

program ej5;
const 
	diez=10;
type
	long=1..diez;
	vector=array [long] of integer;




procedure cargarVector (var v:vector);
var 
i: integer;
begin 
	For i:= 1 to diez do begin
		writeln ('Ingrese un numero de manera ordenada:');
  	readln (v[i]);
	end;
end;

procedure busquedaDicotomica (v: vector; ini,fin: integer; dato:integer; var pos: integer);
var 
	medio: integer;
begin 
  medio:= ((ini + fin) div 2);
	while (ini <= fin) and (dato <> v[medio]) do begin
  	if (dato < v[medio]) then fin:= medio - 1
    else 
    	 ini:= medio + 1;
    	 medio:= (ini + fin) div 2;
  end;
  if ((ini <= fin) and (dato = v[medio])) then pos:= medio;
end;



var 
	v: vector;
  dato: integer;
  pos: integer;
begin 
	pos:= -1;
	cargarVector(v);
    writeln ('Ingrese un num:');
    readln (dato);
    busquedaDicotomica (v,1,10,dato,pos);
    writeln (pos);
    readln ();
end.
