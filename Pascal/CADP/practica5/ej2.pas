(* Indicar los valores que imprime el siguiente programa en Pascal. Justificar mediante prueba de
escritorio.*)

program ej2;
type
cadena = string[9];

producto = record
codigo: integer;
descripcion: cadena;
precio: real;
end;

puntero_producto = ^producto;

var
p: puntero_producto;
prod: producto;

begin
  writeln(sizeof(p), ' bytes');           //  4
  writeln(sizeof(prod), ' bytes');        //  16
  new(p);
  writeln(sizeof(p), ' bytes');           //  4
  p^.codigo := 1;
  p^.descripcion := 'nuevo producto';
  writeln(sizeof(p^), ' bytes');          //  16
  p^.precio := 200;
  writeln(sizeof(p^), ' bytes');          //  16
  prod.codigo := 2;
  prod.descripcion := 'otro nuevo producto';
  writeln(sizeof(prod), ' bytes');        //  16
end.

(* lo hiciste flama pero te cagaron con los valores, en vez de 16 va 24 no se por que*)