(* Realizar un programa que lea números hasta leer el valor 0 e imprima, para cada número
leído, sus dígitos en el orden en que aparecen en el número. Debe implementarse un módulo
recursivo que reciba el número e imprima lo pedido. Ejemplo si se lee el valor 256, se debe
imprimir 2 5 6 *)

program ej2;
type

lista = ^nodo;

nodo = record 
   dato: integer;
   sig: lista;
   end;
   
procedure agregarAtras (var l: lista; n: integer);
var nue: lista;
begin
	new(nue); nue^.dato:= n; nue^.sig:= nil;
	if (l = nil) then 
		l = nue
	else begin
		act = l;
		while (act <> nil) then
			act:= act^.sig;
		act^.sig:= nue;
	end;
end;

procedure cargarLista (var l: lista);
var n: integer;
begin
	writeln ('ingrese n: '); readln(n);
	while (n <> 0) do begin
		agregarAtras(l, n)
		writeln ('ingrese n: '); readln(n);
	end;
end;

procedure imprimir (n: integer);
var dig: integer;
begin
	dig:= n div 10;
	while (dig >= 1) do
		dig:= n div 10;
	writeln(dig);
	n:= n mod 100;
	if (resto <>)
		writeln()
end;

procedure recorrer (l: lista);
var
begin
	while (l <> nil) do begin
		imprimir (l^.dato)
		l:= l^.sig;
	end;
end;
// prog. principal
begin
	l:= nil;
	cargarLista(l);
end;
