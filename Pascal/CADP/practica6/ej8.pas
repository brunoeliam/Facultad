{ Utilizando el programa del ejercicio 1, modificar el módulo armarNodo para que los elementos de la lista
queden ordenados de manera ascendente (insertar ordenado) }

program ej8;
type
  lista = ^nodo;

  nodo = record
    num: integer;
    sig: lista;
  end;

procedure armarNodo(var L: lista; v: integer);
var aux, anterior, actual: lista;
  begin
    new(aux); aux^.num:= v; aux^.sig:= nil;

    if (L = nil) then
      L:= aux
    else begin
      actual:= L; anterior:= L;
      while (actual <> nil) and (actual^.num < aux^.num) do
      begin
        anterior:= actual;
        actual:= actual^.sig;
      end;

      if (actual = L) then begin
        aux^.sig:= L;
        L:= aux;
      end

      else begin
        anterior^.sig:= aux;
        aux^.sig:= actual;
      end
    end;
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