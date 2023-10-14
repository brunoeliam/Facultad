(* Utilizando el programa del ejercicio 1, realizar los siguientes cambios:
a. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados (agregar atrás).
b. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados, manteniendo un puntero al último ingresado. *)
program ej3;
type
  lista = ^nodo;

  nodo = record
    num: integer;
    sig: lista;
  end;

procedure armarNodo (var L: lista; v: integer); //           A)
var aux, pos: lista;
  begin
    new(aux);
    aux^.num := v;
    aux^.sig := nil;
    if (L = nil) then
      L:= aux
    else
      begin
        pos:= L;
        while (pos^.sig <> nil) do
          pos:= pos^.sig;
        pos^.sig:= aux;
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
  pri, ult: lista;                   // B)
  valor, nro: integer;
begin
  pri:= nil; 
  ult:= nil;                       // B)
  writeln('Ingrese un numero');
  read(valor);
  while (valor <> 0) do begin
    armarNodo(pri, ult, valor);         // MODIFICADO PARA EL B), EN CASO DEL A) los parametros son solo los 2 q taban
    writeln('Ingrese un numero');
    read(valor);
  end;
  // . . . { imprimir lista }
  imprimir(pri);
  readln(nro);
  incrementar(pri, nro);
  imprimir(pri);
end.


(* procedure armarNodo (var L, ult: lista; v: integer); //        B)
var aux, pos: lista;
  begin
    new(aux);
    aux^.num := v;
    aux^.sig := nil;
    ult:= aux;
    if (L = nil) then
      L:= aux
    else
      begin
        pos:= L;
        while (pos^.sig <> nil) do
          pos:= pos^.sig;
        pos^.sig:= aux;
      end;
  end; *)