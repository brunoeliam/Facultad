(* Se desea almacenar en memoria una secuencia de 2500 nombres de ciudades, cada nombre podrá tener
una longitud máxima de 50 caracteres.
a) Definir una estructura de datos estática que permita guardar la información leída. Calcular el tamaño
de memoria que requiere la estructura.*) 
dentro de type:
  str = string[50];
  vector = array[1..2500] of str; 
  esto ocuparia 2500 * 51, es decir 127500 bytes

(* b) Dado que un compilador de Pascal típico no permite manejar estructuras de datos estáticas que
superen los 64 Kb, pensar en utilizar un vector de punteros a palabras, como se indica en la siguiente
estructura: *)
program ej7;
Type 
  Nombre = String[50];
  Puntero = ^Nombre;
  ArrPunteros = array[1..2500] of Puntero;
Var
  Punteros: ArrPunteros;
(*b.1) Indicar cuál es el tamaño de la variable Punteros al comenzar el programa.*)    10000 bytes
(*b.2) Escribir un módulo que permita reservar memoria para los 2500 nombres. ¿Cuál es la cantidad de
memoria reservada después de ejecutar el módulo? ¿La misma corresponde a memoria estática o
dinámica? *)   
var i: integer;  
for i:= 1 to 2500 do
   new(Punteros[i]);

memoria reservada va a ser 10000 en la memoria dinamica
(*b.3) Escribir un módulo para leer los nombres y almacenarlos en la estructura de la variable Punteros *)
este me lo copie:
procedure leerNombre (arrP: ArrPunteros);
var
  i: integer;
begin
	for i:= 1 to 2500
		readln(arrP[i]^);
end;