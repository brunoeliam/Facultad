(* Dado el siguiente programa: *)
program ej1;
type
  lista = ^nodo;

  nodo = record
    num: integer;
    sig: lista;
  end;

procedure armarNodo(var L: lista; v: integer);
var aux: lista;
  begin
    new(aux);
    aux^.num:= v;
    aux^.sig:= L;
    L:= aux;
  end;

procedure imprimir (L: lista);
var aux: lista;
  begin
    aux:= L;
    while (aux <> nil) do
    begin
      writeln(aux^.num);
      aux:= aux^.sig;
    end;
  end;

procedure incrementar (var L: lista; nro: integer);
var aux: lista;
begin
  aux:= L;
  while (aux <> nil) do
  begin
    aux^.num:= aux^.num + nro;
    aux:= aux^.sig;
  end;
end;

var
  pri: lista;
  valor, nro: integer;
begin
  pri:= nil;
  writeln('Ingrese un numero');
  read(valor);
  while (valor <> 0) do begin
    armarNodo(pri, valor);
    writeln('Ingrese un numero');
    read(valor);
  end;
  //. . . { imprimir lista }
  imprimir(pri);
  readln(nro);
  incrementar(pri, nro);
  imprimir(pri);
end.
(* 
a. Indicar qué hace el programa. 
  // lo que hace es cargar una lista que al principio estaba vacia, esto se realiza hasta que se ingrese el num 0. (FALTO AGREGAR QUE SE AGREGA EN ORDEN INVERSO, ES DECIR ES UN AGREGAR ADELANTE)
b. Indicar cómo queda conformada la lista si se lee la siguiente secuencia de números: 10 21 13 48 0.
  // 10 21 13 48  (QUEDA AL REVES: 48 13 21 10)
c. Implementar un módulo que imprima los números enteros guardados en la lista generada.
d. Implementar un módulo que reciba la lista y un valor, e incremente con ese valor cada dato de la lista.*)