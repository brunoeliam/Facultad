(* Realizar un programa modularizado que lea secuencia de números enteros. La lectura finaliza cuando llega el número 123456, el cual no debe procesarse. Informar en pantalla para cada número la suma de sus dígitos pares y la cantidad de dígitos impares que posee.
*)

program ej8;
procedure paresImpares(num: integer; var sumaPares, cantImpares: integer);
var
  ultimoDigito: integer;
  begin 
    sumaPares:= 0;
    cantImpares:= 0;
    while (num <> 0) do 
      begin
        ultimoDigito:= num mod 10;
        if ((ultimoDigito mod 2) <> (0)) then     // es impar
          cantImpares:= cantImpares + 1
        else                            // es par
          sumaPares:= sumaPares + ultimoDigito;
        num:= num div 10;
      end;
  end;

var
num, cantImpares, sumaPares: integer;
begin 
  sumaPares:= 0;
  cantImpares:= 0;
  writeln('ingrese un numero '); readln(num);
  while (num <> 1234) do 
  begin
    paresImpares(num, sumaPares, cantImpares);
    writeln('la suma de sus digitos pares es ' ,sumaPares, ' y la cantidad de digitos impares es de ' ,cantImpares);
    writeln('ingrese un numero '); readln(num);
  end;
end.