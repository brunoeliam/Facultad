{ Realizar un programa que lea y almacene la información de productos de un supermercado. De cada
producto se lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se ingresa
el código -1, que no debe procesarse. Una vez leída y almacenada toda la información, calcular e informar:
a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
c. Código de los dos productos más económicos. }
program ej5; 
type
  producto = record
  codigo: integer;
  desc: string;
  stockAct: integer;
  stockMin: integer;
  precio: real;
  end;

  lista = ^nodo;

  nodo = record
  dato: producto;
  sig: lista;
  end;

procedure leerProducto (var p: producto);
begin
  writeln('codigo de producto: '); readln(p.codigo);
  if (p.codigo <> -1) then begin
    writeln('descripcion: '); readln(p.desc);
    writeln('stock actual: '); readln(p.stockAct);
    writeln('stock minimo: '); readln(p.stockMin);
    writeln('precio: '); readln(p.precio);
  end;
end;

procedure agregarAdelante (var l: lista; p: producto);
var aux: lista;
begin
  new(aux);
  aux^.dato:= p;
  aux^.sig:= l;
  l:= aux;
end;

procedure cargarLista (var l: lista);
var p: producto;
begin
  leerProducto(p);
  while (p.codigo <> -1) do begin
    agregarAdelante(l, p);
    leerProducto(p);
  end;
end;

procedure stock (actual, minimo: integer; var cantDebajo: integer);                     // A)
begin
  if (actual < minimo) then
    cantDebajo:= cantDebajo + 1;
end;


function describir (codigo: integer): boolean;                                          // B)
var 
 dig, cant: integer;
 cumple: boolean;
begin
  cant:= 0;
  cumple:= false;
  while (codigo <> 0) do begin
    dig:= codigo mod 10;
    if ((dig mod 2) = 0) then
      cant:= cant + 1;
    codigo:= codigo div 10;
  end;
  if (cant >= 3) then
    cumple:= true
  else
    cumple:= false;

  describir:= cumple;
end;

procedure minimos (l: lista; var min1, min2: real; var codMin1, codMin2: integer);      // C)
var aux: lista;
begin
    aux:= l;
    if (aux^.dato.precio < min1) then begin
      min2:= min1;
      codMin2:= codMin1;
      min1:= aux^.dato.precio;
      codMin1:= aux^.dato.codigo;
    end
    else if (aux^.dato.precio < min2) then begin
      min2:= aux^.dato.precio;
      codMin2:= aux^.dato.codigo;
    end;
end;

procedure imprimir (porcentaje: real; codMin1, codMin2: integer);
begin
  writeln('porcentaje con stock actual por debajo de su stock minimo: ' ,porcentaje:2:2, '%');
  writeln('el mas economico fue el producto con codigo ' ,codMin1, ' y el segundo mas barato fue el del codigo ' ,codMin2);
end;

procedure recorrer (l: lista);
var
 aux: lista;
 min1, min2, porcentaje: real;
 total, cantDebajo, codMin1, codMin2: integer;
begin
  min1:= 9997.95; min2:= 9999.99; total:= 0; cantDebajo:= 0;
  aux:= l; 
  while (aux <> nil) do begin
    total:= total + 1;
    stock(aux^.dato.stockAct, aux^.dato.stockMin, cantDebajo);
    minimos(aux, min1, min2, codMin1, codMin2);
    if (describir(aux^.dato.codigo)) then
      writeln('cumplio el de la descripcion: ' ,aux^.dato.desc);
    aux:= aux^.sig;
  end;
  porcentaje:= (cantDebajo * 100) / total;
  imprimir(porcentaje, codMin1, codMin2);
end;

var
  pri: lista;
begin
  pri:= nil; 
  cargarLista(pri);
  recorrer(pri);
end.