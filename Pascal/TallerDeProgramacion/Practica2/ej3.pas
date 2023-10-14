(* Escribir un programa que:
a. Implemente un módulo recursivo que genere una lista de números enteros “random”
mayores a 0 y menores a 100. Finalizar con el número 0.
b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.
c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.
d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se
encuentra en la lista o falso en caso contrario. *)

program ej3;
const 
	fin=0;
type 

Lista = ^Nodo;

Nodo=record 
	dato:integer;
	sig:Lista;
end;

procedure CargarLista (var L:Lista);
var
num: integer;
nue: lista;
begin
	num:= random(101);
  if (num<>0) then begin
  	CargarLista(L);
  	new(nue);
    nue^.dato:= num;
    nue^.sig:=L;
    L:=nue;
  end
	else L:=nil; 
end;

function IncisoB(L: Lista): integer;
var
  min: integer;
begin
  if (L = nil) then
    min:= 102  // Valor máximo, para indicar que la lista está vacía
  else begin
    min := IncisoB(L^.sig);  // Llamada recursiva para encontrar el mínimo en el resto de la lista
    if (L^.dato < min) then
      min := L^.dato;
  end;
  IncisoB := min;  // Retorna el mínimo después de comparar con el valor actual del nodo
end;

function IncisoD (L: Lista): boolean;
var aux: boolean; num: integer;
begin
	if (L = nil) then
		writeln ('Ingrese un numero: '); readln (num);
		aux:= false;
	if (L^.dato <> num) then  
		incisoD(L^.sig);
	if (L^.dato = num) then
		aux:=true[
end;

var
	L: Lista;
  act: Lista;
begin 
	randomize;
	L:= nil;
	CargarLista (L);
	act:= L;
    while (act <> nil) do begin
  	Writeln(' ', act^.dato);
    act:=act^.sig;
    end;
    Writeln(IncisoB(L));
    readln ();
end.
