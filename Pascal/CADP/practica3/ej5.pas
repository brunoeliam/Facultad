(* 5. Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se lee: marca, modelo y precio. La lectura finaliza cuando se ingresa la marca 'ZZZ' que no debe procesarse. La información se ingresa ordenada por marca. Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro. *)

program ej5;
type
  auto = record
  marca: string;
  modelo: string;
  precio: integer;
  end;

type 
  autoMax = record
  marca: string;
  modelo: string;
  precio: integer;
  end;

procedure leer(var a: auto);
  begin
      writeln('ingrese el modelo '); readln(a.modelo);
      writeln('ingrese el precio del vehiculo '); readln(a.precio);
  end;

procedure calcularMax(a: auto; var aMax: autoMax);
  begin
    if (a.precio > aMax.precio) then
      begin
        aMax.precio:= a.precio;
        aMax.marca:= a.marca;
        aMax.modelo:= a.modelo;
      end;
  end;

function promedio(precioMarca: real; cant: integer): real;
  begin
    promedio:= precioMarca / cant;
  end;

var
a: auto;
aMax: autoMax;
cant: integer;
marcaActual: string;
precioMarca: real;

begin
  aMax.marca:= '';
  aMax.modelo:= '';
  aMax.precio:= -1;

  writeln('ingrese la marca del auto '); readln(a.marca);
  while (a.marca <> 'ZZZ') do 
  begin
    marcaActual:= a.marca;
    cant:= 0;
    precioMarca:= 0;
    while (a.marca <> 'ZZZ') and (marcaActual = a.marca) do
    begin
    leer(a);
    cant:= cant + 1;
    precioMarca:= precioMarca + a.precio;
    calcularMax(a, aMax);
    writeln('ingrese la marca del auto '); readln(a.marca);
    end;
    writeln('el precio promedio de la marca ' ,marcaActual, ' fue de ' ,promedio(precioMarca, cant):2:2);
  end;
  writeln('el auto mas caro leido fue el ' ,aMax.modelo, ' de la marca ' ,aMax.marca);
end.