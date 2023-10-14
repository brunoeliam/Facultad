(* Una compañía de telefonia celular debe realizar la facturacion mensual de sus 9300 clientes con planes de
consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de cliente y
cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de minutos consumidos
y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos de los clientes de
la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:
a. Realizar un módulo que lea la información de una línea de teléfono.
b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando el
módulo desarrollado en el inciso a. ) y retorne la cantidad total de minutos y la cantidad total de MB a facturar
del cliente.
Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta $1,35 *)
program ej4;
const 
minuto = 3.40;
mbyte = 1.35;
type 
  linea = record
    num: integer;
    minCon: real;
    mbCon: real;
  end;

  cliente = record
    cod: integer;
    cantL: linea;
  end;

procedure leerLinea(var lin: linea);
  begin
    writeln('ingrese el numero de telefono '); readln(lin.num);
    writeln('ingrese los minutos consumidos '); readln(lin.minCon);
    writeln('ingrese los MB consumidos '); readln(lin.mbCon);
  end;

procedure leerCliente(var cli: cliente; var mb, min: real);
  begin
    writeln('ingrese el codigo de cliente '); readln(cli.cod);
    leerLinea(cli.cantL); 
    min:= cli.cantL.minCon * minuto;
    mb:= cli.cantL.mbCon * mbyte;
  end;

var
  i: integer;
  mb, min: real;
  cli: cliente;
begin
  mb:= 0;
  min:= 0;
  for i:= 1 to 2 do
    begin
      leerCliente(cli, mb, min);
      writeln('la cantidad a facturar de mb de este cliente es de ' , mb:2:2, ' y ', min:2:2 ,' por sus minutos consumidos');
    end;
end.