{ Se desea procesar la información de las ventas de productos de un comercio (como máximo
50). Implementar un programa que invoque los siguientes módulos:
a. Un módulo que retorne la información de las ventas en un vector. De cada venta se conoce el
día de la venta, código del producto (entre 1 y 15) y cantidad vendida (como máximo 99
unidades). El código debe generarse automáticamente (random) y la cantidad se debe leer. El
ingreso de las ventas finaliza con el día de venta 0 (no se procesa).
b. Un módulo que muestre el contenido del vector resultante del punto a).
c. Un módulo que ordene el vector de ventas por código.
d. Un módulo que muestre el contenido del vector resultante del punto c).
e. Un módulo que elimine, del vector ordenado, las ventas con código de producto entre dos
valores que se ingresan como parámetros.
f. Un módulo que muestre el contenido del vector resultante del punto e).
g. Un módulo que retorne la información (ordenada por código de producto de menor a
mayor) de cada código par de producto junto a la cantidad total de productos vendidos.
h. Un módulo que muestre la información obtenida en el punto g ). }

program ej1;
const
  max = 99;
  dimF = 50;
type 
  longCant = 1..max;
  longCod = 1..15;

  venta = record
    dia: integer;
    cod: longCod;
    cant: longCant;
  end;

  vector = array [1..dimF] of venta;
  vectorG = array [1..7] of integer;

procedure leerVenta (var ven: venta);
begin
  writeln('dia de venta: '); readln(ven.dia);
  if (ven.dia <> 0) then begin
    ven.cod:= random(15);
    writeln('cantidad vendida: '); readln(ven.cant);
  end;
end;

procedure cargarVector (var v: vector; var dimL: integer);
var ven: venta;
begin
  leerVenta(ven);
  while (dimL < dimF) and (ven.dia <> 0) do begin
    dimL:= dimL + 1;
    v[dimL]:= ven;
    leerVenta(ven);
  end;
end;

procedure incisoB (v: vector; dimL: integer);        // iterativo
var i: integer;
begin
  for i:= 1 to dimL do begin
    writeln('dia: ', v[i].dia);
    writeln('codigo: ', v[i].cod);
    writeln('cantidad: ', v[i].cant);
  end;
end;

procedure incisoC (var v: vector; dimL: integer);   // seleccion
var i, j, pos: integer; item: venta;	
begin
  for i:= 1 to (dimL - 1) do begin      {busca el mínimo y guarda en pos la posición}
      pos:= i;
      for j:= (i + 1) to dimL do
          if (v[j].cod < v[pos].cod) then pos:= j;

      { intercambia v[i] y v[p] }
      item:= v[pos];   
      v[pos]:= v[i];   
      v[i]:= item;
  end;
end;

procedure incisoD (v: vector; dimL: integer; var i: integer);   // recursivo
begin
    if (i < dimL) then begin
      i:= i + 1;
      writeln('dia: ' ,v[i].dia);
      writeln('codigo: ' ,v[i].cod);
      writeln('cant: ' ,v[i].cant);
      incisoD(v, dimL, i);
    end;
end;

procedure inicializar (var vG: vector);
var i: integer;
begin
  for i:= 1 to 7 do
    vG[i]:= 0;
end;

procedure incisoG (var vG: vector; v: vector; dimL: integer);
var i: integer;
begin
  inicializar(vG);
  for i:= 1 to dimL do begin
    if (((v[i].cod) mod 2) = 0) then begin
      vG[(v[i].cod) div 2]:= vG[(v[i].cod) div 2] + v[i].cant;
  end;
end;
// p. principal 
var
  v: vector; 
  dimL, i: integer;
  vG: vectorG;
begin
  randomize;
  cargarVector(v, dimL);
  //incisoB(v, dimL);
  incisoC(v, dimL);
  i:= 0;
  incisoD(v, dimL, i);
  incisoG(vG, v, dimL);
end.