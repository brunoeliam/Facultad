(* El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs.As,
con el objetivo de evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO para el año
2015 (1 docente cada 23,435 alumnos). Para ello, se cuenta con información de: CUE (código único de
establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, localidad. Se pide
implementar un programa que procese la información y determine:
- Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
- CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.    LISTO
El programa debe utilizar:  
a) Un módulo para la lectura de la información de la escuela.       LISTO 
b) Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la cantidad
de alumnos y la cantidad de docentes).        LISTO    *)    
program ej3;
const
unesco = 23.435;
type
  escuela = record
    cue: integer;
    nombre: string;
    docentes: integer;
    alumnos: integer;
    localidad: string;
  end;

procedure leer(var e: escuela);
begin
  writeln('ingrese el CUE '); readln(e.cue);
  writeln('ingrese el nombre del establecimiento '); readln(e.nombre);
  writeln('ingrese la cantidad de docentes '); readln(e.docentes);
  writeln('ingrese la cantidad de alumnos '); readln(e.alumnos);
  writeln('ingrese la localidad '); readln(e.localidad);
end;

function relacion(e: escuela): real;
  begin
    relacion:= e.alumnos / e.docentes;
  end;

procedure maximos(e: escuela; var max1, max2: real; var cueMax1, cueMax2: integer; var nomMax1, nomMax2: string);
var
relacionMax: real;
  begin
    relacionMax:= relacion(e);
    if (relacion(e) > max1) then
      begin
        max2:= max1;
        cueMax2:= cueMax1;
        nomMax2:= nomMax1;
        max1:= relacionMax;
        cueMax1:= e.cue;
        nomMax1:= e.nombre;
      end 
    else if (relacion(e) > max2) then
      begin
        max2:= relacionMax;
        cueMax2:= e.cue;
        nomMax2 := e.nombre;
      end;
  end;

function cumple(e: escuela): boolean;
  begin
    cumple:= (relacion(e)) > (unesco);
  end;

// programa principal

var
  max1, max2: real;
  e: escuela;
  i, cueMax1, cueMax2, cantSuperior: integer;
  nomMax1, nomMax2: string;
begin
  max1:= -1;
  max2:= -2;
  cueMax1:= 0;
  cueMax2:= 0;
  nomMax1:= '';
  nomMax2:= '';
  cantSuperior:= 0;

  for i:= 1 to 5 do 
  begin
    leer(e);
    maximos(e, max1, max2, cueMax1, cueMax2, nomMax1, nomMax2);
    if (cumple(e)) and (e.localidad = 'la plata') then
      cantSuperior:= cantSuperior + 1;
  end;
  writeln('la cantidad de escuelas de la plata que superan lo de la UNESCO es de ' ,cantSuperior, ' . la escuela con mejor relacion docente-alumno fue ' ,nomMax1, ' con el CUE ' ,cueMax1, ' , luego la segunda mejor fue ' ,nomMax2, ' de CUE ' ,cueMax2);
end.