(* Indicar los valores que imprime el siguiente programa en Pascal. Justificar mediante prueba de
escritorio. *)
program ej1;
type
  cadena = string[50];
  puntero_cadena = ^cadena;
var
  pc: puntero_cadena; 
begin
  writeln(sizeof(pc), ' bytes');            //       dinamica: 0
  new(pc);
  writeln(sizeof(pc), ' bytes');            //     dinamica: 50 + 1
  pc^:= 'un nuevo nombre';
  writeln(sizeof(pc), ' bytes');            //      dinamica: 
  writeln(sizeof(pc^), ' bytes');           //      dinamica: 15 + 1
  pc^:= 'otro nuevo nombre distinto al anterior';         
  writeln(sizeof(pc^), ' bytes');           //   dinamica: 38 + 1
end. *)

(* este lo hiciste mal, es 4 4 4 51 51, porque el asignarle no modifica*)