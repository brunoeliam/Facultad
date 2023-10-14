(* Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. Máximo: recibe la lista como parámetro y retorna el elemento de valor máximo.
b. Mínimo: recibe la lista como parámetro y retorna el elemento de valor mínimo.
c. Múltiplos: recibe como parámetros la lista L y un valor entero A, y retorna la cantidad de elementos de la
lista que son múltiplos de A. *)
program ej4;
type
  lista = ^nodo;

  nodo = record
    num: integer;
    sig: lista;
  end;

procedure armarNodo (var L: lista; v: integer);
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

function maximo (L: lista): integer;                        // A)
var aux: lista; max: integer;
  begin
    max:= -999;
    aux:= L;
    while (aux <> nil) do begin
      if (aux^.num > max) then
        max:= aux^.num;
      aux:= aux^.sig;
    end;
    maximo:= max;
  end;

function minimo (L: lista): integer;                        // B)
var aux: lista; min: integer;
  begin
    min:= 999;
    aux:= L;
    while (aux <> nil) do begin
      if (aux^.num < min) then
        min:= aux^.num;
      aux:= aux^.sig;
    end;
    minimo:= min;
  end;

function multiplo (L: lista; A: integer): integer;          // C)
var aux: lista; cant: integer;
  begin
    cant:= 0;
    aux:= L; 
    while (aux <> nil) do begin
      if ((aux^.num mod A) = 0) then
        cant:= cant + 1;
      aux:= aux^.sig;
    end;
    multiplo:= cant;
  end;

var
  pri: lista;
  valor, nro, A: integer;
begin
  pri:= nil;
  writeln('Ingrese un numero'); read(valor);
  while (valor <> 0) do begin
    armarNodo(pri, valor);
    writeln('Ingrese un numero'); read(valor);
  end;

  { // ... imprimir lista 
  imprimir(pri);
  readln(nro);
  incrementar(pri, nro);
  imprimir(pri);}

  // prueba 
  writeln('numero para la funcion multiplo: '); readln(A);
  writeln('maximo de la lista: ' , maximo(pri) , ' minimo: ' , minimo(pri) , ' cantidad que son multiplos del numero: ' , multiplo(pri, A));
end.
