(* Realizar un programa que lea números y que utilice un módulo recursivo que escriba el
equivalente en binario de un número decimal. El programa termina cuando el usuario ingresa
el número 0 (cero).
Ayuda: Analizando las posibilidades encontramos que: Binario (N) es N si el valor es menor a 2.
¿Cómo obtenemos los dígitos que componen al número? ¿Cómo achicamos el número para la
próxima llamada recursiva? Ejemplo: si se ingresa 23, el programa debe mostrar: 10111. *)

Program ej6;
const 
	fin= 0;
	
procedure Equivalente (num: integer): integer;
begin 																																																											
		if (num < 2) then
    	writeln(num)
    else begin
    	Equivalente (num div 2);
		writeln(num mod 2)
    end;
end;

//123

var 
num: integer;

begin 
	writeln ('Ingrese un num:');
	readln (num);
	while (num<>fin) do begin
  	writeln (Equivalente (num));
    readln ();
  end;

end;
