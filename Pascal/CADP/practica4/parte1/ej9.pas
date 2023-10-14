(* Modificar la solución del punto anterior considerando que el programa lea y almacene la información de a
lo sumo 400 alumnos. La lectura finaliza cuando se ingresa el DNI -1 (que no debe procesarse). *)

program ej9;
const
dimF = 3;

type
  cadena = string [50];
  rango = 1..dimF;

  alumno = record
  num: integer;
  dni: integer;
  ape: cadena;
  nombre: cadena;
  nac: integer;               
  end;


  vector = array [rango] of alumno;

// 

procedure leerAlumno (var alu: alumno);
  begin
      writeln('ingrese el numero: '); readln(alu.num);
      writeln('ingrese el apellido: '); readln(alu.ape);
      writeln('ingrese el nombre: '); readln(alu.nombre);
      writeln('ingrese el anio de nacimiento:'); readln(alu.nac);
  end;

procedure cargar (var v: vector; var dimL: integer);
var i: integer;
  begin
    dimL:= 0;
    i:= 1;
    writeln('ingrese el dni: '); readln(v[i].dni);
    while (v[i].dni <> -1) and (dimL < dimF) do
      begin
        dimL:= dimL + 1;
        i:= i + 1;
        leerAlumno(v[dimL]);
        if (dimL < dimF) then
         begin
          writeln('ingrese el dni: '); readln(v[i].dni);
         end;
      end;
  end;

function esPar (dni: integer): boolean;
var resto: integer; sigo: boolean;
  begin
    sigo:= true;
    while (dni <> 0) and (sigo) do 
      begin
        resto:= dni mod 10;
        if ((resto mod 2) = 0) then
          begin
            sigo:= true;
            dni:= dni div 10;
          end
        else 
            sigo:= false;
      end;
    esPar:= sigo;
  end;

procedure maximos (v: vector; i: integer; var max1, max2: integer; var apeMax1, apeMax2, nomMax1, nomMax2: cadena);
  begin
    if (v[i].nac < max1) then
      begin
        max2:= max1;
        nomMax2:= nomMax1;
        apeMax2:= apeMax1;
        max1:= v[i].nac;
        nomMax1:= v[i].nombre;
        apeMax1:= v[i].ape;
      end
    else 
    if (v[i].nac < max2) then
      begin
        max2:= v[i].nac;
        nomMax2:= v[i].nombre;
        apeMax2:= v[i].ape;
      end;
  end;

var
  v: vector;  
  i, cantPar, dimL: integer;
  porcentaje: real;
  max1, max2: integer;
  apeMax1, apeMax2, nomMax1, nomMax2: cadena;


begin                                            // programa principal
  max1:= 9999;
  cantPar:= 0;

  cargar(v, dimL);
  for i:= 1 to dimL do 
    begin
      maximos(v, i, max1, max2, apeMax1, apeMax2, nomMax1, nomMax2);
      if (esPar(v[i].dni)) then 
        cantPar:= cantPar + 1;
    end;
  porcentaje:= (cantPar * 100) / dimL;
  writeln('el porcentaje de alumnos con DNI compuesto solo por digitos pares fue de ' , porcentaje:2:2 , '%');
  writeln('apellido y nombre del primero mas viejo: ' , apeMax1 , nomMax1 , ' nombre y apellido del segundo mas viejo: ' , apeMax2 , nomMax2);
end.