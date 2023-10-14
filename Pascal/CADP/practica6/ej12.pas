{ Una empresa desarrolladora de juegos para teléfonos celulares con Android dispone de información de todos los dispositivos que poseen sus juegos instalados. De cada dispositivo se conoce la versión de Android
instalada, el tamaño de la pantalla (en pulgadas) y la cantidad de memoria RAM que posee (medida en GB). La información disponible se encuentra ordenada por versión de Android. Realizar un programa que procese la información disponible de todos los dispositivos e informe:
a. La cantidad de dispositivos para cada versión de Android.
b. La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo 5 pulgadas.
c. El tamaño promedio de las pantallas de todos los dispositivos. }

program ej12;
type
  dispositivo = record
  version: real;
  tamanioP: real;
  cantRam: integer;
  end;

  lista = ^nodo;

  nodo = record
  dato: dispositivo;
  sig: lista;
  end;

procedure leerDispositivo (var d: dispositivo);
  begin
    writeln('version: '); readln(d.version);
    if (d.version <> 0) then begin
      writeln('tamanio de pantalla: '); readln(d.tamanioP);
      writeln('cantidad de memoria RAM: '); readln(d.cantRam);
    end;
  end;

procedure insertarOrdenado (var l: lista; d: dispositivo);
var nue, ant, act: lista;
  begin
    new(nue); nue^.dato:= d;
    act:= l; ant:= l;

    while (act <> nil) and (act^.dato.version < d.version) do begin
      ant:= act;
      act:= act^.sig;
    end;
    if (ant = act) then
      l:= nue
    else 
      ant^.sig:= nue;
    nue^.sig:= act;
  end;

procedure cargarLista(var l: lista);
var d: dispositivo;
  begin
    leerDispositivo(d);
    while (d.version <> 0) do begin
      insertarOrdenado(l, d);
      leerDispositivo(d);
    end;
  end;

function cumple (d: dispositivo): boolean;
  begin
    cumple:= (d.cantRam > 3) and (d.tamanioP <= 5);
  end;

procedure procesar (l: lista);
var cantV, cantCumple, cantTotal: integer;
    vActual, tamanioTotal: real;
  begin
    cantCumple:= 0;
    cantTotal:= 0;
    tamanioTotal:= 0;
    while (l <> nil) do begin
      cantV:= 0;
      vActual:= l^.dato.version;
      while (l <> nil) and (vActual = l^.dato.version) do begin
        cantV:= cantV + 1;
        tamanioTotal:= tamanioTotal + l^.dato.tamanioP;
        if (cumple(l^.dato)) then
          cantCumple:= cantCumple + 1;
        l:= l^.sig;
      end;
      writeln('cant d dispositivos con version ' ,vActual:2:2, ': ' ,cantV);
      cantTotal:= cantTotal + cantV;
    end;
    writeln('cantidad que cumplen con el inciso b ' ,cantCumple);
    writeln('tamanio promedio de las pantallas de todos: ' ,(tamanioTotal / cantTotal):2:2);
  end;

var
  l: lista;
begin
  l:= nil;
  cargarLista(l);
  procesar(l);
end.
