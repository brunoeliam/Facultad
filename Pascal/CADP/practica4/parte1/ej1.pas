program ej2;
const
  cant_datos = 150;
type
  vdatos = array[1..cant_datos] of real;

procedure cargarVector(var v:vdatos;
  var dimL : integer);
var
. . . { completar }
begin
. . . { completar }
end;
procedure modificarVectorySumar(var v:vdatos;
dimL : integer; n: real; var suma: real);
var
. . . { completar }
{ programa principal }
var
datos : vdatos;
i, dim : integer;
num, suma : real;
begin
dim := 0;
sumaTotal := 0;
cargarVector(...); { completar }
writeln(‘Ingrese un valor a sumar’);
readln(num);
modificarVectorySumar(...);{completar}
writeln(‘La suma de los valores es: ’, suma);
writeln(‘Se procesaron: ’,dim, ‘ números’)
end.

begin
. . . { completar }
end;