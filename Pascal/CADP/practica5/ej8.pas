(* Analice el siguiente programa: *)

program ej8;
type
  datos = array [1..20] of integer;
  punt = ^datos;

procedure procesarDatos(v: datos; var v2: datos);
var
i, j: integer;
  begin
    for i:= 1 to 20 do
      v2[21 - i]:= v[i];
  end;
  
var
  vect: datos;
  pvect: punt;
  i: integer;
begin
  for i:= 1 to 20 do
    vect[i]:= i;
  new(pvect);
  for i:= 20 downto 1 do
    pvect^[i]:= 0;
  procesarDatos(pvect^, vect);
  writeln('fin');
end.

(* Responda: ¿cuánta memoria en total ocupa el programa al ejecutarse? Considere tanto variables estáticas
como dinámicas, parámetros y variables locales de los módulos.
a) Hasta la sentencia de la línea 18     46 en estatica, dinamica: 0 (ACA IMPORTANTE CONTE SOLO LAS VARIABLES LOCALES AL PROGRAMA PRINCIPAL)
b) Hasta la sentencia de la línea 20     estatica: 46   dinamica: 0
c) Hasta la sentencia de la línea 23     estatica: 46   dinamica: 40
d) Hasta la sentencia de la línea 11     estatica:    dinamica:   ???????????
e) Hasta la sentencia de la línea 25     estatica: 46   dinamica: 40 
agregar que yo aca no lo hice, pero si dice considere tanto variables etc eso que dice se deberia sumar capaz lo que esta en el modulo y por cada parametro tamb, en este caso 80 con parametros y 4 mas por las variables locales al procedure que aparece. tamb podria ser otra sumar todo todo y no separar en dinamica y estatica *)
