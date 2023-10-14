{ Escribir un programa que:
a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee
código de producto, fecha y cantidad de unidades vendidas. La lectura finaliza con el código de
producto 0. Un producto puede estar en más de una venta. Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendida.
Nota: El módulo debe retornar los dos árboles.

b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto. 
c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto. }
program ej2;

type
	venta = record
		codigo: integer;
		fecha: integer;
		cant: integer;
	end;
	
	arbol = ^nodo;
	
	nodo = record
		dato: venta;
		HI: arbol;
		HD: arbol;
	end;

procedure leerVenta (var v: venta);
begin
	readln(v.codigo);
	if (v.codigo <> 0) then begin
		readln(v.fecha);
		readln(v.cant);
	end;
end;

procedure agregar (var a: arbol; v: venta);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:= v;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else 
		if (v.codigo <= a^.dato.codigo) then
			agregar(a^.HI, v)
		else 
			agregar(a^.HD, v);
end;

procedure generarArbol (var a: arbol);
var v: venta;
begin
	leerVenta(v);
	while (v.codigo <> 0) do begin
		agregar (a, v);
		leerVenta(v);
	end;
end;


// programa principal
var
	a: arbol;
begin
	a = nil;
	generarArbol (a);			// a) i)
end.