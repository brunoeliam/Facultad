(* Indicar los valores que imprimen los siguientes programas en Pascal. Justificar mediante prueba de
escritorio.

a) *) 
(*
program ej4;
type
  cadena = string[50];
  puntero_cadena = ^cadena;
var
  pc: puntero_cadena;
begin
  pc^:= 'un nuevo texto';
  new(pc);
  writeln(pc^);       // 51      ACA LE ERRASTE PORQ TIRA ERROR, NO HAY NINGUN VALOR GUARDADO EN LO QUE APUNTA POR PC
end. 

 (* b)  program ej4;
type
  cadena = string[50];
  puntero_cadena = ^cadena;
var
  pc: puntero_cadena;
begin
  new(pc);
  pc^:= 'un nuevo nombre';
  writeln(sizeof(pc^), ' bytes');     //  51
  writeln(pc^);                       //  'un nuevo nombre'           ESTE SE ROMPE TODO, PORQ QUERES ASIGNARLE UN VALOR A UNA DIRECCION QUE YA HICISTE UN DISPOSE
  dispose(pc);
  pc^:= 'otro nuevo nombre';
end. *)


(* c) program ej4;
type
  cadena = string[50];
  puntero_cadena = ^cadena;

procedure cambiarTexto(pun: puntero_cadena);
  begin
    pun^:= 'Otro texto';
  end;
  
var
  pc: puntero_cadena;
begin
  new(pc);    
  pc^:= 'Un texto';
  writeln(pc^);         //   'Un texto' 
  cambiarTexto(pc^);
  writeln(pc^);         //    'Otro texto'
end.

d)*)
program ej4;
type
  cadena = string[50];
  puntero_cadena = ^cadena;

procedure cambiarTexto(pun: puntero_cadena);
  begin
    new(pun);
    pun^:= 'Otro texto';
  end;

var
  pc: puntero_cadena;
begin
  new(pc);
  pc^:= 'Un texto';
  writeln(pc^);         //  'Un texto'
  cambiarTexto(pc);
  writeln(pc^);         //  'Otro texto'
end.
// ACA NO CAMBIA, IMPRIME LO MISMO Y LE ERRASTE PORQ AL HACER UN NEW AHORA APUNTA A OTRA DIRECCION, ENTONCES SE MODIFICA ESA NUEVA DIRECCION Y CUANDO SALE DEL PROGRAMA pc^ APUNTA A LO MISMO QUE APUNTABA ANTES DE ENTRAR AL MODULO