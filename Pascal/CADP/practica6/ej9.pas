{ Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a) EstaOrdenada: recibe la lista como parámetro y retorna true si la misma se encuentra ordenada, o false en
caso contrario.
b) Eliminar: recibe como parámetros la lista y un valor entero, y elimina dicho valor de la lista (si existe). Nota:
la lista podría no estar ordenada.
c) Sublista: recibe como parámetros la lista L y dos valores enteros A y B, y retorna una nueva lista con todos
los elementos de la lista L mayores que A y menores que B.
d) Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de
manera ascendente.
e) Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de
manera descendente }

program ej9;
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

function estaOrdenada (L: lista): boolean;
  var x: integer; aux: lista;
  begin
    aux:= L^.sig;
    if (aux <> nil) then
      begin
        if (aux^.num > L^.num) then
          begin
            x:= 0;
            while (L <> nil) and (L^.num > x) do
              begin
                x:= L^.num;
                L:= L^.sig;
              end;
          end
        else
          begin
            x:= 32767;
            while (L <> nil) and (L^.num < x) do
              begin
                x:= L^.num;
                L:= L^.sig;
              end;
          end
      end;
    estaOrdenada:= (L = nil);
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
  // . . . { imprimir lista }
  imprimir(pri);
  readln(nro);
  incrementar(pri, nro);
  imprimir(pri);
end.