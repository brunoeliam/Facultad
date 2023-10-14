(* Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1 (que no
debe procesarse) e informe:
a. la cantidad de ocurrencias de cada dígito procesado.
b. el dígito más leído.
c. los dígitos que no tuvieron ocurrencias.
Por ejemplo, si la secuencia que se lee es: 63 34 99 94 96 -1, el programa deberá informar:
Número 3: 2 veces
Número 4: 2 veces
Número 6: 2 veces
Número 9: 4 veces
El dígito más leído fue el 9.
Los dígitos que no tuvieron ocurrencias son: 0, 1, 2, 5, 7, 8 *)

program ej7;
type
  dig = 0..9;
  contador = array [dig] of integer;

procedure inicializar (var v: contador);
var i: dig;
  begin
    for i:= 0 to 9 do 
      v[i]:= 0;
  end;

procedure descomponer (var v: contador; num: integer);
var resto: dig;
  begin
    while (num <> 0) do begin
      resto:= num mod 10;
      v[resto]:= v[resto] + 1;
      num:= num div 10;
    end;
  end;

function calcularMax (v: contador): integer;
var i: dig; masLeido, max: integer;
  begin
    masLeido:= -1;
    for i:= 0 to 9 do
      begin
        if (v[i] > masLeido) then
          begin
            masLeido:= v[i];
            max:= i;
          end;
      end;
    calcularMax:= max;
  end;

procedure informar (v: contador; max: dig);
var i: dig;
  begin
    for i:= 0 to 9 do 
      writeln('Numero ' , i , ': ' , v[i] , ' veces');
    writeln('El digito mas leido fue el ' ,max);  
    writeln('Los digitos que no tuvieron ocurrencias fueron: ');  
  end;

procedure sinOcu (v: contador);
var
  i: dig;
begin
  for i:= 0 to 9 do
    if (v[i] = 0) then begin
      write(i ,', ');
    end;
end;

var
v: contador;
num: integer;
max: dig;

begin
  inicializar(v);
  writeln('ingrese un numero '); read(num);
  while (num <> -1) do 
    begin
      descomponer(v, num);
      writeln('ingrese otro numero '); read(num);
    end;
  max:= calcularMax(v);
  informar(v, max);
  sinOcu(v);
end.