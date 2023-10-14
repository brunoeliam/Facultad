(* a. Realizar un módulo que reciba como parámetro un número entero y retorne la cantidad de digitos que posee y la suma de los mismos.
b. Utilizando el modulo anterior, realizar un programa que lea una secuencia de números e imprima la cantidad total de digitos leídos. La lectura finaliza al leer un número cuyos dígitos suman exactamente 10, el cual debe procesarse.
*)

program ej7;
procedure sumador(num: integer; var digitos, suma: integer);
var
  ultimoDigito, resto: integer;
  begin 
    suma:= 0;
    digitos:= 0;
    while (num <> 0) do 
      begin
        digitos:= digitos + 1;
        ultimoDigito:= num mod 10;
        suma:= suma + ultimoDigito;
        num:= num div 10;
      end;
  end;

var
num, digitos, suma, totalDigitos: integer;
begin 
  suma:= 0;
  digitos:= 0;
  totalDigitos:= 0;
  repeat
    WriteLn('ingrese un numero ');
    ReadLn(num); 
    sumador(num, digitos, suma);
    totalDigitos:= totalDigitos + digitos;
  until (suma = 10);
  WriteLn('el total de digitos leidos fue de ' ,totalDigitos);
end.