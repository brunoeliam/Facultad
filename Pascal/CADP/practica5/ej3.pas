(* Indicar los valores que imprime el siguiente programa en Pascal. Justificar mediante prueba de
escritorio. *)
program ej3;
type
  numeros = array[1..10000] of integer;
  puntero_numeros = ^numeros;
var
  n: puntero_numeros;
  num: numeros;
  i: integer;
begin
  writeln(sizeof(n), ' bytes');        //  4
  writeln(sizeof(num), ' bytes');      //  
  new(n);
  writeln(sizeof(n^), ' bytes');       //  
  for i:= 1 to 5000 do
    n^[i]:= i;
  writeln(sizeof(n^), ' bytes');       //  
end.

(* para calcular los vectores es la longitud del array * lo que ocupa el tipo de dato que contiene *)