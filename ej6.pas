(*
Realizar un programa modularizado que lea datos de 100 productos de una tienda de ropa. Para cada producto debe leer el precio, código y tipo (pantalón, remera, camisa, medias, campera, etc.). 
Informar: 
- Código de los dos productos más baratos.
- Código del producto de tipo “pantalón” más caro.
- Precio promedio 
*)
program ej6;

procedure baratos (codigo: integer; precio: real; var min1, min2: real; var codigoMin1, codigoMin2: integer);
  begin
		if (precio < min1) then	
			begin
				min2:= min1;
				min1:= precio;
				codigoMin2:= codigoMin1;
				codigoMin1:= codigo;
			end
		else if (precio < min2) then
			begin
				min2:= precio;
				codigoMin2:= codigo;
			end
  end;

function calcularPromedio (cant: integer; totalPlata: real): real;
	begin
			calcularPromedio:= totalPlata / cant;
	end;

function lompaCaro (precio, max: real): boolean;
	begin
		if (precio > max) then
			lompaCaro:= true
		else
			lompaCaro:= false;
	end;

var
  i, codigo, codigoMin1, codigoMin2, codigoLompa, cant: integer;
  precio, max, min1, min2, totalPlata: real;
	tipo: string;
begin
	max:= -1;
  min1:= 9998;
  min2:= 9999;
	totalPlata:= 0;
	cant:= 0;
	codigoMin1:= 0;
	codigoMin2:= 0;

  for i:= 1 to 5 do 
   begin
     WriteLn('escriba a continuacion: el precio, codigo y tipo de producto: ');
     ReadLn(precio); ReadLn(codigo); ReadLn(tipo);
		 cant:= cant + 1;
		 totalPlata:= precio + totalPlata;
		 baratos(codigo, precio, min1, min2, codigoMin1, codigoMin2);
		 if (tipo = 'pantalon') then 
		 	begin
				if lompaCaro(precio, max) then 
					max:= precio;
					codigoLompa:= codigo;
			end;
   end;
	
	writeln('el codigo del producto mas barato es: ' ,codigoMin1, ' y el del segundo mas barato es ' ,codigoMin2);
	writeln('el codigo del pantalon mas caro es ' ,codigoLompa);
	writeln('el precio promedio de los productos es de ' ,calcularPromedio(cant, totalPlata):2:2);
end.