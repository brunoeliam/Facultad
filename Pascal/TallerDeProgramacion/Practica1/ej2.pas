(* 2.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de
las expensas de dichas oficinas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina
se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura
finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la
oficina.
c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina. *)

program ej2;
const
	dimF = 300;
type
	oficina = record
		codigo: integer;
		dni: integer;
		valor: real;
	end;
	
	vector = array [1..dimF] of oficina;

procedure leerOficina (var o: oficina);
begin
	writeln ('ingrese el dni: '); readln (o.dni);
	writeln ('ingrese el valor: '); readln (o.valor);
end;

procedure generarV (var v: vector; dimL: integer);
var
	o: oficina;
begin
	readln (o.codigo);
	while ((o.codigo <> -1) and (dimL < dimF)) do begin
		leerOficina(o);
		dimL:= dimL + 1;
		v[dimL]:= o;
		readln (o.codigo);
	end;
end;

procedure seleccion (var v: vector; dimL: integer);
var
	i, j, pos: integer; aux: oficina;
begin
	for i:= 1 to dimL - 1 do begin
		pos:= i;
		for j:= i + 1 to dimL do
             if (v[j].codigo < v[pos].codigo) then pos:= j;

         aux:= v[pos];   
         v[pos]:= v[i];   
         v[i] := aux;
    end;
end;

procedure insercion (var v: vector; dimL: integer);
var 
	i, j: integer; actual: o;	
begin
	for i:= 2 to dimL do begin 
		 actual:= v[i];
		 j:= i - 1; 
		 while ((j > 0) and (v[j].codigo > actual.codigo)) do begin
			 v[j + 1]:= v[j];
			 j:= j - 1;                  
		 end;  
	     v[j + 1]:= actual; 
    end;
end;

var
	v: vector;
	dimL: integer;
begin
	dimL:= 0;
	generarV (v, dimL);
	insercion (v, dimL);
	seleccion (v, dimL);
end;
