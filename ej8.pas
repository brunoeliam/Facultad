(* La Comisión Provincial por la Memoria desea analizar la información de los proyectos presentados en el programa Jóvenes y Memoria durante la convocatoria 2020. Cada proyecto posee un código único, un título, el docente coordinador (DNI, nombre y apellido, email), la cantidad de alumnos que participan del proyecto, el nombre de la escuela y la localidad a la que pertenecen. Cada escuela puede presentar más de un proyecto. La información se ingresa ordenada consecutivamente por localidad y, para cada localidad, por escuela. Realizar un programa que lea la información de los proyectos hasta que se ingrese el proyecto con código -1 (que no debe procesarse), e informe:
- Cantidad total de escuelas que participan en la convocatoria 2018 y cantidad de escuelas por cada localidad.
- Nombres de las dos escuelas con mayor cantidad de alumnos participantes.
- Título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e impares. *)

program ej8;
type
  docente = record
  dni: integer;
  nomYApe: string;
  email: string;
  end;

  proyecto = record
  cod: integer;
  titulo: string;
  doc: docente;
  cantAlu: integer;
  escuela: string;
  localidad: string;
  end;

procedure leerDoc(var doc: docente);
  begin
    writeln('se esta por leer un docente.');
    writeln(' dni: '); readln(doc.dni);
    writeln('nombre y apellido: '); readln(doc.nomYApe);
    writeln('email: '); readln(doc.email);
  end;

procedure leerPro(var pro: proyecto);
  begin
    writeln('titulo: '); readln(pro.titulo);
    writeln('cantidad de alumnos: '); readln(pro.cantAlu);
    leerDoc(pro.doc);
  end;

procedure maximos(cant: integer; nom: string; var max1, max2: integer; var nMax1, nMax2: string);
  begin
    if (cant > max1) then
      begin
        max2:= max1;
        nMax2:= nMax1;
        max1:= cant;
        nMax1:= nom;
      end
    else if (cant > max2) then
      begin
        max2:= cant;
        nMax2:= nom;
      end;
  end;

procedure daireaux(cod: integer; tit: string);
var
pares: integer; impares: integer; dig: integer;
  begin 
    pares:= 0; impares:= 0;
    while (cod <> 0) do 
    begin
      dig:= cod mod 10;
      if ((dig mod 2) = (0)) then
        pares:= pares + 1
      else
        impares:= impares + 1;
      cod:= cod div 10;
    end;
    if (pares = impares) then
      writeln('el codigo del proyecto ' ,tit, 'de la localidad de daireaux tiene la misma cantidad de digitos pares e impares ( ' ,cod, ' )');
  end;

var
  pro: proyecto;
  doc: docente;
  cantTotal, cantLocalidad, max1, max2: integer;
  nMax1, nMax2, escActual, locActual: string;
begin
  max1:= -1; max2:= -1; nMax1:= '(ninguna, falta info)'; nMax2:= '(ninguna, falta info)'; cantTotal:= 0; 

  writeln('ingrese el codigo del proyecto: '); readln(pro.cod);
  if (pro.cod <> -1) then
    writeln('ingrese la localidad: '); readln(pro.localidad);
  locActual:= pro.localidad;
  while (pro.cod <> -1) and (locActual = pro.localidad) do                      // loop LOCALIDAD y cod
    begin
      cantLocalidad:= 0;
      writeln('ingrese la escuela: '); readln(pro.escuela);
      escActual:= pro.escuela;
      cantTotal:= cantTotal + 1;
      while (escActual = pro.escuela) do                                    // loop ESCUELA 
        begin 
          cantLocalidad:= cantLocalidad + 1;
          leerPro(pro); 
          maximos(pro.cantAlu, pro.escuela, max1, max2, nMax1, nMax2);
          if (pro.localidad = 'daireaux') then
            daireaux(pro.cod, pro.titulo);
          writeln('ingrese la escuela: '); readln(pro.escuela);
        end;                                                              // termina loop ESCUELA
      writeln('la cantidad de escuelas de la localidad ' ,locActual, ' fue de ' ,cantLocalidad);
      writeln('ingrese el codigo del proyecto: '); readln(pro.cod);                     
      if (pro.cod <> -1) then
        writeln('ingrese la localidad: '); readln(pro.localidad); 
      leerPro(pro);  
    end;                                                            // termina loop LOCALIDAD
  writeln('la cantidad total de escuelas leidas fue de: ' ,cantTotal);
  writeln('la escuela con mayor cantidad de alumnos fue ' ,nMax1, ' y la que le sigue en participantes fue ' ,nMax2);
end.
