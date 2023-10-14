(*Dado el siguiente programa:*)

Program ej1;
Type 
  str20 = string[20];
  alumno = Record
    codigo: integer;
    nombre: str20;
    promedio: real;
  End;
Procedure calcularMax(var alu: alumno; var max: real; var nombreMax: str20);
  begin
    if (alu.promedio > max) then
    begin
      max:= alu.promedio;
      nombreMax:= alu.nombre;
    end;
  end;
Procedure leer(var alu: alumno);
var
  max: real;
  cant: integer;
  nombreMax: str20;
begin
    max:= -1;
    cant:= 0;
    nombreMax:= '';

    writeln('Ingrese el codigo del alumno');
    readln(alu.codigo);
    while (alu.codigo <> 0) do 
    begin
      cant:= cant + 1;
      writeln('Ingrese el nombre del alumno');
      readln(alu.nombre);
      writeln('Ingrese el promedio del alumno');
      readln(alu.promedio);
      calcularMax(alu, max, nombreMax);
      writeln('Ingrese el codigo del alumno');
      readln(alu.codigo);
    end;
    writeln('la cantidad de alumnos leidos fue de: ' ,cant);
    writeln('el nombre del alumno con mejor promedio fue: ' ,nombreMax);
end;

{ declaración de variables del programa principal }
Var 
  a: alumno;
{ cuerpo del programa principal }
Begin
  leer(a);
End.

(*a. Completar el programa principal para que lea información de alumnos (código, nombre, promedio) e informe la cantidad de alumnos leídos. La lectura finaliza cuando ingresa un alumno con código 0, que no debe procesarse. Nota: utilizar el módulo leer.
b. Modificar al programa anterior para que, al finalizar la lectura de todos los alumnos, se informe también el nombre del alumno con mejor promedio *)