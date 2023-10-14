(* Dado el siguiente código que lee información de personas hasta que se ingresa la persona con dni 0 y luego
imprime dicha información en el orden inverso al que fue leída, identificar los 9 errores. *)
program ej2;
type
  lista = ^nodo;

  persona = record
    dni: integer;
    nombre: string;
    apellido: string;
  end;

  nodo = record
    dato: persona;
    sig: lista;
  end;

procedure leerPersona (p: persona);   // ERROR 1: esta pasando por valor y deberia ser por referencia
begin
  read(p.dni);
  if (p.dni <> 0) then begin
    read(p.nombre);
    read(p.apellido);
  end;
end;

{Carga la lista hasta que llega el dni 0}
procedure generarLista (var l: lista);
var p: nodo;                 // ERROR 2: seria tipo persona no tipo nodo
begin
  leerPersona(p);           
  while (p.dni <> 0) do begin
    agregarAdelante(l, p);             
                                        // ME FALTO ESTE: FALTA QUE SIGA LEYENDO PERSONAS!!!!!!!
  end;
end;

procedure imprimirInformacion (var l: lista);      
 // ERROR 3: se esta pasando por referencia y no hace falta, yo usaria una variable aux con el valor de l inicializado antes del while

begin
  while (l <> nil) do begin
    writeln('DNI: ', l^.dato.dni, 'Nombre:',
    l^.nombre, 'Apellido:', l^.apellido);             // ERROR 4: seria l^.dato.nombre y l^.dato.apellido
    l:= l^.sig; 
  end;
end;

{Agrega un nodo a la lista}
procedure agregarAdelante (l: lista; p: persona);     // ERROR 5: aca pasaria por referencia lista
var aux: lista;
begin
  aux^.dato:= p;                                      // ERROR 6: falta hacer new(aux)
  aux^.sig:= l;
  l:= aux;
end;

{Programa principal}
var
  l: lista;
begin                     
  generarLista(l);               // ERROR 7: falta asignarle nil a l en algun lado, por ej en el modulo generarLista()
  imprimirInformacion(l);
end.