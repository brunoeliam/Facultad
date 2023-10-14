Program Ej3;
const 
	mil=5;
  cond=0;
  fin= -1;


type 
	long = 1..mil;
  
  tabla = record 
  	precio: real;
    stock: integer;
  end;
  
  detalles = record
  	codProd: integer;
    cantidad: integer;
    unitario: real;
  end;
  
  ticket = record
  	codVenta: integer;
  	detalle: detalles;
    total: real;
  end;
    
	vector = array [long] of tabla;
  
  lista = ^Nodo;
  
  Nodo = record
  	dato: ticket;
    sig: lista;
 	end;

procedure LeerTabla (var v: vector);
var i: integer; 
begin
	For i:=1 to mil do begin 
 		readln (v[i].precio);
  	readln (v[i].stock);
	end;
end;

function Calcular (codigo, cant: integer; v: vector): real;
begin
	if (v[codigo].stock < cant) then
  	Calcular:= v[codigo].precio * v[codigo].stock
  else  
		Calcular:= v[codigo].precio*cant;
end;


procedure LeerVenta (var t: ticket);
var 
	v: vector;
  tot: real;
begin
	tot:=0;
	readln (t.codVenta);
  if (t.codVenta <> fin) then begin 
  	readln (t.detalle.cantidad);
  	while (t.detalle.cantidad <> cond) do begin     
  		readln (t.detalle.codProd);
    	readln (t.detalle.cantidad);
      tot:= tot + Calcular(t.detalle.codProd,t.detalle.cantidad,v);
  	end;
  end;
end;

procedure agregarAdelante (var L: lista; t: ticket);
var	nue: lista;
begin
	new(nue);
  nue^.dato:= t;
  nue^.sig:= L;
  L:= nue;
end;

procedure Insertar (var L: lista);
var 
	t: ticket;
begin
	 LeerVenta (t);
	 while (t.codVenta <> fin) do begin
		agregarAdelante(L, t);
		LeerVenta (t);
	 end;
end;

procedure IncisoC (L: lista; a: integer);
var tot: integer; act: lista;
begin 
	tot:= 0;
  act:= L;
  while (act <> nil) do begin
  	if (act^.dato.detalle.codProd = a) then 
    	tot:= tot + act^.dato.detalle.cantidad;
    act:= act^.sig;
  end;
end;

var 
	v: vector;
    L: lista;
    codDeProducto:integer;
begin
	L:= nil;
	LeerTabla (v);
	Insertar (L);
	readln (codDeProducto);
	IncisoC (L,codDeProducto);
end.
